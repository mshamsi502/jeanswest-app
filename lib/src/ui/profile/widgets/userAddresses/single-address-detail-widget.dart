import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-district.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/city/city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/district/district.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserAddressesInfo/get-user-addresses-info.dart';
import 'package:jeanswest/src/utils/helper/search/helper_search.dart';
// import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:screenshot/screenshot.dart';
// import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

import 'package:search_map_place/search_map_place.dart';

import 'package:jeanswest/src/models/api_response/globalRes/address/all-province.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAddresses/single-address-text-detail-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAddresses/list-unit-address-panel-widget.dart';
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
  final PanelController editPanelController;
  final bool wasClose;
  final Function(bool) changeWasClose;
  final Function(List<AddressInfoRes>) updateAdresses;
  final Size screenSize;
  final Function() closeEditPanel;
  SingleAddressDetailWidget({
    Key key,
    this.address,
    this.indexAddress,
    this.mapPanelState,
    this.title,
    this.closeEditPanel,
    this.mapPanelController,
    this.screenSize,
    this.updateAdresses,
    this.editPanelController,
    this.wasClose,
    this.changeWasClose,
  }) : super(key: key);

  @override
  _SingleAddressDetailWidgetState createState() =>
      _SingleAddressDetailWidgetState();
}

class _SingleAddressDetailWidgetState extends State<SingleAddressDetailWidget> {
  ScrollController scrollController;
  Completer<GoogleMapController> mapController = Completer();
  PanelController editPanel = PanelController();
  FocusNode focusNodeSearch;
  ScrollController editScrollController;
  //
  TextEditingController addressTextEditingController;
  TextEditingController houseNumberTextEditingController;
  TextEditingController unitNumberTextEditingController;
  TextEditingController postalCodeTextEditingController;
  TextEditingController recieverNameTextEditingController;
  TextEditingController recieverPhoneNumberTextEditingController;

  //
  bool mapIsOpen;
  Widget map;
  Uint8List mapCaptured;
  PanelState tempMapPanelState;
  int tempIndexAddress;
  ScreenshotController screenshotController = ScreenshotController();
  ScrollController singleChildScrollController = ScrollController();

  var keyboardVisibilityController = KeyboardVisibilityController();
  //

  String selectedOption = "province";
  // String selectedOption = "district";

  List<Province> allProvince;
  List<Province> searchedProvince;
  List<City> allCity;
  List<City> searchedCity;
  List<District> allDistrict;
  List<District> searchedDistrict;
  //
  String selectedProvince;
  Province seleProvince;
  String selectedCity;
  City seleCity;
  String selectedDistrict;
  District seleDistrict;
  //
  LatLng newEditingLatLng;
  String newAddressFromMap;

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
    // ignore: deprecated_member_use
    searchedProvince = new List<Province>();
    selectedProvince = widget.address.province.name;
    // ignore: deprecated_member_use
    allCity = new List<City>();
    // ignore: deprecated_member_use
    searchedCity = new List<City>();
    selectedCity = widget.address.city.name;
    // ignore: deprecated_member_use
    allDistrict = new List<District>();
    // ignore: deprecated_member_use
    searchedDistrict = new List<District>();
    selectedDistrict = widget.address.district.name;
    //
    tempMapPanelState = widget.mapPanelState;
    tempIndexAddress = widget.indexAddress;
    updateFields();
    createGoogleMap(
      LatLng(
        widget.address.latitude ?? 35.7447,
        widget.address.longitude ?? 51.3340,
      ),
    ).then((_) async {
      await Future.delayed(Duration(milliseconds: 1000));
      GoogleMapController tcontroller = await mapController.future;
      await Future.delayed(Duration(milliseconds: 1000));
      Uint8List tempCapMap = await tcontroller.takeSnapshot();
      setState(() {
        mapCaptured = tempCapMap;
      });
    });
    scrollJumpAfterKeyborad(
      keyboardVisibilityController: keyboardVisibilityController,
      scrollController: singleChildScrollController,
      screenSize: widget.screenSize,
    );

