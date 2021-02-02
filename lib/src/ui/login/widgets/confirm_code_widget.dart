//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'dart:async';

import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/ui/login/widgets/single_input_code_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmCodeWidget extends StatefulWidget {
  // final PanelController keyboardPanelController;
  final TextEditingController phoneTextEditingController;
  final FocusNode focusNode;
  final bool keyboardIsOpen;
  final String inputPhone;
  final String inputCode;
  final bool hasError;
  final Country selectedCountry;
  final int selectedChar;
  final String minuteTimer;
  final String secondTimer;
  final Function(bool) backToInputPhoneStep;
  final Function(int) updateSelectedChar;
  final Function(String) updateInputCode;
  final Function() startDownTimer;

  const ConfirmCodeWidget({
    Key key,
    // this.keyboardPanelController,
    this.keyboardIsOpen,
    this.inputPhone,
    this.hasError,
    this.selectedCountry,
    this.inputCode,
    this.backToInputPhoneStep,
    this.updateSelectedChar,
    this.selectedChar,
    this.updateInputCode,
    this.minuteTimer,
    this.secondTimer,
    this.startDownTimer,
    this.phoneTextEditingController,
    this.focusNode,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfirmCodeWidgetState();
}

class _ConfirmCodeWidgetState extends State<ConfirmCodeWidget> {
  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 250,
      width: _screenSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Directionality(
            textDirection: rtlTextDirection,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.backToInputPhoneStep(true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          offset: Offset(3, 3),
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        GlobalSvgImages.editIconForRight,
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "login_screen.edit".tr(),
                          style: TextStyle(
                            color: MAIN_BLUE_COLOR,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  '(${widget.selectedCountry.dialCode}) ${toPhoneStyle(widget.inputPhone)}',
                  textDirection: ltrTextDirection,
                  style: TextStyle(
                    color: MAIN_BLUE_COLOR,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Directionality(
            textDirection: rtlTextDirection,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleInputCodeWidget(
                  selectedChar: widget.selectedChar,
                  inputCode: widget.inputCode,
                  focusNode: widget.focusNode,
                  hasError: widget.hasError,
                  updateSelectedChar: widget.updateSelectedChar,
                  updateChar: updateChar,
                  ordinal: 4,
                ),
                SizedBox(
                  width: 10,
                ),
                SingleInputCodeWidget(
                  selectedChar: widget.selectedChar,
                  inputCode: widget.inputCode,
                  focusNode: widget.focusNode,
                  hasError: widget.hasError,
                  updateSelectedChar: widget.updateSelectedChar,
                  updateChar: updateChar,
                  ordinal: 3,
                ),
                SizedBox(
                  width: 10,
                ),
                SingleInputCodeWidget(
                  selectedChar: widget.selectedChar,
                  inputCode: widget.inputCode,
                  focusNode: widget.focusNode,
                  hasError: widget.hasError,
                  updateSelectedChar: widget.updateSelectedChar,
                  updateChar: updateChar,
                  ordinal: 2,
                ),
                SizedBox(
                  width: 10,
                ),
                SingleInputCodeWidget(
                  selectedChar: widget.selectedChar,
                  inputCode: widget.inputCode,
                  focusNode: widget.focusNode,
                  hasError: widget.hasError,
                  updateSelectedChar: widget.updateSelectedChar,
                  updateChar: updateChar,
                  ordinal: 1,
                ),
                SizedBox(
                  width: 10,
                ),
                SingleInputCodeWidget(
                  selectedChar: widget.selectedChar,
                  inputCode: widget.inputCode,
                  focusNode: widget.focusNode,
                  hasError: widget.hasError,
                  updateSelectedChar: widget.updateSelectedChar,
                  updateChar: updateChar,
                  ordinal: 0,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 90,
          ),
          widget.minuteTimer == '00' && widget.secondTimer == '00'
              ? Container(
                  alignment: Alignment.center,
                  height: 25,
                  child: GestureDetector(
                    child: Text(
                      "login_screen.resend_code".tr(),
                      style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        widget.startDownTimer();
                        widget.updateInputCode('-----');
                      });
                    },
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  height: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalSvgImages.greyTimeIcon,
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'ارسال مجدد کد تا  ${widget.minuteTimer}:${widget.secondTimer}  دیگر',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
          // SizedBox(
          //   height: 20,
          // ),
        ],
      ),
    );
  }

  void openInitKeyboard() async {
    await Future.delayed(Duration(milliseconds: 500));
    // widget.phoneTextEditingController;
  }

  updateChar(int index, String char) {
    String oldCode = widget.inputCode;
    String newCode =
        oldCode.substring(0, index) + char + oldCode.substring(index + 1);
    print('new inputCode : $oldCode');
    setState(() {
      widget.updateInputCode(newCode);
    });
  }
}
