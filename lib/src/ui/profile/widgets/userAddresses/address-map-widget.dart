import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:search_map_place/search_map_place.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddressMapWidget extends StatefulWidget {
  final Widget map;
  final GoogleMapController mapController;

  final Function() closeMapPanelState;
  final Function(LatLng) confirmLocation;

  AddressMapWidget({
    Key key,
    this.map,
    this.closeMapPanelState,
    this.confirmLocation,
    this.mapController,
  }) : super(key: key);

  @override
  _AddressMapWidgetState createState() => _AddressMapWidgetState();
}

class _AddressMapWidgetState extends State<AddressMapWidget> {
  PanelController panelController;
  GoogleMapController _mapController;

  FocusNode inputNode;
  TextEditingController textEditingController;
  Widget _map;
  //
  // Map<String, String> metadata = Map();
  //

  @override
  void initState() {
    panelController = new PanelController();
    inputNode = FocusNode();
    _map = widget.map;
    // _mapController = widget.mapController;
    textEditingController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    //
    return SlidingUpPanel(
      controller: panelController,
      isDraggable: false,
      minHeight: 0,
      maxHeight: _screenSize.height,
      backdropEnabled: true,
      panel: Container(
        child: Column(
          children: [
            SearchMapPlaceWidget(
                hasClearButton: true,
                placeType: PlaceType.address,
                placeholder: 'محل مورد نظرتان کجاست ؟',
                apiKey:
                    'AIzaSyDseIH-ZnfQaeAXvR0vaRXKGbrnUqr5s2I', // YOUR GOOGLE MAPS API KEY
                iconColor: MAIN_BLUE_COLOR,
                onSelected: (Place place) async {
                  await place.geolocation.then(
                    (newGeolocation) async {
                      await createGoogleMap(newGeolocation.coordinates)
                          .then((newMap) {
                        panelController.close();
                        // widget.mapController.animateCamera(
                        //       CameraUpdate.newLatLng(
                        //           newGeolocation.coordinates));
                        setState(() {
                          _map = newMap;
                        });
                      });
                      widget.confirmLocation(newGeolocation.coordinates);
                      // });
                    },
                  );
                }),
          ],
        ),
      ),
      body: Container(
        height: _screenSize.height,
        width: _screenSize.width,
        child: Column(
          children: [
            SearchAppBarWidget(
              preTitle: 'محل مورد نظرتان کجاست ؟',
              title: '',
              icon: GlobalSvgImages.rightIcon,
              onTapIcon: () => widget.closeMapPanelState(),
              openRealSearchPanel: (bool panelIsOpen, BuildContext context) =>
                  panelController.open(),
            ),
            Stack(
              children: [
                Container(
                  height: _screenSize.height - 80,
                  width: _screenSize.width,
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                      height: _screenSize.height,
                      child: _map,
                      // child: widget.map,
                    ),
                  ),
                ),
                Positioned(
                  top: (_screenSize.height / 2) - 20 - 60,
                  left: (_screenSize.width / 2) - 20,
                  child: Icon(
                    Icons.location_on,
                    color: MAIN_BLUE_COLOR,
                    size: 40,
                  ),
                ),
                Positioned(
                  bottom: 25,
                  right: 25,
                  left: 25,
                  child: AvakatanButtonWidget(
                    backgroundColor: MAIN_BLUE_COLOR,
                    textColor: Colors.white,
                    borderColor: Colors.transparent,
                    title: 'تایید',
                    height: 40,
                    onTap: () {},
                    radius: 5,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  Future<Widget> createGoogleMap(LatLng latLng) async {
    print('0.0.0 latlng : $latLng');
    GoogleMap newMap = GoogleMap(
      onMapCreated: onMapCreated,
      // scrollGesturesEnabled: false,

      mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: latLng,
        zoom: latLng.latitude != null ? 16 : 14,
      ),
    );
    // _mapController.animateCamera(CameraUpdate.newLatLng(latLng));
    return newMap;
  }
}
