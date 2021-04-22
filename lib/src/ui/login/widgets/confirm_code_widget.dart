//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:extended_text/extended_text.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ConfirmCodeWidget extends StatefulWidget {
  // final PanelController keyboardPanelController;
  final TextEditingController phoneTextEditingController;
  final FocusNode focusNode;
  final String inputPhone;
  final bool hasError;
  final String minuteTimer;
  final String secondTimer;
  final Function(bool) backToInputPhoneStep;
  final Function() resendCodeToAlreadyPhone;
  final Function(bool) updateHasError;
  final Function(String) updateErrorMsg;
  final Function(String) updateInputCode;
  final Function() startDownTimer;
  // final

  const ConfirmCodeWidget({
    Key key,
    this.inputPhone,
    this.hasError,
    this.backToInputPhoneStep,
    this.updateInputCode,
    this.minuteTimer,
    this.secondTimer,
    this.startDownTimer,
    this.phoneTextEditingController,
    this.resendCodeToAlreadyPhone,
    this.focusNode,
    this.updateHasError,
    this.updateErrorMsg,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfirmCodeWidgetState();
}

class _ConfirmCodeWidgetState extends State<ConfirmCodeWidget> {
  TextEditingController textEditingController = new TextEditingController();
  bool checkVerifyCode = true;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      // height: 280,
      // color: Colors.amber,
      width: _screenSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topCenter,
            width: _screenSize.width,
            margin: EdgeInsets.symmetric(
              horizontal: 0.054 * _screenSize.width, //20
            ),
            child: ExtendedText.rich(
              TextSpan(
                text:
                    // 'کد تایید برای شماره موبایل ${toPhoneStyle(widget.inputPhone)}(${widget.selectedCountry.dialCode}) ارسال گردید.',
                    // 'کد تایید برای شماره موبایل ${toPhoneStyle(widget.inputPhone)}(98+) ارسال گردید.',
                    'کد تایید برای شماره موبایل ${widget.inputPhone} (98+) ارسال گردید.',
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                  color: Colors.grey[700],
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: GestureDetector(
                      onTap: () => widget.backToInputPhoneStep(true),
                      child: Container(
                        width: 0.3 * _screenSize.width, //108,
                        // color: Colors.red,
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.022 * _screenSize.width, //8,
                            vertical: 0.003125 * _screenSize.height //2,
                            ),
                        child: Row(
                          children: [
                            Container(
                                height: 0.034 * _screenSize.width, //12,
                                width: 0.034 * _screenSize.width, //12,
                                child: GlobalSvgImages.editIconForRight),
                            SizedBox(
                              width: 0.0138 * _screenSize.width, //5,
                            ),
                            Text(
                              "login_screen.edit".tr(),
                              style: TextStyle(
                                color: MAIN_BLUE_00_COLOR,
                                fontWeight: FontWeight.w500,
                                fontSize: 0.0333 * _screenSize.width, //12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: SizedBox(
                      width: 0.027 * _screenSize.width, //10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.039 * _screenSize.height, //25,
          ),
          Directionality(
            textDirection: ltrTextDirection,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.111 * _screenSize.width, //40,
              ),
              child: PinPut(
                fieldsCount: 5,
                autofocus: true,
                textStyle: TextStyle(
                  fontSize: 0.05 * _screenSize.width, //18,
                ),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                onSubmit: (String pin) => setState(() {
                  widget.updateInputCode(pin);
                  List response = checkCorrectCode(
                    inputVerifyCode: pin,
                  );
                  checkVerifyCode = response[0];
                  widget.updateHasError(!checkVerifyCode);
                  print('widget.hasError : ${widget.hasError}');
                }),
                focusNode: widget.focusNode,
                controller: textEditingController,
                submittedFieldDecoration: BoxDecoration(
                  color: !widget.hasError && checkVerifyCode
                      ? Colors.white
                      : BACKGROUND_RED_LABEL_TEXT_COLOR,
                  border: Border.all(
                    color: MAIN_BLUE_COLOR,
                  ),
                  borderRadius: BorderRadius.circular(
                    0.011 * _screenSize.width, //4,
                  ),
                ),
                selectedFieldDecoration: BoxDecoration(
                  color: !widget.hasError && checkVerifyCode
                      ? Colors.white
                      : RED_ERROR_COLOR,
                  border: Border.all(color: MAIN_BLUE_COLOR),
                  borderRadius: BorderRadius.circular(
                    0.011 * _screenSize.width, //4,
                  ),
                ),
                followingFieldDecoration: BoxDecoration(
                  color: !widget.hasError && checkVerifyCode
                      ? F2_BACKGROUND_COLOR
                      : RED_ERROR_COLOR,
                  border: Border.all(
                    color: !widget.hasError && checkVerifyCode
                        ? F2_BACKGROUND_COLOR
                        : RED_ERROR_COLOR,
                  ),
                  borderRadius: BorderRadius.circular(
                    0.011 * _screenSize.width, //4,
                  ),
                ),
                eachFieldWidth: 0.13333 * _screenSize.width, //48,
                eachFieldHeight: 0.13333 * _screenSize.width, //48,
              ),
            ),
          ),
          SizedBox(
            height: 0.17736 * _screenSize.height, //105,
          ),
          widget.minuteTimer == '00' && widget.secondTimer == '00'
              ? Container(
                  alignment: Alignment.center,
                  height: 0.039 * _screenSize.height, //25,
                  child: GestureDetector(
                    child: Text(
                      "login_screen.resend_code".tr(),
                      style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onTap: () {
                      widget.resendCodeToAlreadyPhone();
                      widget.updateHasError(false);
                      widget.updateErrorMsg('');
                      widget.startDownTimer();
                    },
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  height: 0.039 * _screenSize.height, //25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 0.034 * _screenSize.width, //12,
                          width: 0.034 * _screenSize.width, //12,
                          child: GlobalSvgImages.greyTimeIcon),
                      SizedBox(
                        width: 0.0138 * _screenSize.width, //5,
                      ),
                      Text(
                        'ارسال مجدد کد تا  ${widget.minuteTimer}:${widget.secondTimer}  دیگر',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 0.0333 * _screenSize.width, //12,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
