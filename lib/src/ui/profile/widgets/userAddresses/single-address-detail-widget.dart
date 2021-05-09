import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-district.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/city/city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/district/district.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
// import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

import 'package:search_map_place/search_map_place.dart';

import 'package:jeanswest/src/models/api_response/globalRes/address/all-province.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAddresses/single-address-text-detail-widget.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
//
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';

class SingleAddressDetailWidget extends StatefulWidget {
  final String title;
  final AddressInfoRes address;
  final int indexAddress;
  final PanelState mapPanelState;
  final PanelController mapPanelController;
  // final Function(bool) changeMapPanelController;
  // final bool isInitial;
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
    // this.isInitial,
    this.disableIsInitial,
    this.mapPanelController,
    this.screenSize,
    // this.changeMapPanelController,
  }) : super(key: key);

  @override
  _SingleAddressDetailWidgetState createState() =>
      _SingleAddressDetailWidgetState();
}

class _SingleAddressDetailWidgetState extends State<SingleAddressDetailWidget> {
  ScrollController scrollController;
  // PanelController panelController;
  Completer<GoogleMapController> mapController = Completer();
  PanelController editPanel = PanelController();
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
  String selectedDistrict;
  //

  Widget map;
  Uint8List mapCaptured
      //  = Uint8List(500)
      ;
  ScreenshotController screenshotController = ScreenshotController();
  //

  String selectedOption = "province";
  // String selectedOption = "district";

  List<Province> allProvince;
  List<City> allCity;
  List<District> allDistrict;
  ScrollController editScrollController;

  LatLng newEditingLatLng;

  @override
  void initState() {
    scrollController = new ScrollController();
    editScrollController = new ScrollController();
    newEditingLatLng = LatLng(
      widget.address.latitude,
      widget.address.longitude,
    );

    // ignore: deprecated_member_use
    allProvince = new List<Province>();
    //
    selectedProvince = widget.address.province.name;
    selectedDistrict = widget.address.district.name;
    selectedCity = widget.address.city.name;
    //
    addressTextEditingController = TextEditingController();
    houseNumberTextEditingController = TextEditingController();
    unitNumberTextEditingController = TextEditingController();
    postalCodeTextEditingController = TextEditingController();
    recieverNameTextEditingController = TextEditingController();
    recieverPhoneNumberTextEditingController = TextEditingController();
    addressTextEditingController.text = widget.address.address ?? "";
    houseNumberTextEditingController.text = widget.address.houseNumber ?? "";
    unitNumberTextEditingController.text = widget.address.unitNumber ?? "";
    postalCodeTextEditingController.text = widget.address.postalCode ?? "";
    recieverNameTextEditingController.text =
        '${widget.address.receiverFirstName} ${widget.address.receiverLastName}' ??
            "";
    recieverPhoneNumberTextEditingController.text =
        widget.address.receiverMobile ?? "";
    //
    // initCapture();
    initCreateMap(
      widget.address.latitude ?? 35.7447,
      widget.address.longitude ?? 51.3340,
    );
    // !
    getAllAddress();

    // !
    super.initState();
  }

  initCreateMap(double lat, double lng) async {
    map = await createGoogleMap(
      LatLng(lat, lng),
    );
    final GoogleMapController controller = await mapController.future;
    mapCaptured = await controller.takeSnapshot();
  }

  getAllAddress() async {
    allProvince = await getAllProvince();
    if (allProvince != null && allProvince.length != 0) {
      allCity = await getAllCity(allProvince[0]);
      if (allCity != null && allCity.length != 0) {
        allDistrict = await getAllDistrict(allCity[0]);
      }
    }
  }

  Future<List<Province>> getAllProvince() async {
    AllProvince allProvinceRes =
        await globalLocator<GlobalRestClient>().getAllProvinceInfo();
    if (allProvinceRes.statusCode == 200) {
      print('get allProvince, length : ${allProvinceRes.data.length}');
      return allProvinceRes.data;
    } else
      return [];
  }

  Future<List<City>> getAllCity(Province provice) async {
    // Map<String, int> idCity = {'idCity': provice.idState};
    Map<String, dynamic> idState = {"idState": provice.idState};

    AllCity allCityRes =
        await globalLocator<GlobalRestClient>().getAllCityInfo(idState);

    if (allCityRes.statusCode == 200) {
      print(
          'get allDistrict of ${provice.name}, length : ${allCityRes.data.length}');
      return allCityRes.data;
    } else
      return [];
  }

