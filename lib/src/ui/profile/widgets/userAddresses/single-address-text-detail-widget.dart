import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
import 'package:jeanswest/src/models/address/address.dart';

import 'package:jeanswest/src/ui/global/widgets/dropDown/custom_dropdown_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

class SingleAddressTextDetailWidget extends StatefulWidget {
  final String title;
  final Address address;
  final int indexAddress;
  final PanelState mapPanelState;
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
  int tempAddressId;
  List<String> availableCities;
  Set<Marker> addressMarker = new Set<Marker>();
  Widget map;
  //
  int selectedDropDown = 0;

  @override
  void initState() {
    selectedProvince = widget.address.province;
    availableCities = provinceCities[selectedProvince];
    selectedCity = widget.address.city;

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
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 760,
      // color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            top: 680,
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
            top: 580,
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
            top: 540,
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
            top: 520,
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
            top: 420,
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
            top: 325,
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
            top: 190,
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
            top: 95,
            left: 0,
            right: 0,
            child: CustomDropdownButtonWidget(
              title: 'شهر *',
              hintTitle: selectedCity,
              titleColor: Colors.black,
              options: availableCities,
              mediaQuery: MediaQuery.of(context),
              selected: (String _selectedCity) => setState(() {
                selectedCity = _selectedCity;
              }),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: CustomDropdownButtonWidget(
              title: 'استان *',
              hintTitle: selectedProvince,
              titleColor: Colors.black,
              options: provinces,
              mediaQuery: MediaQuery.of(context),
              selected: (String _selectedProvince) => setState(() {
                selectedProvince = _selectedProvince;
                print('++++ selectedProvince : $selectedProvince');
                availableCities = provinceCities[selectedProvince];
                print('++++ availableCities.first : ${availableCities[0]}');
              }),
            ),
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
}
