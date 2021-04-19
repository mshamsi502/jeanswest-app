// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jeanswest/src/constants/global/api_respones.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/auth-req-response.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';

checkPhoneInput({
  @required BuildContext context,
  @required String phoneNumber,
  @required Map<int, Map<String, dynamic>> statusCodes,
  @required Function(bool) changeHasError,
  @required Function() closePreTelCodePanelController,
  @required Function(bool) changeInputPhoneStep,
  @required Function() startDownTimer,
  @required Function(String, BuildContext) showSnackBarError,
}) async {
  Map<String, String> otpReqBody = {
    "phoneNumber": "0$phoneNumber",
  };
  print('widget.phoneNumber : 0$phoneNumber');
  GeneralRespons otpReq =
      await globalLocator<GlobalRestClient>().reqOtp(otpReqBody);
  if (otpReq.statusCode == 200) {
    // if (globalResponseJData.statusCode == 201) {
    print('req is successfuly , message : ${otpReq.message}');
    changeHasError(false);
    closePreTelCodePanelController();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild.unfocus();
    }
    changeInputPhoneStep(false);
    startDownTimer();
  } else {
    changeInputPhoneStep(true);
    print('req is NOOOOT successfuly');
    changeHasError(true);
    showSnackBarError(statusCodes[otpReq]["perMessage"], context);
  }
}

checkCodeInput({
  BuildContext context,
  String phoneNumber,
  String verifyCode,
  Function(bool) changeHasError,
  Function() closePreTelCodePanelController,
  Function(bool) changeInputPhoneStep,
  Function(String, BuildContext) showSnackBarError,
}) async {
  changeHasError(false);
  closePreTelCodePanelController();
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.focusedChild.unfocus();
  }
  bool checkVerifyCode = checkCodeValidation(verifyCode);
  if (checkVerifyCode) {
    Map<String, String> authReqBody = {
      "phoneNumber": "0$phoneNumber",
      "pin": verifyCode
    };
    print('phoneNumber: 0$phoneNumber');
    print('pin: $verifyCode');
    try {
      AuthReqRespons authReq =
          await globalLocator<GlobalRestClient>().reqAuth(authReqBody);
      if (authReq.statusCode == 200) {
        if (authReq.data.accessToken != null &&
            authReq.data.accessToken != '') {
          print('req is successfuly , token ${authReq.data.accessToken}');
          // globalLocator<SharedPreferences>()
          //     .setString(TOKEN, authReq.data.accessToken);
          // print(
          //     'token has save, loaded token ${globalLocator<SharedPreferences>().getString(TOKEN)}');
          // getAllUserInfo(token: authReqData.accessToken); // ! Get All Info

          // !
          Phoenix.rebirth(context); // ! restart the app
        } else {
          changeInputPhoneStep(false);
          print('req is NOOOOT successfuly');
        }
      } else {
        print('statusCodes : ${statusCodes[authReq]["statusCodes"]}');
        print('message : ${statusCodes[authReq]["perMessage"]}');
        showSnackBarError(statusCodes[authReq]["perMessage"], context);
      }
    } catch (e) {
      printErrorMessage(e);
      print('error :(');
    }
  } else
    changeHasError(true);
}

bool checkCodeValidation(String pin) {
  print('pin : $pin');
  print('update checkVerifyCode');
  List response = checkCorrectCode(
    inputVerifyCode: pin,
  );
  bool checkVerifyCode = response[0];
  print('checkVerifyCode : $checkVerifyCode');
  return checkVerifyCode;
}