  Future<List<District>> getAllDistrict(City city) async {
    // Map<String, int> idCity = {'idCity': provice.idState};
    Map<String, dynamic> idCity = {"idCity": city.idCity};
    AllDistrict allDistrictRes =
        await globalLocator<GlobalRestClient>().getAllDistrictInfo(idCity);
    if (allDistrictRes.statusCode == 200) {
      print(
          'get allDistrict of ${city.name}, length : ${allDistrictRes.data.length}');
      return allDistrictRes.data;
    } else
      return [];
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return
        // WillPopScope(
        //   onWillPop: () => backPanelClose(widget.mapPanelController, context),
        //   child:
        Container(
      child: SlidingUpPanel(
        defaultPanelState: widget.mapPanelState,
        controller: widget.mapPanelController,
        isDraggable: false,
        minHeight: 0,
        maxHeight: _screenSize.height,
        backdropEnabled: true,
        panel:
            // RepaintBoundary(
            //   key: mapScreenKey,
            //   child:
            Stack(
          children: [
            map ?? Container(),
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
                  ),
                ),
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
            Screenshot(
              controller: screenshotController,
              child: Center(
                child: Container(
                  width: widget.screenSize.width - 32,
                  height: 110,
                  // color: Color(0x44ff0000),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.location_on,
                    color: MAIN_BLUE_COLOR,
                    size: 0.111 * widget.screenSize.width, //40,
                  ),
                ),
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
                  onTap: () async {
                    final GoogleMapController controller =
                        await mapController.future;
                    Uint8List tempCapMap = await controller.takeSnapshot();
                    setState(() {
                      mapCaptured = tempCapMap;
                    });

                    // ! get center screen location
                    // ! return location and update Lat & Lng in Address
                    print('/*/*/ confirm location');
                    widget.mapPanelController.close();
                  },
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                // padding: EdgeInsets.symmetric(
                //   vertical: 0.0078 * _screenSize.height, //5,
                //   horizontal: 0.027 * _screenSize.width, //10,
                // ),
                width: _screenSize.width,
                color: Colors.white,
                // color: Colors.transparent,
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
                      onTap: () => widget.mapPanelController.close(),
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
        // ),
        // ),
        body: SlidingUpPanel(
          controller: editPanel,
          minHeight: 0,
          maxHeight: _screenSize.height / 2,
          backdropEnabled: true,
          panel: Container(
            height: _screenSize.height / 2,
            child: ListView.builder(
                itemCount: selectedOption == "province"
                    ? allProvince.length
                    : selectedOption == "city"
                        ? allCity.length
                        : allDistrict.length,
                controller: editScrollController,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          selectedOption == "province"
                              ? allProvince[index].name
                              : selectedOption == "city"
                                  ? allCity[index].name
                                  : allDistrict[index].name,
                        ),
                      ],
                    ),
                    onTap: () async {
                      selectedOption == "province"
                          ? await updateProvince(index)
                          : selectedOption == "city"
                              ? await updateCity(index)
                              : await updateDistrict(index);
                    },
                  );
                }),
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
                              mapCaptured != null
                                  ? Container(
                                      width: _screenSize.width - 42,
                                      height: 110,
                                      child: Image.memory(
                                        mapCaptured,
                                        fit: BoxFit.fitWidth,
                                        // scale:,
                                      ))
                                  : Container(
                                      color: Colors.yellow,
                                      width: _screenSize.width - 42,
                                    ),
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
                                    widget.mapPanelController.open();
                                  },
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
                          mapPanelState: widget.mapPanelState,
                          selectedProvince: selectedProvince,
                          selectedCity: selectedCity,
                          selectedDistrict: selectedDistrict,
                          //
                          addressTextEditingController:
                              addressTextEditingController,
                          houseNumberTextEditingController:
                              houseNumberTextEditingController,
                          unitNumberTextEditingController:
                              unitNumberTextEditingController,
                          postalCodeTextEditingController:
                              postalCodeTextEditingController,
                          recieverNameTextEditingController:
                              recieverNameTextEditingController,
                          recieverPhoneNumberTextEditingController:
                              recieverPhoneNumberTextEditingController,
                          //
                          editPanel: (String option, bool isOpen) {
                            setState(() {
                              selectedOption = option;
                            });
                            isOpen ? editPanel.open() : editPanel.close();
                          },
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
      ),
    );
  }

  updateProvince(int index) async {
    List<City> cities = await getAllCity(allProvince[index]);

    setState(() {
      selectedProvince = allProvince[index].name;
      allCity = cities;
    });
    editPanel.close();
  }

  updateCity(int index) async {
    List<District> districts = await getAllDistrict(allCity[index]);
    setState(() {
      selectedCity = allCity[index].name;
      allDistrict = districts;
    });
    editPanel.close();
  }

  updateDistrict(int index) async {
    setState(() {
      selectedDistrict = allDistrict[index].name;
    });
    editPanel.close();
  }

  onMapCreated(GoogleMapController controller) async {
    controller.setMapStyle('[]');

    setState(() {
      if (!mapController.isCompleted) {
        mapController.complete(controller);
      }
      this.mapController = mapController;
    });
  }

  Future<Widget> createGoogleMap(LatLng latLng) async {
    return GoogleMap(
      onMapCreated: onMapCreated,
      scrollGesturesEnabled: true,
      mapToolbarEnabled: true,
      // mapToolbarEnabled: false,
      myLocationButtonEnabled: false,
      // zoomGesturesEnabled: false,
      zoomGesturesEnabled: true,
      rotateGesturesEnabled: true,
      onCameraMove: (CameraPosition newCameraPosition) {
        setState(() {
          newEditingLatLng = newCameraPosition.target;
        });
        print(newEditingLatLng);
      },
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: latLng,
        zoom: latLng.latitude != null ? 16 : 14,
      ),
    );
  }
}
