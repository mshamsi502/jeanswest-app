import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
// import 'package:jeanswest/src/constants/global/userAllInfo/user-main-info.dart';
import 'package:search_map_place/search_map_place.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAddresses/single-address-text-detail-widget.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/models/address/address.dart';
//
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
// import 'package:jeanswest/src/ui/global/widgets/custom_dropdown_button_widget.dart';
// import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';

class SingleAddressDetailWidget extends StatefulWidget {
  final String title;
  final Address address;
  final int indexAddress;
  final PanelState mapPanelState;
  final bool isInitial;

  final Function() closeMapPanelState;
  final Function(int) changeSelected;
  final Function() closeEditPanel;
  final Function() disableIsInitial;
  SingleAddressDetailWidget({
    Key key,
    this.address,
    this.indexAddress,
    this.changeSelected,
    this.mapPanelState,
    this.title,
    this.closeEditPanel,
    this.closeMapPanelState,
    this.isInitial,
    this.disableIsInitial,
  }) : super(key: key);

  @override
  _SingleAddressDetailWidgetState createState() =>
      _SingleAddressDetailWidgetState();
}

class _SingleAddressDetailWidgetState extends State<SingleAddressDetailWidget> {
  ScrollController scrollController;
  PanelController panelController;
  Completer<GoogleMapController> mapController = Completer();
  //
  String selectedProvince;
  String selectedCity;
  bool recieverIsUser;
  List<String> availableCities;
  Widget map;
  //

