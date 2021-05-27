//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/services.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginBodyWidget extends StatefulWidget {
  final TextEditingController phoneTextEditingController;
  final FocusNode focusNode;
  // final PanelController preTelCodePanelController;
  final String inputPhone;
  final bool hasError;
  final bool check;
  final Country selectedCountry;
  final Function(String) changeTextFieldSearch;
  final Function(List<dynamic>) changeHasError;

  const LoginBodyWidget({
    Key key,
    this.phoneTextEditingController,
    // this.preTelCodePanelController,
    this.inputPhone,
    this.hasError,
    this.selectedCountry,
    this.focusNode,
    this.changeTextFieldSearch,
    this.changeHasError,
    this.check,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  String hintPhone = '0 9 - - - - - - - - -';
  bool keyboardIsOpen;
  var keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    keyboardIsOpen = false;
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible)
        setState(() {
          keyboardIsOpen = true;
        });
      else {
        widget.focusNode.unfocus();
        setState(() {
          keyboardIsOpen = false;
        });
      }
    });
    // KeyboardVisibilityNotification().addNewListener(
    //   onChange: (bool visible) {
    //     if (visible)
    //       setState(() {
    //         keyboardIsOpen = true;
    //       });
    //     else {
    //       widget.focusNode.unfocus();
    //       setState(() {
    //         keyboardIsOpen = false;
    //       });
    //     }
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
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
            height: 0.031 * _screenSize.height, //20,
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
              color: (widget.hasError
                      // || !widget.check
                      ) &&
                      !(widget.inputPhone == null || widget.inputPhone == '')
                  ? RED_ERROR_COLOR
                  : keyboardIsOpen
                      ? Colors.white
                      : F2_BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(
                0.0166 * _screenSize.width, //6,
              ),
              border: Border.all(
                color: (widget.hasError
                        // || !widget.check
                        ) &&
                        !(widget.inputPhone == null || widget.inputPhone == '')
                    ? Colors.red
                    : keyboardIsOpen
                        ? MAIN_BLUE_COLOR
                        : F2_BACKGROUND_COLOR,
              ),
            ),
            child: Directionality(
              textDirection: rtlTextDirection,
              child: GestureDetector(
                child: Row(
                  children: [
                    widget.phoneTextEditingController.text == ''
                        ? SizedBox()
                        : GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(
                                0.027 * _screenSize.width, //10,
                              ),
                              height: 0.111 * _screenSize.width, //40,
                              width: 0.111 * _screenSize.width, //40,
                              child: (widget.hasError
                                      // || !widget.check
                                      ) &&
                                      !(widget.inputPhone == null ||
                                          widget.inputPhone == '')
                                  ? GlobalSvgImages.whiteClearTextFieldIcon
                                  : GlobalSvgImages.greyClearTextFieldIcon,
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
                            // color: Colors.red,
                            width: _screenSize.width,
                            // height: 0.03125 * _screenSize.height, //20
                            child: TextField(
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(11),
                              ],
                              textDirection: ltrTextDirection,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onChanged: widget.changeTextFieldSearch,
                              autofocus: false,
                              onSubmitted: (value) {
                                List<dynamic> checkPhone = checkCorrectPhone(
                                    inputPhone: value, startWithZero: true);
                                widget.changeHasError(checkPhone);
                                widget.focusNode.unfocus();
                              },
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
                                hintText: hintPhone,
                                contentPadding: EdgeInsets.symmetric(
                                  //   vertical:
                                  //       0.015 * _screenSize.height, // 10,
                                  horizontal: 0.055 * _screenSize.width, // 20,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            widget.focusNode.unfocus();
                            widget.phoneTextEditingController.clear();
                          });
                        },
                      ),
                    ),
                    // Container(
                    //   child: VerticalDivider(
                    //     thickness: 0.00138 * _screenSize.width, //0.5,
                    //     width: 0.00277 * _screenSize.width, //1,
                    //     color: Colors.grey,
                    //     indent: 0.0194 * _screenSize.width, //7,
                    //     endIndent: 0.0194 * _screenSize.width, //7,
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: 0.041 * _screenSize.width, //15,
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 0.00625 * _screenSize.height, //4,
                    //   ),
                    //   child: Text(
                    //     '+98',
                    //     textDirection: ltrTextDirection,
                    //     style: TextStyle(
                    //       fontSize: 0.041 * _screenSize.width, //15,
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      width: 0.027 * _screenSize.width, //10,
                    ),
                  ],
                ),
                onTap: () {
                  widget.phoneTextEditingController.clear();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
