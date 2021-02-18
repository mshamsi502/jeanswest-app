import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-main-info.dart';
import 'package:search_map_place/search_map_place.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/models/address/address.dart';
//
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_dropdown_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

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
  // GoogleMapController mapController;
  //
  TextEditingController addressTextEditingController;
  TextEditingController houseNumberTextEditingController;
  TextEditingController unitNumberTextEditingController;
  TextEditingController postalCodeTextEditingController;
  TextEditingController recieverNameTextEditingController;
  TextEditingController recieverPhoneNumberTextEditingController;
  //
  String selectedProvince;
  String selectedCity;
  bool recieverIsUser;
  //
  int tempAddressId;
  List<String> availableCities;
  Set<Marker> addressMarker = new Set<Marker>();
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

    updateSelectedAddress(isNewAddress: false);
    recieverIsUser = widget.address.isUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.address.id == null || widget.address.id != tempAddressId)
      updateSelectedAddress(isNewAddress: false);
    if (widget.isInitial && widget.mapPanelState == PanelState.OPEN)
      updateSelectedAddress(isNewAddress: true);
    var _screenSize = MediaQuery.of(context).size;
    //

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
              top: (_screenSize.width / 2) + 90,
              left: (_screenSize.width / 2) - 20,
              child: Icon(
                Icons.location_on,
                color: MAIN_BLUE_COLOR,
                size: 40,
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
            Positioned(
              bottom: 30,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(15),
                child: AvakatanButtonWidget(
                  backgroundColor: MAIN_BLUE_COLOR,
                  textColor: Colors.white,
                  borderColor: MAIN_BLUE_COLOR,
                  hasShadow: false,
                  title: 'تایید',
                  height: 40,
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
                child: Column(
                  children: [
                    Container(
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
                          SizedBox(height: 10),
                          CustomDropdownButtonWidget(
                            title: 'استان *',
                            hintTitle: selectedProvince,
                            titleColor: Colors.black,
                            options: provinces,
                            mediaQuery: MediaQuery.of(context),
                            selected: (String _selectedProvince) =>
                                setState(() {
                              selectedProvince = _selectedProvince;
                              print(
                                  '++++ selectedProvince : $selectedProvince');
                              availableCities =
                                  provinceCities[selectedProvince];
                              print(
                                  '++++ availableCities.first : ${availableCities[0]}');
                            }),
                          ),
                          SizedBox(height: 10),
                          CustomDropdownButtonWidget(
                            title: 'شهر *',
                            hintTitle: selectedCity,
                            titleColor: Colors.black,
                            options: availableCities,
                            mediaQuery: MediaQuery.of(context),
                            selected: (String _selectedCity) => setState(() {
                              selectedCity = _selectedCity;
                            }),
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldWidget(
                            title: 'آدرس پستی *',
                            titleColor: Colors.black,
                            textEditingController: addressTextEditingController,
                            mediaQuery: MediaQuery.of(context),
                            lines: 3,
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldWidget(
                            title: 'پلاک *',
                            textEditingController:
                                houseNumberTextEditingController,
                            titleColor: Colors.black,
                            mediaQuery: MediaQuery.of(context),
                            lines: 1,
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldWidget(
                            title: 'واحد',
                            textEditingController:
                                unitNumberTextEditingController,
                            titleColor: Colors.black,
                            mediaQuery: MediaQuery.of(context),
                            lines: 1,
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldWidget(
                            title: 'کد پستی *',
                            textEditingController:
                                postalCodeTextEditingController,
                            titleColor: Colors.black,
                            mediaQuery: MediaQuery.of(context),
                            lines: 1,
                          ),
                          SizedBox(height: 20),
                          Divider(
                            height: 0.05,
                            thickness: 2,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    color: recieverIsUser
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  SizedBox(width: 15),
                                  Text(
                                    'گیرنده سفارش خودم هستم',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => setState(() {
                              recieverIsUser = !recieverIsUser;
                              if (recieverIsUser) {
                                recieverNameTextEditingController.text =
                                    "${user.firstName} ${user.lastName}";
                                recieverPhoneNumberTextEditingController.text =
                                    user.phoneNumber;
                              }
                            }),
                          ),
                          SizedBox(height: 15),
                          CustomTextFieldWidget(
                            title: 'نام و نام خانوادگی گیرنده *',
                            textEditingController:
                                recieverNameTextEditingController,
                            // initText: hintRecieverName,
                            titleColor: Colors.black,
                            textColor:
                                recieverIsUser ? Colors.grey : Colors.black,
                            isEnable: !recieverIsUser,
                            mediaQuery: MediaQuery.of(context),
                            lines: 1,
                          ),
                          SizedBox(height: 10),
                          CustomTextFieldWidget(
                            title: 'شماره تلفن گیرنده *',
                            textEditingController:
                                recieverPhoneNumberTextEditingController,
                            titleColor: Colors.black,
                            textColor:
                                recieverIsUser ? Colors.grey : Colors.black,
                            isEnable: !recieverIsUser,
                            mediaQuery: MediaQuery.of(context),
                            lines: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: AvakatanButtonWidget(
                        backgroundColor: MAIN_BLUE_COLOR,
                        textColor: Colors.white,
                        borderColor: MAIN_BLUE_COLOR,
                        hasShadow: false,
                        title: 'ثبت آدرس',
                        height: 40,
                        width: _screenSize.width,
                        fontSize: 18,
                        radius: 4,
                        onTap: () {
                          panelController.open();
                          // ! add new Address
                          print('/*/*// add new address');
                        },
                      ),
                    ),
                  ],
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

  void updateSelectedAddress({bool isNewAddress}) {
    setState(() {
      if (isNewAddress) {
        addressTextEditingController.clear();
        houseNumberTextEditingController.clear();
        unitNumberTextEditingController.clear();
        postalCodeTextEditingController.clear();
        recieverNameTextEditingController.clear();
        recieverPhoneNumberTextEditingController.clear();
        recieverIsUser = true;
        selectedCity = "";
        selectedProvince = "";
        if (widget.isInitial) panelController.open();
        Future.delayed(Duration.zero, () async {
          widget.disableIsInitial();
        });
      } else {
        addressTextEditingController = new TextEditingController();
        addressTextEditingController.text = widget.address.address ?? "";
        houseNumberTextEditingController = new TextEditingController();
        houseNumberTextEditingController.text =
            widget.address.houseNumber ?? "";
        unitNumberTextEditingController = new TextEditingController();
        unitNumberTextEditingController.text = widget.address.unitNumber ?? "";
        postalCodeTextEditingController = new TextEditingController();
        postalCodeTextEditingController.text = widget.address.postalCode ?? "";
        recieverNameTextEditingController = new TextEditingController();
        recieverNameTextEditingController.text =
            "${widget.address.recieverFirstName} ${widget.address.recieverLastName}" ??
                "";
        recieverPhoneNumberTextEditingController = new TextEditingController();
        recieverPhoneNumberTextEditingController.text =
            widget.address.recieverMobile ?? "";
        tempAddressId = widget.address.id;
        recieverIsUser = widget.address.isUser;
        selectedCity = widget.address.city;
        selectedProvince = widget.address.province;
      }
    });
  }

  onMapCreated(GoogleMapController controller) {
    setState(() {
      // mapController = controller;
      mapController.complete(controller);
    });
  }

  void createGoogleMap(LatLng latLng) async {
    // setState(() {
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
    // });
  }
}
