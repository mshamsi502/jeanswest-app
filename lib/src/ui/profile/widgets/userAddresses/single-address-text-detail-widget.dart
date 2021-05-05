import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
// import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';
// import 'package:jeanswest/src/models/api_response/globalRes/address/all-province.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';
// import 'package:jeanswest/src/services/rest_client_global.dart';
// import 'package:jeanswest/src/utils/helper/profile/helper_more.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';

import 'package:jeanswest/src/ui/global/widgets/dropDown/custom_dropdown_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

class SingleAddressTextDetailWidget extends StatefulWidget {
  final String title;
  final AddressInfoRes address;
  final int indexAddress;
  //
  final String selectedProvince;
  final String selectedDistrict;
  final String selectedCity;
  //
  final PanelState mapPanelState;
  final Function(String, bool) editPanel;
  final bool isInitial;
  final Size screenSize;

  final Function(bool) isOpenEditPanel;
  final Function() disableIsInitial;
  SingleAddressTextDetailWidget({
    Key key,
    this.address,
    this.indexAddress,
    this.mapPanelState,
    this.title,
    this.isInitial,
    this.disableIsInitial,
    this.screenSize,
    this.isOpenEditPanel,
    this.editPanel,
    this.selectedProvince,
    this.selectedDistrict,
    this.selectedCity,
  }) : super(key: key);

  @override
  _SingleAddressTextDetailWidgetState createState() =>
      _SingleAddressTextDetailWidgetState();
}

class _SingleAddressTextDetailWidgetState
    extends State<SingleAddressTextDetailWidget> {
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
  String tempAddressId;
  List<String> availableCities;
  Set<Marker> addressMarker = new Set<Marker>();
  Widget map;
  //
  int selectedDropDown = 0;

  List<DropdownMenuItem> allProvinceDropDownItems;

  @override
  void initState() {
    selectedProvince = widget.address.province.name;
    availableCities = provinceCities[selectedProvince];
    selectedCity = widget.address.city.name;

    updateSelectedAddress(isNewAddress: false);
    recieverIsUser = widget.address.isUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.address.code == null || widget.address.code != tempAddressId)
      updateSelectedAddress(isNewAddress: false);
    if (widget.isInitial && widget.mapPanelState == PanelState.OPEN)
      updateSelectedAddress(isNewAddress: true);
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 880,
      // color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            top: 800,
            left: 0,
            right: 0,
            child: CustomTextFieldWidget(
              title: 'شماره تلفن گیرنده *',
              textEditingController: recieverPhoneNumberTextEditingController,
              titleColor: Colors.black,
              textColor: recieverIsUser ? Colors.grey : Colors.black,
              isEnable: !recieverIsUser,
              mediaQuery: MediaQuery.of(context),
              lines: 1,
            ),
          ),
          Positioned(
            top: 700,
            left: 0,
            right: 0,
            child: CustomTextFieldWidget(
              title: 'نام و نام خانوادگی گیرنده *',
              textEditingController: recieverNameTextEditingController,
              // initText: hintRecieverName,
              titleColor: Colors.black,
              textColor: recieverIsUser ? Colors.grey : Colors.black,
              isEnable: !recieverIsUser,
              mediaQuery: MediaQuery.of(context),
              lines: 1,
            ),
          ),
          Positioned(
            top: 650,
            left: 0,
            right: 0,
            child: GestureDetector(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.027 * _screenSize.width, //10,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 0.069 * _screenSize.width, //25,
                      height: 0.069 * _screenSize.width, //25,
                      color: recieverIsUser ? Colors.green : Colors.grey,
                    ),
                    SizedBox(
                      width: 0.041 * _screenSize.width, //15,
                    ),
                    Text(
                      'گیرنده سفارش خودم هستم',
                      style: TextStyle(
                        fontSize: 0.041 * _screenSize.width, //15,
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
          ),
          Positioned(
            top: 640,
            left: 0,
            right: 0,
            child: Divider(
              height: 0.000138 * _screenSize.width, //0.05,
              thickness: 0.00555 * _screenSize.width, //2,
              indent: 0.027 * _screenSize.width, //10,
              endIndent: 0.027 * _screenSize.width, //10,
              color: Colors.grey[300],
            ),
          ),
          Positioned(
            top: 540,
            left: 0,
            right: 0,
            child: CustomTextFieldWidget(
              title: 'واحد',
              textEditingController: unitNumberTextEditingController,
              titleColor: Colors.black,
              mediaQuery: MediaQuery.of(context),
              lines: 1,
            ),
          ),
          Positioned(
            top: 440,
            left: 0,
            right: 0,
            child: CustomTextFieldWidget(
              title: 'پلاک *',
              textEditingController: houseNumberTextEditingController,
              titleColor: Colors.black,
              mediaQuery: MediaQuery.of(context),
              lines: 1,
            ),
          ),
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            child: CustomTextFieldWidget(
              title: 'آدرس پستی *',
              titleColor: Colors.black,
              textEditingController: addressTextEditingController,
              mediaQuery: MediaQuery.of(context),
              lines: 3,
            ),
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'منطقه *',
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.selectedDistrict ??
                              'یک منطقه را اتخاب کنید  ...'),
                          Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => widget.editPanel('district', true),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 95,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'شهر *',
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.selectedCity ??
                              'یک شهر را انتخاب کنید  ...'),
                          Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => widget.editPanel('city', true),
                  ),
                ],
              ),
            ),
            // CustomDropdownButtonWidget(
            //   title: 'شهر *',
            //   hintTitle: selectedCity,
            //   titleColor: Colors.black,
            //   options: availableCities,
            //   mediaQuery: MediaQuery.of(context),
            //   selected: (String _selectedCity) => setState(() {
            //     selectedCity = _selectedCity;
            //   }),
            // ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'استان *',
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.selectedProvince ??
                              'یک استان را اتخاب کنید  ...'),
                          Icon(Icons.arrow_drop_down_outlined)
                        ],
                      ),
                    ),
                    onTap: () => widget.editPanel('province', true),
                  ),
                ],
              ),
            ),

            // DropdownButton(
            //   items: allProvinceDropDownItems,
            //   // value: 0,
            //   hint: Text(widget.address.province.name),
            //   onTap: () {},
            //   onChanged: (newValue) {},
            // ),

            // CustomDropdownButtonWidget(
            //   title: 'استان *',
            //   hintTitle: selectedProvince,
            //   titleColor: Colors.black,
            //   options: allProvinceString,
            //   mediaQuery: MediaQuery.of(context),
            //   selected: (String _selectedProvince) => setState(() {
            //     selectedProvince = _selectedProvince;
            //     print('++++ selectedProvince : $selectedProvince');
            //     availableCities = provinceCities[selectedProvince];
            //     print('++++ availableCities.first : ${availableCities[0]}');
            //   }),
            // ),
          ),
        ],
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
        if (widget.isInitial) widget.isOpenEditPanel(true);
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
            "${widget.address.receiverFirstName} ${widget.address.receiverLastName}" ??
                "";
        recieverPhoneNumberTextEditingController = new TextEditingController();
        recieverPhoneNumberTextEditingController.text =
            widget.address.receiverMobile ?? "";
        tempAddressId = widget.address.code;
        recieverIsUser = widget.address.isUser;
        selectedCity = widget.address.city.name;
        selectedProvince = widget.address.province.name;
      }
    });
  }
}
