//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/api_respones.dart';
// import 'package:jeanswest/src/models/country/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

import 'package:jeanswest/src/utils/helper/login/helper.dart';

class ConfirmButtonWidget extends StatefulWidget {
  final bool check;
  final String phoneNumber;
  final String verifyCode;
  // final Country selectedCountry;
  final bool isInputPhoneStep;
  final Function(bool) changeInputPhoneStep;
  final bool hasError;
  final Function(bool) changeHasError;
  final Function(String) changeErrorMessage;
  final Function() checkCorrectPhone;
  final Function() checkCorrectCode;
  // final Function() closePreTelCodePanelController;
  final Function() startDownTimer;
  // final Function(int) changeSelectedCodeChar;
  // final Function(String, BuildContext) showSnackBarError;

  const ConfirmButtonWidget({
    Key key,
    this.check,
    this.isInputPhoneStep,
    this.changeInputPhoneStep,
    this.hasError,
    this.changeHasError,
    this.checkCorrectPhone,
    this.checkCorrectCode,
    // this.closePreTelCodePanelController,
    this.startDownTimer,
    // this.changeSelectedCodeChar,
    // this.showSnackBarError,
    this.phoneNumber,
    this.verifyCode,
    // this.selectedCountry,
    this.changeErrorMessage,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfirmButtonWidgetState();
}

class _ConfirmButtonWidgetState extends State<ConfirmButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0.054 * _screenSize.width, //20
      ),
      child: AvakatanButtonWidget(
          backgroundColor: (!widget.isInputPhoneStep) || widget.check
              ? MAIN_BLUE_COLOR
              : F7_BACKGROUND_COLOR,
          textColor: (!widget.isInputPhoneStep) || widget.check
              ? Colors.white
              : Colors.grey,
          borderColor: (!widget.isInputPhoneStep) || widget.check
              ? MAIN_BLUE_COLOR
              : Colors.grey[100],
          hasShadow: false,
          title: widget.isInputPhoneStep ? 'ارسال کد تایید' : 'تایید',
          height: 0.07 * _screenSize.height, //45,
          width: _screenSize.width,
          fontSize: 0.05 * _screenSize.width, //18,
          radius: 0.011 * _screenSize.width, //4,
          onTap: () async {
            widget.check
                ? widget.isInputPhoneStep
                    ? checkPhoneInput(
                        context: context,
                        phoneNumber: widget.phoneNumber,
                        statusCodes: statusCodes,
                        changeHasError: widget.changeHasError,
                        changeErrorMsg: (String msg) =>
                            widget.changeErrorMessage(msg),
                        changeInputPhoneStep: widget.changeInputPhoneStep,
                        startDownTimer: widget.startDownTimer,
                        apiResponse: (Map<String, dynamic> response) =>
                            setState(() {
                          if (response['statusCode'] == 200) {
                            widget.changeHasError(false);
                            widget.changeErrorMessage('');
                          } else {
                            widget.changeHasError(true);
                            String errorMsg = response['perMessage'];
                            widget.changeErrorMessage(errorMsg);
                          }
                        }),
                      )
                    : checkCodeInput(
                        context: context,
                        phoneNumber: widget.phoneNumber,
                        verifyCode: widget.verifyCode,
                        changeHasError: widget.changeHasError,
                        changeErrorMsg: (String msg) =>
                            widget.changeErrorMessage(msg),
                        changeInputPhoneStep: widget.changeInputPhoneStep,
                      )
                : print('checked and is NOT OK :(');
          }),
    );
  }
}
