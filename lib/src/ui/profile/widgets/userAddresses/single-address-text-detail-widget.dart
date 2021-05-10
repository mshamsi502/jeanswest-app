import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

class SingleAddressTextDetailWidget extends StatefulWidget {
  // final String title;
  final AddressInfoRes address;
  // final int indexAddress;
  //
  final String selectedProvince;
  final String selectedDistrict;
  final String selectedCity;
  //
  final PanelState mapPanelState;
  final Function(String, bool) editPanel;
  //
  final TextEditingController addressTextEditingController;
  final TextEditingController houseNumberTextEditingController;
  final TextEditingController unitNumberTextEditingController;
  final TextEditingController postalCodeTextEditingController;
  final TextEditingController recieverNameTextEditingController;
  final TextEditingController recieverPhoneNumberTextEditingController;

  SingleAddressTextDetailWidget({
    Key key,
    this.address,
    this.mapPanelState,
    // this.title,

    this.editPanel,
    this.selectedProvince,
    this.selectedDistrict,
    this.selectedCity,
    this.addressTextEditingController,
    this.houseNumberTextEditingController,
    this.unitNumberTextEditingController,
    this.postalCodeTextEditingController,
    this.recieverNameTextEditingController,
    this.recieverPhoneNumberTextEditingController,
  }) : super(key: key);

  @override
  _SingleAddressTextDetailWidgetState createState() =>
      _SingleAddressTextDetailWidgetState();
}

class _SingleAddressTextDetailWidgetState
    extends State<SingleAddressTextDetailWidget> {
  Set<Marker> addressMarker = new Set<Marker>();
  Widget map;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'استان *',
                      style: TextStyle(
                        fontSize: 0.038 * _screenSize.width, //14,
                        color: CHARCOAL_GREY_COLOR,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: F2_BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'شهر *',
                      style: TextStyle(
                        fontSize: 0.038 * _screenSize.width, //14,
                        color: CHARCOAL_GREY_COLOR,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: F2_BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          widget.selectedProvince == "تهران" && widget.selectedCity == "تهران"
              ? Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'محله *',
                                style: TextStyle(
                                  fontSize: 0.038 * _screenSize.width, //14,
                                  color: CHARCOAL_GREY_COLOR,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: F2_BACKGROUND_COLOR,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.selectedDistrict ??
                                      'یک منطقه را انتخاب کنید  ...'),
                                  Icon(Icons.arrow_drop_down_outlined)
                                ],
                              ),
                            ),
                            onTap: () => widget.editPanel('district', true),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          SizedBox(height: 10),
          CustomTextFieldWidget(
            title: 'آدرس پستی *',
            titleColor: CHARCOAL_GREY_COLOR,
            textEditingController: widget.addressTextEditingController,
            mediaQuery: MediaQuery.of(context),
            lines: 3,
          ),
          CustomTextFieldWidget(
            title: 'پلاک *',
            textEditingController: widget.houseNumberTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            mediaQuery: MediaQuery.of(context),
            lines: 1,
          ),
          CustomTextFieldWidget(
            title: 'واحد',
            textEditingController: widget.unitNumberTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            mediaQuery: MediaQuery.of(context),
            lines: 1,
          ),
          CustomTextFieldWidget(
            title: 'کد پستی *',
            textEditingController: widget.postalCodeTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            mediaQuery: MediaQuery.of(context),
            lines: 1,
          ),
          SizedBox(height: 10),
          Divider(
            height: 0.000138 * _screenSize.width, //0.05,
            thickness: 0.00555 * _screenSize.width, //2,
            indent: 0.027 * _screenSize.width, //10,
            endIndent: 0.027 * _screenSize.width, //10,
            color: Colors.grey[300],
          ),
          SizedBox(height: 10),
          // GestureDetector(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(
          //       horizontal: 0.027 * _screenSize.width, //10,
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: 0.069 * _screenSize.width, //25,
          //           height: 0.069 * _screenSize.width, //25,
          //           color: recieverIsUser ? Colors.green : Colors.grey,
          //         ),
          //         SizedBox(
          //           width: 0.041 * _screenSize.width, //15,
          //         ),
          //         Text(
          //           'گیرنده سفارش خودم هستم',
          //           style: TextStyle(
          //             fontSize: 0.041 * _screenSize.width, //15,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          //   onTap: () => setState(() {
          //     recieverIsUser = !recieverIsUser;
          //     if (recieverIsUser) {
          //       recieverNameTextEditingController.text =
          //           "${user.firstName} ${user.lastName}";
          //       recieverPhoneNumberTextEditingController.text =
          //           user.phoneNumber;
          //     }
          //   }),
          // ),
          SizedBox(height: 10),
          CustomTextFieldWidget(
            title: 'نام و نام خانوادگی گیرنده *',
            textEditingController: widget.recieverNameTextEditingController,
            // initText: hintRecieverName,
            titleColor: CHARCOAL_GREY_COLOR,
            textColor:
                // recieverIsUser ? Colors.grey :
                Colors.black,
            // isEnable: !recieverIsUser,
            mediaQuery: MediaQuery.of(context),
            lines: 1,
          ),
          CustomTextFieldWidget(
            title: 'شماره تلفن گیرنده *',
            textEditingController:
                widget.recieverPhoneNumberTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            textColor:
                //  recieverIsUser ? Colors.grey :
                Colors.black,
            // isEnable: !recieverIsUser,
            mediaQuery: MediaQuery.of(context),
            lines: 1,
          ),
        ],
      ),
    );
  }

  // void updateSelectedAddress({bool isNewAddress}) {
  //   setState(() {
  //     if (isNewAddress) {
  //       addressTextEditingController.clear();
  //       houseNumberTextEditingController.clear();
  //       unitNumberTextEditingController.clear();
  //       postalCodeTextEditingController.clear();
  //       recieverNameTextEditingController.clear();
  //       recieverPhoneNumberTextEditingController.clear();
  //       recieverIsUser = true;
  //       selectedCity = "";
  //       selectedProvince = "";
  //       if (widget.isInitial) widget.isOpenEditPanel(true);
  //       Future.delayed(Duration.zero, () async {
  //         widget.disableIsInitial();
  //       });
  //     } else {
  //       addressTextEditingController = new TextEditingController();
  //       addressTextEditingController.text = widget.address.address ?? "";
  //       houseNumberTextEditingController = new TextEditingController();
  //       houseNumberTextEditingController.text =
  //           widget.address.houseNumber ?? "";
  //       unitNumberTextEditingController = new TextEditingController();
  //       unitNumberTextEditingController.text = widget.address.unitNumber ?? "";
  //       postalCodeTextEditingController = new TextEditingController();
  //       postalCodeTextEditingController.text = widget.address.postalCode ?? "";
  //       recieverNameTextEditingController = new TextEditingController();
  //       recieverNameTextEditingController.text =
  //           "${widget.address.receiverFirstName} ${widget.address.receiverLastName}" ??
  //               "";
  //       recieverPhoneNumberTextEditingController = new TextEditingController();
  //       recieverPhoneNumberTextEditingController.text =
  //           widget.address.receiverMobile ?? "";
  //       tempAddressId = widget.address.code;
  //       recieverIsUser = widget.address.isUser;
  //       selectedCity = widget.address.city.name;
  //       selectedProvince = widget.address.province.name;
  //     }
  //   });
  // }

}