  @override
  void initState() {
    scrollController = new ScrollController();
    panelController = new PanelController();
    selectedProvince = widget.address.province;
    availableCities = provinceCities[selectedProvince];
    selectedCity = widget.address.city;
    createGoogleMap(
      LatLng(
        widget.address.latitude ?? 35.7447,
        widget.address.longtitude ?? 51.3340,
      ),
    );
    recieverIsUser = widget.address.isUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SlidingUpPanel(
        defaultPanelState: widget.mapPanelState,
        controller: panelController,
        isDraggable: false,
        minHeight: 0,
        maxHeight: _screenSize.height,
        backdropEnabled: true,
        panel: Stack(
          children: [
            map,
            Positioned(
              top: 0.125 * _screenSize.height, //80,
              right: 0.041 * _screenSize.width, //15,
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
                    final GoogleMapController controller =
                        await mapController.future;
                    controller.animateCamera(
                      CameraUpdate.newCameraPosition(
                        await updateUserLocation(),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: (_screenSize.height / 2) - 0.031 * _screenSize.height, //20,
              left: (_screenSize.width / 2) - 0.0555 * _screenSize.width, //20,
              child: Icon(
                Icons.location_on,
                color: MAIN_BLUE_COLOR,
                size: 0.111 * _screenSize.width, //40,
              ),
            ),
            Positioned(
              bottom: 0.031 * _screenSize.height, //20,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(
                  left: 0.069 * _screenSize.width, //25,
                  right: 0.069 * _screenSize.width, //25,
                  bottom: 0.0506 * _screenSize.height, //30,
                  top: 0.015 * _screenSize.height, //10,
                ),
                child: AvakatanButtonWidget(
                  backgroundColor: MAIN_BLUE_COLOR,
                  textColor: Colors.white,
                  borderColor: MAIN_BLUE_COLOR,
                  hasShadow: false,
                  title: 'تایید',
                  height: 0.07 * _screenSize.height, //45,
                  width: _screenSize.width,
                  fontSize: 0.05 * _screenSize.width, //18,
                  radius: 0.011 * _screenSize.width, //4,
                  onTap: () {
                    // ! get center screen location
                    // ! return location and update Lat & Lng in Address
                    print('/*/*/ confirm location');
                    panelController.close();
                  },
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.0078 * _screenSize.height, //5,
                  horizontal: 0.027 * _screenSize.width, //10,
                ),
                width: _screenSize.width,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        color: Colors.white,
                        height: 0.0929 * _screenSize.height, //55,
                        width: 0.0625 * _screenSize.height, //40
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.027 * _screenSize.width, //10,
                          vertical: 0.0287 * _screenSize.height, //17
                        ),
                        child: GlobalSvgImages.rightIcon,
                      ),
                      onTap: () => panelController.close(),
                    ),
                    Expanded(
                      child: SearchMapPlaceWidget(
                          hasClearButton: true,
                          placeType: PlaceType.address,
                          language: 'fa',
                          placeholder: 'محل مورد نظرتان کجاست ؟',
                          apiKey:
                              'AIzaSyDseIH-ZnfQaeAXvR0vaRXKGbrnUqr5s2I', // YOUR GOOGLE MAPS API KEY
                          iconColor: MAIN_BLUE_COLOR,
                          onSelected: (Place place) {
                            place.geolocation.then((newGeolocation) async {
                              LatLng newLatLng;
                              print(
                                  'newGeolocation.coordinates : ${newGeolocation.coordinates}');
                              setState(() {
                                newLatLng = newGeolocation.coordinates;
                                print(
                                    'newLatLng : ${newLatLng.latitude} , ${newLatLng.longitude}');
                              });
                              final GoogleMapController controller =
                                  await mapController.future;
                              controller.animateCamera(
                                CameraUpdate.newCameraPosition(
                                  CameraPosition(target: newLatLng, zoom: 16),
                                ),
                              );
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 0.0078 * _screenSize.height //5,
                  ),
              child: AppBarWithBackWidget(
                title: widget.title,
                onTap: () => widget.closeEditPanel(),
              ),
            ),
            Container(
              height: 0.0046 * _screenSize.height, //3,
              color: Colors.grey[200],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  margin: EdgeInsets.all(
                    0.041 * _screenSize.width, //15,
                  ),
                  width: _screenSize.width,
                  child: Column(
                    children: [
                      Container(
                        height: 0.172 * _screenSize.height, //110,
                        padding: EdgeInsets.all(
                          0.00277 * _screenSize.width, //1,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              0.0138 * _screenSize.width, //5,
                            ),
                          ),
                          border: Border.all(
                            color: MAIN_BLUE_COLOR,
                          ),
                        ),
                        child: Stack(
                          children: [
                            map,
                            Positioned(
                              bottom: 0.0078 * _screenSize.height, //5,
                              left: 0.0138 * _screenSize.width, //5,
                              child: AvakatanButtonWidget(
                                backgroundColor: MAIN_BLUE_COLOR,
                                borderColor: MAIN_BLUE_COLOR,
                                textColor: Colors.white,
                                hasShadow: false,
                                title: "ویرایش",
                                height: 0.0506 * _screenSize.height, //30,
                                width: 0.25 * _screenSize.width, //90,
                                radius: 0.0138 * _screenSize.width, //5,
                                fontSize: 0.036 * _screenSize.width, //13,
                                onTap: () {
                                  panelController.open();
                                },
                              ),
                            ),
                            Positioned(
                              top: 0.05468 * _screenSize.height, //35,
                              left: (_screenSize.width / 2) -
                                  0.0555 * _screenSize.width //20,
                                  -
                                  0.041 * _screenSize.width, //15,
                              child: Icon(
                                Icons.location_on,
                                color: MAIN_BLUE_COLOR,
                                size: 0.111 * _screenSize.width, //40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.031 * _screenSize.height, //20,
                      ),
                      SingleAddressTextDetailWidget(
                        title: "",
                        address: widget.address,
                        indexAddress: widget.indexAddress,
                        mapPanelState: widget.mapPanelState,
                        isInitial: widget.isInitial,
                        screenSize: _screenSize,
                        isOpenEditPanel: (bool isOpen) {
                          if (isOpen)
                            panelController.open();
                          else
                            panelController.close();
                        },
                        disableIsInitial: widget.disableIsInitial,
                      ),
                      SizedBox(
                        height: 0.015 * _screenSize.height, //10,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 0.027 * _screenSize.width, //10,
                          right: 0.027 * _screenSize.width, //10,
                          bottom: 0.031 * _screenSize.height, //20,
                          top: 0.031 * _screenSize.height, //20,
                        ),
                        child: AvakatanButtonWidget(
                          backgroundColor: MAIN_BLUE_COLOR,
                          textColor: Colors.white,
                          borderColor: MAIN_BLUE_COLOR,
                          hasShadow: false,
                          title: 'ثبت آدرس',
                          height: 0.07 * _screenSize.height, //45,
                          width: _screenSize.width,
                          fontSize: 0.05 * _screenSize.width, //18,
                          radius: 0.011 * _screenSize.width, //4,
                          onTap: () {
                            widget.closeEditPanel();
                            // ! add new Address
                            print('/*/*// add new address');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.031 * _screenSize.height, //20,
            ),
          ],
        ),
      ),
    );
  }

  onMapCreated(GoogleMapController controller) {
    controller.setMapStyle('[]');
    setState(() {
      mapController.complete(controller);
    });
  }

  void createGoogleMap(LatLng latLng) async {
    map = GoogleMap(
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
  }
}