    // !
    getAllAddress();
    super.initState();
  }

  getAllAddress() async {
    allProvince = await getAllProvince();
    searchedProvince = allProvince;
    Province selProvince;
    if (allProvince != null && allProvince.length != 0) {
      searchedProvince.forEach((element) {
        if (element.name == selectedProvince) selProvince = element;
      });
      allCity = await getAllCity(selProvince);
      print('first city of $selectedProvince is : ${allCity[0].name}');
      searchedCity = allCity;
      if (allCity != null && allCity.length != 0) {
        City selCity;
        allCity.forEach((element) {
          if (element.name == selectedCity) selCity = element;
        });
        allDistrict = await getAllDistrict(selCity);
        searchedDistrict = allDistrict;
      }
    }
  }

  Future<List<Province>> getAllProvince() async {
    AllProvince allProvinceRes =
        await globalLocator<GlobalRestClient>().getAllProvinceInfo();
    if (allProvinceRes.statusCode == 200) {
      return allProvinceRes.data;
    } else
      return [];
  }

  Future<List<City>> getAllCity(Province provice) async {
    Map<String, dynamic> idState = {"idState": provice.idState};
    AllCity allCityRes =
        await globalLocator<GlobalRestClient>().getAllCityInfo(idState);
    if (allCityRes.statusCode == 200) {
      return allCityRes.data;
    } else
      return [];
  }

  Future<List<District>> getAllDistrict(City city) async {
    Map<String, dynamic> idCity = {"idCity": city.idCity};
    AllDistrict allDistrictRes =
        await globalLocator<GlobalRestClient>().getAllDistrictInfo(idCity);
    if (allDistrictRes.statusCode == 200) {
      return allDistrictRes.data;
    } else
      return [];
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mapPanelState != tempMapPanelState ||
        widget.indexAddress != tempIndexAddress ||
        (widget.wasClose && widget.editPanelController.isPanelOpen)) {
      updateFields();
    }
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height,
      width: _screenSize.width,
      // color: Colors.red,
      child: SingleChildScrollView(
        controller: singleChildScrollController,
        physics: ClampingScrollPhysics(),
        child: Container(
          height: mapIsOpen ? _screenSize.height : _screenSize.height * 1.45,
          child: SlidingUpPanel(
            defaultPanelState: widget.mapPanelState,
            controller: widget.mapPanelController,
            isDraggable: false,
            minHeight: 0,
            maxHeight: _screenSize.height,
            backdropEnabled: true,
            panel: Stack(
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
                Center(
                  child: Container(
                    width: 0.911111 * _screenSize.width, //328,
                    //widget.screenSize.width - 32,
                    height: 0.172 * _screenSize.height, //110,
                    // color: Color(0x44ff0000),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.location_on,
                      color: MAIN_BLUE_COLOR,
                      size: 0.111 * widget.screenSize.width, //40,
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
                          mapIsOpen = false;
                          addressTextEditingController.text = newAddressFromMap;
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
                    width: _screenSize.width,
                    // height: 200,
                    // color: Colors.red,
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
                          onTap: () => setState(() {
                            mapIsOpen = false;
                            widget.mapPanelController.close();
                          }),
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
                                  });
                                  // !
                                  List<Placemark> dbAddress =
                                      await placemarkFromCoordinates(
                                          newLatLng.latitude,
                                          newLatLng.longitude,
                                          localeIdentifier: 'fa');
                                  setState(() {
                                    selectedProvince = dbAddress[0]
                                        .administrativeArea
                                        .replaceAll("استان ", "");
                                    selectedCity = dbAddress[0].locality;
                                    // selectedDistrict = dbAddress[0];
                                    newAddressFromMap =
                                        dbAddress[0].administrativeArea +
                                            '، ' +
                                            dbAddress[0].locality +
                                            '، ' +
                                            dbAddress[0].subLocality +
                                            '، ' +
                                            dbAddress[0].name;
                                  });
                                  final GoogleMapController controller =
                                      await mapController.future;
                                  controller.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                          target: newLatLng, zoom: 16),
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
            body: SlidingUpPanel(
              controller: editPanel,
              minHeight: 0,
              maxHeight: 0.55 * _screenSize.height,
              backdropEnabled: true,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    0.027 * _screenSize.width, //10,
                  ),
                  topRight: Radius.circular(
                    0.027 * _screenSize.width, //10,
                  )),
              panel: ListUnitAddressPanelWidget(
                screenSize: _screenSize,
                focusNode: focusNodeSearch,
                closePanel: () => editPanel.close(),
                selectedOption: selectedOption,
                allProvince: searchedProvince,
                allDistrict: searchedDistrict,
                allCity: searchedCity,
                onChangeSearchFeild: onChangeSearchFeild,
                updateProvince: (int index) => updateProvince(index),
                updateDistrict: (int index) => updateDistrict(index),
                updateCity: (int index) => updateCity(index),
              ),
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.0078 * _screenSize.height //5,
                        ),
                    child: AppBarWithBackWidget(
                        title: widget.title,
                        onTap: () {
                          updateFields();
                          widget.changeWasClose(true);
                          widget.closeEditPanel();
                        }),
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
                                          width: _screenSize.width,
                                          height:
                                              0.172 * _screenSize.height, //110,
                                          child: Image.memory(
                                            mapCaptured,
                                            fit: BoxFit.fitWidth,
                                            // scale:,
                                          ),
                                        )
                                      : Container(
                                          color: Colors.yellow,
                                          width: 0.88333 *
                                              _screenSize.width, // 318
                                          // _screenSize.width - 42,
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
                                      onTap: () => setState(() {
                                        mapIsOpen = true;
                                        widget.mapPanelController.open();
                                      }),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      Icons.location_on,
                                      color: MAIN_BLUE_COLOR,
                                      size:
                                          0.111 * widget.screenSize.width, //40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 0.031 * _screenSize.height, //20,
                            ),
                            SingleAddressTextDetailWidget(
                              // title: "",
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
                                onTap: () async {
                                  widget.closeEditPanel();
                                  // ! add new Address
                                  if (widget.mapPanelState == PanelState.OPEN) {
                                    // print('/*/*// add new address');
                                    bool res = await addToUserAddresses(
                                      recieverFullName:
                                          recieverNameTextEditingController
                                              .text,
                                      receiverMobile:
                                          recieverPhoneNumberTextEditingController
                                              .text,
                                      // country: 'ایران',
                                      province: seleProvince,
                                      city: seleCity,
                                      district: seleDistrict,
                                      // province: selectedProvince,
                                      // city: selectedCity,
                                      // district: selectedDistrict,
                                      address:
                                          addressTextEditingController.text,
                                      houseNumber:
                                          houseNumberTextEditingController.text,
                                      unitNumber:
                                          unitNumberTextEditingController.text,
                                      postalCode:
                                          postalCodeTextEditingController.text,
                                      latitude: newEditingLatLng.latitude,
                                      longitude: newEditingLatLng.longitude,
                                      isUser: true,
                                      title: '',
                                    );
                                    List<AddressInfoRes> addRes =
                                        await userAddressesInfo();
                                    if (res) widget.updateAdresses(addRes);
                                  } else {
                                    // print('/*/*// edit address');
                                    bool res = await editUserAddresses(
                                      oldAddress: widget.address,
                                      recieverFullName:
                                          recieverNameTextEditingController
                                              .text,
                                      receiverMobile:
                                          recieverPhoneNumberTextEditingController
                                              .text,
                                      // country: 'ایران',
                                      province: selectedProvince,
                                      city: selectedCity,
                                      district: selectedDistrict,
                                      address:
                                          addressTextEditingController.text,
                                      houseNumber:
                                          houseNumberTextEditingController.text,
                                      unitNumber:
                                          unitNumberTextEditingController.text,
                                      postalCode:
                                          postalCodeTextEditingController.text,
                                      latitude: newEditingLatLng.latitude,
                                      longitude: newEditingLatLng.longitude,
                                      // isUser: true,
                                      // title: '',
                                    );
                                    if (res) {
                                      List<AddressInfoRes> addRes =
                                          await userAddressesInfo();
                                      if (res) widget.updateAdresses(addRes);
                                    }
                                  }
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
        ),
      ),
    );
  }

  updateProvince(int index) async {
    // print('111111111111 : $index');
    List<City> cities = await getAllCity(searchedProvince[index]);
    if (selectedProvince != searchedProvince[index].name)
      setState(() {
        selectedProvince = searchedProvince[index].name;
        seleProvince = searchedProvince[index];
        // print('selectedProvince : $selectedProvince');
        selectedCity = null;
        selectedDistrict = null;
        searchedCity = cities;
        searchedProvince = allProvince;
      });
    editPanel.close();
  }

  updateCity(int index) async {
    List<District> districts = await getAllDistrict(searchedCity[index]);
    if (selectedCity != searchedCity[index].name)
      setState(() {
        selectedCity = searchedCity[index].name;
        seleCity = searchedCity[index];
        selectedDistrict = null;
        allDistrict = districts;
        searchedCity = allCity;
      });
    editPanel.close();
  }

  updateDistrict(int index) async {
    if (selectedDistrict != searchedDistrict[index].name)
      setState(() {
        selectedDistrict = searchedDistrict[index].name;
        seleDistrict = searchedDistrict[index];
        searchedDistrict = allDistrict;
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

  createGoogleMap(LatLng latLng) async {
    map = GoogleMap(
      onMapCreated: onMapCreated,
      scrollGesturesEnabled: true,
      // mapToolbarEnabled: true,
      mapToolbarEnabled: false,
      // myLocationButtonEnabled: false,
      zoomGesturesEnabled: false,
      // zoomGesturesEnabled: true,
      rotateGesturesEnabled: true,
      onCameraMove: (CameraPosition newCameraPosition) {
        setState(() {
          newEditingLatLng = newCameraPosition.target;
        });
        // print(newEditingLatLng);
      },
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        target: latLng,
        zoom: latLng.latitude != null ? 16 : 14,
      ),
    );
  }

  onChangeSearchFeild(String value) async {
    // print('value is $value');
    // print('selectedOption is $selectedOption');
    if (selectedOption == 'province') {
      // print('..................  lenght : ${allProvince.length}');
      setState(() {
        searchedProvince = getListOfObjectsStatic(
          query: value,
          objects: allProvince,
          modelName: 'Province',
        )?.cast<Province>();
      });
    } else if (selectedOption == 'city') {
      Province selProvince;
      allProvince.forEach((element) {
        if (element.name == selectedProvince) selProvince = element;
      });
      // print('selProvince : $selProvince');
      List<City> tempAllCity = await getAllCity(selProvince);
      setState(() {
        allCity = tempAllCity;
      });
      // print('first city of $selectedProvince is : ${allCity[0].name}');
      // print(
      // 'selectedOption is $selectedOption , result lenght : ${searchedProvince.length}');
      setState(() {
        searchedCity = getListOfObjectsStatic(
          query: value,
          objects: allCity,
          modelName: 'City',
        )?.cast<City>();
        // print('first City of $selectedProvince : ${allCity[0].name}');
        // print(
        //     'selectedOption is $selectedOption , result lenght : ${allCity.length}');
      });
      //

    } else {
      City selCity;
      allCity.forEach((element) {
        if (element.name == selectedProvince) selCity = element;
      });
      // print('selProvince : $selCity');
      List<District> tempAllDistrict = await getAllDistrict(selCity);
      setState(() {
        allDistrict = tempAllDistrict;
      });
      // print('first District of $selectedCity is : ${allDistrict[0].name}');
      // print(
      //     'selectedOption is $selectedOption , result lenght : ${selectedCity.length}');
      setState(() {
        searchedDistrict = getListOfObjectsStatic(
          query: value,
          objects: allDistrict,
          modelName: 'District',
        )?.cast<District>();
      });
      // print('first District of $selectedCity : ${searchedDistrict[0].name}');
      // print(
      //     'selectedOption is $selectedOption , result lenght : ${searchedDistrict.length}');
    }
  }

  updateFields() {
    // print('...updating feilds.......');
    addressTextEditingController = TextEditingController();
    houseNumberTextEditingController = TextEditingController();
    unitNumberTextEditingController = TextEditingController();
    postalCodeTextEditingController = TextEditingController();
    recieverNameTextEditingController = TextEditingController();
    recieverPhoneNumberTextEditingController = TextEditingController();
    setState(() {
      if (widget.mapPanelState == PanelState.OPEN) {
        addressTextEditingController.text = "";
        houseNumberTextEditingController.text = "";
        unitNumberTextEditingController.text = "";
        postalCodeTextEditingController.text = "";
        recieverNameTextEditingController.text =
            '${user.firstName} ${user.lastName}';
        recieverPhoneNumberTextEditingController.text = user.phoneNumber;
        selectedProvince = "";
        selectedDistrict = "";
        selectedCity = "";
        newEditingLatLng = LatLng(35.699749, 51.338053);
      } else {
        //   print('...updating feilds in edit address.......');
        // print('address : ${userAddresses[widget.indexAddress].address}');
        // print('########### indexAddress : ${widget.indexAddress}');
        addressTextEditingController.text =
            userAddresses[widget.indexAddress].address ?? "";
        // print(
        //     'addressTextEditingController :${addressTextEditingController.text}');
        houseNumberTextEditingController.text =
            widget.address.houseNumber ?? "";
        unitNumberTextEditingController.text = widget.address.unitNumber ?? "";
        postalCodeTextEditingController.text = widget.address.postalCode ?? "";
        recieverNameTextEditingController.text =
            widget.address.recieverFullName ?? "";
        recieverPhoneNumberTextEditingController.text =
            widget.address.receiverMobile ?? "";
        selectedProvince = widget.address.province.name;
        selectedDistrict = widget.address.district.name;
        selectedCity = widget.address.city.name;
        newEditingLatLng = LatLng(
          widget.address.latitude,
          widget.address.longitude,
        );
      }
      mapIsOpen = widget.mapPanelState == PanelState.OPEN;
      tempMapPanelState = widget.mapPanelState;
      tempIndexAddress = widget.indexAddress;
    });
    if (!mounted) widget.changeWasClose(false);
  }
}
