// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/bloc/branch/events/selected_branch_event.dart';
import 'package:jeanswest/src/bloc/branch/main/selected_branch_bloc.dart';
import 'package:jeanswest/src/bloc/branch/states/selected_branch_state.dart';
import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'info_branch_widgets/info_branch_widget.dart';

// ignore: must_be_immutable
class GoogleMapWidget extends StatefulWidget {
  final List<Branch> getedBranches;
  final Branch initSelectedBranch;
  final bool initIsSelectedBranch;
  final double dpiSize;

  GoogleMapWidget({
    this.getedBranches,
    this.dpiSize,
    this.initSelectedBranch,
    this.initIsSelectedBranch,
  });
  @override
  State<StatefulWidget> createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget>
    with WidgetsBindingObserver {
  GoogleMapController mapController;
  Set<Marker> markers;
  List<Branch> branches;
  bool isSelectedBranch;
  Branch selectedBranch;
  Branch closerBranch;
  double cameraLatitude;
  double cameraLongitude;
  double cameraZoom;
  CameraPosition initCameraPosition;
  CameraPosition userCameraPosition;
  PanelController panelController;
  SelectedBranchBloc _selectedBranchBloc;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        if (mapController != null) mapController.setMapStyle('[]');
      });
    }
  }

  @override
  void initState() {
    super.initState();

    isSelectedBranch = widget.initIsSelectedBranch;
    selectedBranch = widget.initSelectedBranch;
    initCameraPosition =
        CameraPosition(target: LatLng(35.755189, 51.333883), zoom: 12.15);
    // ignore: deprecated_member_use
    branches = new List<Branch>();
    markers = new Set<Marker>();
    panelController = new PanelController();
    _selectedBranchBloc = BlocProvider.of<SelectedBranchBloc>(context);
    initialUpdateCameraPosition();
    branches = widget.getedBranches;
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return BlocListener<SelectedBranchBloc, SelectedBranchState>(
      listener: (context, selectedBranchState) {
        if (selectedBranchState is SelectedBranchUpdating) {
          setState(() {
            selectedBranch = selectedBranchState.selectedBranch;
            this.isSelectedBranch = true;
          });
          updateSelectedBranch(
              selectedBranch,
              CameraPosition(
                  target: LatLng(
                    double.parse(selectedBranch.lat),
                    double.parse(selectedBranch.lng),
                  ),
                  zoom: 16));
        } else if (selectedBranchState is SelectedBranchStable) {}
      },
      child: Container(
        child: SlidingUpPanel(
          margin: EdgeInsets.symmetric(
            vertical: 0.016 * _screenSize.height, //10

            horizontal: 0.027 * _screenSize.width, //10,
          ),
          color: Colors.transparent,
          controller: panelController,
          minHeight: 0,
          maxHeight: 180,
          panel: Container(
            color: Colors.transparent,
            child: this.isSelectedBranch
                ? InfoBranchWidget(
                    mapController: mapController,
                    selectedBranch: selectedBranch,
                    isCloserBranch: selectedBranch.departmentInfoID ==
                            closerBranch.departmentInfoID
                        ? true
                        : false,
                  )
                : Container(),
          ),
          body: Stack(
            children: [
              Container(
                height:
                    _screenSize.height - 0.15625 * _screenSize.height, //100,

                child: GoogleMap(
                  myLocationEnabled: true,
                  mapToolbarEnabled: false,
                  myLocationButtonEnabled: false,
                  zoomGesturesEnabled: true,
                  mapType: MapType.normal,
                  initialCameraPosition: initCameraPosition,
                  markers: markers,
                  onMapCreated: onMapCreated,
                ),
              ),
              Positioned(
                top: 0.016 * _screenSize.height, //10
                right: 0.027 * _screenSize.width, //10,
                child: Container(
                  padding: EdgeInsets.all(
                    0.0194 * _screenSize.width, //7,
                  ),
                  height: 0.1194 * _screenSize.width, //43,
                  width: 0.1194 * _screenSize.width, //43,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        0.138 * _screenSize.width, //50,
                      )),
                  child: GestureDetector(
                    child: BranchSvgImages.myLocationIcon,
                    onTap: () async {
                      mapController.animateCamera(
                          CameraUpdate.newCameraPosition(
                              await updateUserLocation()));
                      panelController.animatePanelToPosition(0.0,
                          duration: Duration(milliseconds: 50));
                      // panelController.close();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  updateCamera(CameraPosition _cameraPosition) async {
    setState(() {
      cameraLatitude = _cameraPosition.target.latitude;
      cameraLongitude = _cameraPosition.target.longitude;
      cameraZoom = _cameraPosition.zoom;
    });
    if (mapController != null)
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  initialUpdateCameraPosition() async {
    userCameraPosition = await updateUserLocation();
    CameraPosition centerCameraPosition =
        getCenterCameraPosition(branches, userCameraPosition);
    closerBranch = getCloserBranch(branches, userCameraPosition);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      selectedBranch = closerBranch;
    });
    updateSelectedBranch(selectedBranch, centerCameraPosition);
  }

  updateSelectedBranch(
      Branch _selectedBranch, CameraPosition _cameraPosition) async {
    panelController.animatePanelToPosition(0.0,
        duration: Duration(milliseconds: 500));
    updateCamera(_cameraPosition);
    Set<Marker> newMarkers = await onCreateMarkList(
        widget.dpiSize, branches, tapOnMarker, _selectedBranch);
    setState(() {
      markers = newMarkers;
      isSelectedBranch = true;
      selectedBranch = _selectedBranch;
      this.selectedBranch = _selectedBranch;
    });
    panelController.animatePanelToPosition(1.0,
        duration: Duration(milliseconds: 500));
    _selectedBranchBloc.add(FinishSelectedBranchEvent(_selectedBranch));
  }

  tapOnMarker(Branch _selectedBranch, CameraPosition _cameraPosition) {
    _selectedBranchBloc.add(SetSelectedBranchEvent(_selectedBranch));
    updateSelectedBranch(_selectedBranch, _cameraPosition);
  }
}
