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
  final Size screenSize;

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
    this.screenSize,
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
              top: 80,
              right: 15,
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
              top: (_screenSize.width / 2) + 90,
              left: (_screenSize.width / 2) - 20,
              child: Icon(
                Icons.location_on,
                color: MAIN_BLUE_COLOR,
                size: 40,
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    EdgeInsets.only(left: 25, right: 25, bottom: 30, top: 10),
                child: AvakatanButtonWidget(
                  backgroundColor: MAIN_BLUE_COLOR,
                  textColor: Colors.white,
                  borderColor: MAIN_BLUE_COLOR,
                  hasShadow: false,
                  title: 'تایید',
                  height: 45,
                  width: _screenSize.width,
                  fontSize: 18,
                  radius: 4,
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
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: _screenSize.width,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Container(
                        color: Colors.white,
                        height: 55,
                        width: 0.0625 * _screenSize.height, //40
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.016 * _screenSize.height, //10
                          vertical: 17,
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
              padding: EdgeInsets.symmetric(vertical: 5),
              child: AppBarWithBackWidget(
                title: widget.title,
                onTap: () => widget.closeEditPanel(),
              ),
            ),
            Container(
              height: 3,
              color: Colors.grey[200],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  margin: EdgeInsets.all(15),
                  width: _screenSize.width,
                  child: Column(
                    children: [
                      Container(
                        height: 110,
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5)),
                          border: Border.all(
                            color: MAIN_BLUE_COLOR,
                          ),
                        ),
                        child: Stack(
                          children: [
                            map,
                            Positioned(
                              bottom: 5,
                              left: 5,
                              child: AvakatanButtonWidget(
                                backgroundColor: MAIN_BLUE_COLOR,
                                borderColor: MAIN_BLUE_COLOR,
                                textColor: Colors.white,
                                hasShadow: false,
                                title: "ویرایش",
                                height: 30,
                                width: 90,
                                radius: 5,
                                fontSize: 13,
                                onTap: () {
                                  panelController.open();
                                },
                              ),
                            ),
                            Positioned(
                              top: 35,
                              left: (_screenSize.width / 2) - 20 - 15,
                              child: Icon(
                                Icons.location_on,
                                color: MAIN_BLUE_COLOR,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
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
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, bottom: 20, top: 20),
                        child: AvakatanButtonWidget(
                          backgroundColor: MAIN_BLUE_COLOR,
                          textColor: Colors.white,
                          borderColor: MAIN_BLUE_COLOR,
                          hasShadow: false,
                          title: 'ثبت آدرس',
                          height: 45,
                          width: _screenSize.width,
                          fontSize: 18,
                          radius: 4,
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
              height: 20,
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
