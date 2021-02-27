//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/authRes/auth-res.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/global-response-jdata.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
// import 'package:jeanswest/src/models/api_response/loginRes/mockoonRes/login-and-get-token-res.dart';
// import 'package:jeanswest/src/models/api_response/loginRes/mockoonRes/login-and-get-token-res.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/getAllInfo/get-all-info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ConfirmButtonWidget extends StatefulWidget {
  final bool check;
  final String phoneNumber;
  final String verifyCode;
  final Country selectedCountry;
  final bool isInputPhoneStep;
  final Function(bool) changeInputPhoneStep;
  final bool hasError;
  final Function(bool) changeHasError;
  final Function() checkCorrectPhone;
  final Function() checkCorrectCode;
  final Function() closePreTelCodePanelController;
  final Function() startDownTimer;
  final Function(int) changeSelectedCodeChar;
  final Function(String, BuildContext) showSnackBarError;

  const ConfirmButtonWidget({
    Key key,
    this.check,
    this.isInputPhoneStep,
    this.changeInputPhoneStep,
    this.hasError,
    this.changeHasError,
    this.checkCorrectPhone,
    this.checkCorrectCode,
    this.closePreTelCodePanelController,
    this.startDownTimer,
    this.changeSelectedCodeChar,
    this.showSnackBarError,
    this.phoneNumber,
    this.verifyCode,
    this.selectedCountry,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfirmButtonWidgetState();
}

class _ConfirmButtonWidgetState extends State<ConfirmButtonWidget> {
  bool darftCheck;
  checkInput(BuildContext context) async {
    if (widget.isInputPhoneStep) {
      Map<String, String> reqBody = {
        "phoneNumber": "0${widget.phoneNumber}",
      };
      print('widget.phoneNumber : 0${widget.phoneNumber}');
      GlobalResponseJData globalResponseJData =
          await globalLocator<GlobalRestClient>().reqOtp(reqBody);
      if (globalResponseJData.data == "message sent") {
        // if (globalResponseJData.statusCode == 201) {
        print('req is successfuly , data ${globalResponseJData.data}');
        widget.changeHasError(false);
        widget.closePreTelCodePanelController();
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
        widget.changeInputPhoneStep(false);
        widget.startDownTimer();
      } else {
        widget.changeInputPhoneStep(true);
        print('req is NOOOOT successfuly');
        widget.changeHasError(true);
        widget.showSnackBarError(globalResponseJData.data, context);
      }
    } else {
      widget.changeHasError(false);
      widget.closePreTelCodePanelController();
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        currentFocus.focusedChild.unfocus();
      }

      // !
      // LoginAndGetTokenRes loginAndGetToken =
      //     await mockoonGlobalLocator<GlobalRestClient>()
      //         .getVerifyCode(widget.phoneNumber, widget.verifyCode);
      // if (loginAndGetToken.success) {
      //   print(
      //       'success is ${loginAndGetToken.success} , token ${loginAndGetToken.token}');
      //   mockoonGlobalLocator<SharedPreferences>()
      //       .setString(TOKEN, loginAndGetToken.token);
      //   print(
      //       'token has save, loaded token ${mockoonGlobalLocator<SharedPreferences>().getString(TOKEN)}');
      //   getAllUserInfo(token: loginAndGetToken.token); // ! Get All Info

      // !

      Map<String, String> reqBody = {
        "phoneNumber": widget.phoneNumber,
        "pin": widget.verifyCode,
      };

      AuthRes authRes =
          await globalLocator<GlobalRestClient>().reqAuth(reqBody);
      if (authRes.token != null) {
        print('req is successfuly , token ${authRes.token}');
        globalLocator<SharedPreferences>().setString(TOKEN, authRes.token);
        print(
            'token has save, loaded token ${globalLocator<SharedPreferences>().getString(TOKEN)}');
        getAllUserInfo(token: authRes.token); // ! Get All Info

        // !
        Phoenix.rebirth(context); // ! restart the app
      } else {
        widget.changeInputPhoneStep(false);
        print('req is NOOOOT successfuly');
      }
    }
  }

  // @override
  // void initState() {
  //   // _check = widget.check;
  //   darftCheck = widget.check;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // if (darftCheck != widget.check) {
    //   darftCheck = widget.check;
    //   _check = widget.check;
    // }
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
          title: widget.isInputPhoneStep ? 'ارسال کد تایید' : 'ورود',
          height: 0.07 * _screenSize.height, //45,
          width: _screenSize.width,
          fontSize: 0.05 * _screenSize.width, //18,
          radius: 0.011 * _screenSize.width, //4,
          onTap: () async {
            widget.check
                ? checkInput(context)
                : print('checked and is NOT OK :(');
          }),
    );
  }
}
