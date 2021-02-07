//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginBodyWidget extends StatefulWidget {
  final TextEditingController phoneTextEditingController;
  final FocusNode focusNode;
  final bool keyboardIsOpen;
  final PanelController preTelCodePanelController;
  final String inputPhone;
  final bool hasError;
  final Country selectedCountry;
  final Function(String) changeTextFieldSearch;

  const LoginBodyWidget({
    Key key,
    this.phoneTextEditingController,
    this.keyboardIsOpen,
    this.preTelCodePanelController,
    this.inputPhone,
    this.hasError,
    this.selectedCountry,
    this.focusNode,
    this.changeTextFieldSearch,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  String hintPhone = '9125432778';

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 0.2394 * _screenSize.height, //150,
      width: _screenSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 0.054 * _screenSize.width, //20
            ),
            child: Text(
              "login_screen.enter_your_phone_number".tr(),
              style: TextStyle(
                fontSize: 0.036 * _screenSize.width, //13,
              ),
            ),
          ),
          SizedBox(
            height: 0.078125 * _screenSize.height, //50,
          ),
          Container(
            height: 0.078125 * _screenSize.height, //50,
            width: _screenSize.width,
            margin: EdgeInsets.symmetric(
              horizontal: 0.054 * _screenSize.width, //20
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            decoration: BoxDecoration(
              color: widget.hasError ? RED_ERROR_COLOR : FE_BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(
                0.0166 * _screenSize.width, //6,
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0.00138 * _screenSize.width, //0.5,
                  blurRadius: 0.0083 * _screenSize.width, //3,
                  color: Colors.grey[300],
                  offset: Offset(
                    0.0083 * _screenSize.width, //3,
                    0.0138 * _screenSize.width, //5,
                  ), //
                ),
              ],
              border: Border.all(
                color: widget.hasError ? Colors.red : Color(0xfff2f2f2),
              ),
            ),
            child: Directionality(
              textDirection: rtlTextDirection,
              child: GestureDetector(
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(
                          0.027 * _screenSize.width, //10,
                        ),
                        height: 0.111 * _screenSize.width, //40,
                        width: 0.111 * _screenSize.width, //40,
                        child: GlobalSvgImages.clearTextFieldIcon,
                      ),
                      onTap: () {
                        widget.changeTextFieldSearch('');
                        widget.phoneTextEditingController.clear();
                      },
                    ),
                    Expanded(
                      child: GestureDetector(
                        child: Directionality(
                          textDirection: ltrTextDirection,
                          child: Container(
                            color: Colors.transparent,
                            width: _screenSize.width,
                            height: 0.03125 * _screenSize.height, //20
                            child: TextField(
                              textDirection: ltrTextDirection,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onChanged: widget.changeTextFieldSearch,
                              autofocus: true,
                              style: TextStyle(
                                fontSize: 0.047 * _screenSize.width, //17,
                              ),
                              maxLines: 1,
                              controller: widget.phoneTextEditingController,
                              showCursor: true,
                              focusNode: widget.focusNode,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 0.047 * _screenSize.width, //17,
                                ),
                                hintText: '9125432778',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.015 * _screenSize.height, // 10,
                                  horizontal: 0.055 * _screenSize.width, // 20,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            widget.preTelCodePanelController.close();
                            widget.focusNode.unfocus();

                            widget.phoneTextEditingController.clear();
                          });
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                        0.0138 * _screenSize.width, //5,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 0.0138 * _screenSize.width, //5,
                        vertical: 0.0125 * _screenSize.height, //8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0.00138 * _screenSize.width, //0.5,
                            blurRadius: 0.027 * _screenSize.width, //10,
                            color: Colors.grey[300],
                            offset: Offset(
                              0.0138 * _screenSize.width, //5,

                              0.0138 * _screenSize.width, //5,
                            ), //
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Directionality(
                              textDirection: ltrTextDirection,
                              child: Text(
                                widget.selectedCountry.dialCode,
                                style: TextStyle(
                                  fontSize: 0.041 * _screenSize.width, //15,
                                  color: MAIN_BLUE_COLOR,
                                ),
                              )),
                          Icon(
                            Icons.phone,
                            color: MAIN_BLUE_COLOR,
                            size: 0.05 * _screenSize.width, //18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  widget.phoneTextEditingController.clear();
                  // widget.focusNode.unfocus();
                  widget.preTelCodePanelController.open();
                },
              ),
            ),
          ),
          Container(
            height: widget.keyboardIsOpen
                ? 0.4 * _screenSize.height //250,
                : 0,
          ),
        ],
      ),
    );
  }
}
