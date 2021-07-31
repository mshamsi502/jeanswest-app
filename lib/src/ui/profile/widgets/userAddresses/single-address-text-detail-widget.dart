import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/address-info-res.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

class SingleAddressTextDetailWidget extends StatefulWidget {
  final AddressInfoRes address;
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
            margin: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0.027 * _screenSize.width, //10,
                    ),
                    Text(
                      'استان *',
                      style: TextStyle(
                        fontSize: 0.038 * _screenSize.width, //14,
                        color: CHARCOAL_GREY_COLOR,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.0078 * _screenSize.height //5,
                    ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: F2_BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(
                        0.011 * _screenSize.width, //4,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.041 * _screenSize.width, //15,
                      vertical: 0.015 * _screenSize.height, //10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selectedProvince ??
                              'یک استان را اتخاب کنید  ...',
                          style: TextStyle(
                            fontSize: 0.0444 * _screenSize.width, //16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 0.069 * _screenSize.width, //25,
                        )
                      ],
                    ),
                  ),
                  onTap: () => widget.editPanel('province', true),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.015 * _screenSize.height, //10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 0.015 * _screenSize.height, //10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 0.027 * _screenSize.width, //10,
                    ),
                    Text(
                      'شهر *',
                      style: TextStyle(
                        fontSize: 0.038 * _screenSize.width, //14,
                        color: CHARCOAL_GREY_COLOR,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.0078 * _screenSize.height //5,
                    ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: F2_BACKGROUND_COLOR,
                      borderRadius: BorderRadius.circular(
                        0.011 * _screenSize.width, //4,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.041 * _screenSize.width, //15,
                      vertical: 0.015 * _screenSize.height, //10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.selectedCity ?? 'یک شهر را انتخاب کنید  ...',
                          style: TextStyle(
                            fontSize: 0.0444 * _screenSize.width, //16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down_outlined,
                          size: 0.069 * _screenSize.width, //25,
                        )
                      ],
                    ),
                  ),
                  onTap: () => widget.editPanel('city', true),
                ),
              ],
            ),
          ),
          (widget.selectedProvince == "تهران" &&
                      widget.selectedCity == "تهران") ||
                  (widget.selectedProvince == "البرز" &&
                      widget.selectedCity == "کرج")
              ? Column(
                  children: [
                    SizedBox(
                      height: 0.015 * _screenSize.height, //10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 0.027 * _screenSize.width, //10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 0.027 * _screenSize.width, //10,
                              ),
                              Text(
                                'محله *',
                                style: TextStyle(
                                  fontSize: 0.038 * _screenSize.width, //14,
                                  color: CHARCOAL_GREY_COLOR,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 0.0078 * _screenSize.height //5,
                              ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: F2_BACKGROUND_COLOR,
                                borderRadius: BorderRadius.circular(
                                  0.011 * _screenSize.width, //4,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.041 * _screenSize.width, //15,
                                vertical: 0.015 * _screenSize.height, //10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.selectedDistrict ??
                                        'یک منطقه را انتخاب کنید  ...',
                                    style: TextStyle(
                                      fontSize:
                                          0.0444 * _screenSize.width, //16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_outlined,
                                    size: 0.069 * _screenSize.width, //25,
                                  )
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
          SizedBox(
            height: 0.015 * _screenSize.height, //10,
          ),
          CustomTextFieldWidget(
            title: 'آدرس پستی *',
            titleColor: CHARCOAL_GREY_COLOR,
            // customBackColor: Colors.red,
            textEditingController: widget.addressTextEditingController,
            mediaQuery: MediaQuery.of(context),
            width: MediaQuery.of(context).size.width,
            lines: 3,
          ),
          CustomTextFieldWidget(
            title: 'پلاک *',
            textEditingController: widget.houseNumberTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            // customBackColor: Colors.green,
            mediaQuery: MediaQuery.of(context),
            width: MediaQuery.of(context).size.width,
            lines: 1,
          ),
          CustomTextFieldWidget(
            title: 'واحد',
            textEditingController: widget.unitNumberTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            mediaQuery: MediaQuery.of(context),
            width: MediaQuery.of(context).size.width,
            lines: 1,
          ),
          CustomTextFieldWidget(
            title: 'کد پستی *',
            textEditingController: widget.postalCodeTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            mediaQuery: MediaQuery.of(context),
            width: MediaQuery.of(context).size.width,
            lines: 1,
          ),
          SizedBox(
            height: 0.015 * _screenSize.height, //10,
          ),
          Divider(
            height: 0.000138 * _screenSize.width, //0.05,
            thickness: 0.00555 * _screenSize.width, //2,
            indent: 0.027 * _screenSize.width, //10,
            endIndent: 0.027 * _screenSize.width, //10,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 0.023 * _screenSize.height, //15
          ),
          CustomTextFieldWidget(
            title: 'نام و نام خانوادگی گیرنده *',
            textEditingController: widget.recieverNameTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            textColor: Colors.black,
            mediaQuery: MediaQuery.of(context),
            width: MediaQuery.of(context).size.width,
            lines: 1,
          ),
          CustomTextFieldWidget(
            title: 'شماره تلفن گیرنده *',
            textEditingController:
                widget.recieverPhoneNumberTextEditingController,
            titleColor: CHARCOAL_GREY_COLOR,
            textColor: Colors.black,
            mediaQuery: MediaQuery.of(context),
            width: MediaQuery.of(context).size.width,
            lines: 1,
          ),
        ],
      ),
    );
  }
}
