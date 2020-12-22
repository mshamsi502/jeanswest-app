//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    5th October - 05/10/2020     _     13:45:38
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'info_branch_widgets/info_branch_widget.dart';

// ignore: must_be_immutable
class GoogleMapWidget extends StatefulWidget {
  final List<Branch> getedBranches;
  Branch selectedBranch;
  bool isSelectedBranch;
  final double dpiSize;

  GoogleMapWidget(
      {this.getedBranches,
      this.selectedBranch,
      this.isSelectedBranch,
      this.dpiSize});
  @override
  State<StatefulWidget> createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget>
    with WidgetsBindingObserver {
  GoogleMapController mapController;
  //
  Set<Marker> markers;

  List<Branch> branches;
  bool isSelectedBranch;
  Branch selectedBranch;
  Branch closerBranch;
  //
  double cameraLatitude;
  double cameraLongitude;
  double cameraZoom;
  CameraPosition initCameraPosition;
  CameraPosition userCameraPosition;
  //
  PanelController panelController;
  //
  bool isInit;
  //
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    print('!!! !!! AppLifecycleState : $state');
    if (state == AppLifecycleState.resumed) {
      setState(() {
        if (mapController != null) mapController.setMapStyle('[]');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    isInit = true;
    //
    // ignore: deprecated_member_use
    branches = new List<Branch>();
    markers = new Set<Marker>();
    isSelectedBranch = false;

    panelController = new PanelController();
    //
    cameraLatitude = 35.755189;
    cameraLongitude = 51.333883;
    cameraZoom = 12.15;
    initCameraPosition = CameraPosition(
        target: LatLng(cameraLatitude, cameraLongitude), zoom: cameraZoom);
    provideBranchesOnMap();

    //
    WidgetsBinding.instance.addObserver(this);
    //
  }

  Future<void> provideBranchesOnMap() async {
    branches = widget.getedBranches;

    //

    //

    userCameraPosition = await updateUserLocation();
    setState(() {
      closerBranch = getCloserBranch(branches, userCameraPosition);
    });
    Set<Marker> newMarkers = await onCreateMarkList(
        widget.dpiSize, branches, changeSelectedBranch, widget.selectedBranch);

    await Future.delayed(Duration(seconds: 3));
    setState(() {
      markers = newMarkers;
    });
    CameraPosition centerCameraPosition =
        getCenterCameraPosition(branches, userCameraPosition);
    updateCamera(centerCameraPosition);
    //
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isSelectedBranch = true;
      selectedBranch = closerBranch;
    });

    await updateSelectedBranch();
    await updateMarkers();
    // openInoBranch(widget.selectedBranch);
    panelController.animatePanelToPosition(1.0,
        duration: Duration(milliseconds: 500));
    // panelController.open();
  }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   mapController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    updateSelectedBranch();
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: SlidingUpPanel(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: Colors.transparent,
        controller: panelController,
        minHeight: 0,
        maxHeight: 180,
        // V1
        // backdropEnabled: true,
        // backdropOpacity: 0.2,
        // V1
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
              // height: screenSize.height - 100,
              height: screenSize.height - 140,
              child: GoogleMap(
                myLocationEnabled: true,
                mapToolbarEnabled: false,
                myLocationButtonEnabled: false,
                // zoomControlsEnabled: false,
                // zoomControlsEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: initCameraPosition,
                markers: markers,
                onMapCreated: onMapCreated,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(7),
                height: 43,
                width: 43,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: GestureDetector(
                  child: BranchSvgImages.myLocationIcon,
                  onTap: () async {
                    mapController.animateCamera(CameraUpdate.newCameraPosition(
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
    );
  }

  onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  updateCamera(CameraPosition _cameraPosition) {
    setState(() {
      cameraLatitude = _cameraPosition.target.latitude;
      cameraLongitude = _cameraPosition.target.longitude;
      cameraZoom = _cameraPosition.zoom;
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
    });
  }

  updateSelectedBranch() async {
    if (widget.selectedBranch != null &&
        ((panelController.isPanelClosed &&
                panelController.panelPosition == 0.0) ||
            (widget.selectedBranch.departmentInfoID !=
                this.selectedBranch.departmentInfoID))) {
      await panelController.animatePanelToPosition(0.0,
          duration: Duration(milliseconds: 50));
      await panelController.close();
      await closeInfoBranch();
      setState(() {
        this.selectedBranch = widget.selectedBranch;
        this.isSelectedBranch = widget.isSelectedBranch;
      });
      updateMarkers();
    }
    if (!this.isInit && this.selectedBranch != null) {
      openInoBranch(this.selectedBranch);
      panelController.animatePanelToPosition(1.0,
          duration: Duration(milliseconds: 500));
      // panelController.open();
    }
  }

  updateMarkers() async {
    print('_+_+_+_  : updating markers...');
    Set<Marker> newMarker = await onCreateMarkList(
        widget.dpiSize, branches, changeSelectedBranch, this.selectedBranch);

    setState(() {
      markers = new Set<Marker>();
      markers = newMarker;
    });
  }

  changeSelectedBranch(bool isSelectedBranch, Branch selectedBranch) async {
    // if (widget.selectedBranch != null &&
    //     ((panelController.isPanelClosed &&
    //             panelController.panelPosition == 0.0) ||
    //         selectedBranch.departmentInfoID !=
    //             this.selectedBranch.departmentInfoID)) {
    //   await panelController.animatePanelToPosition(0.0,
    //       duration: Duration(milliseconds: 50));
    //   closeInfoBranch();
    //   panelController.close();
    // }
    setState(
      () {
        isInit = false;
        widget.selectedBranch = selectedBranch;
        widget.isSelectedBranch = isSelectedBranch;
      },
    );
  }

  closeInfoBranch() async {
    setState(() {
      this.isSelectedBranch = false;
      this.selectedBranch = new Branch();
    });
    await new Future.delayed(const Duration(milliseconds: 10));
  }

  openInoBranch(Branch newBranch) {
    // panelController.open();
    updateCamera(
      CameraPosition(
        target: LatLng(
          double.parse(newBranch.lat),
          double.parse(newBranch.lng),
        ),
        zoom: 16,
      ),
    );
    print(
        'isSelectedBranch = = = = = $isSelectedBranch , ${newBranch.depName}');
  }
}
