// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jeanswest/src/constants/global/api_respones.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/otp-req-response.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/auth-req-response.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

checkPhoneInput({
  @required BuildContext context,
  @required String phoneNumber,
  @required Map<int, Map<String, dynamic>> statusCodes,
  @required Function(bool) changeHasError,
  @required Function(String) changeErrorMsg,
  // @required Function() closePreTelCodePanelController,
  @required Function(bool) changeInputPhoneStep,
  @required Function() startDownTimer,
  @required Function(Map<String, dynamic>) apiResponse,
}) async {
  List<dynamic> phoneStringIsValid =
      checkCorrectPhone(inputPhone: phoneNumber, startWithZero: false);
  if (!phoneStringIsValid[0]) {
    changeHasError(true);
    changeErrorMsg(phoneStringIsValid[1]);
  } else {
    Map<String, String> otpReqBody = {
      "phoneNumber": "0$phoneNumber",
    };
    print('widget.phoneNumber : 0$phoneNumber');
    try {
      OTPReqResponse otpReq =
          await globalLocator<GlobalRestClient>().reqOtp(otpReqBody);
      if (otpReq.statusCode == 200) {
        // if (globalResponseJData.statusCode == 201) {
        print('req is successfuly , message : ${otpReq.message}');
        changeHasError(false);
        // closePreTelCodePanelController();
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
        changeInputPhoneStep(false);
        startDownTimer();
      } else {
        changeInputPhoneStep(true);
        print('req is NOOOOT successfuly');
        changeHasError(true);
        apiResponse(statusCodes[otpReq]);
      }
    } catch (e) {
      print('aaaaaaaaaaaaaa : ${e.response.data['statusCode']}');
      print(
          'aaaaaaaaaaaaaa : ${statusCodes[e.response.data['statusCode']]['perMessage']}');
      changeInputPhoneStep(true);
      print('req is NOOOOT successfuly');
      changeHasError(true);
      apiResponse(statusCodes[e.response.data['statusCode']]);
      // printErrorMessage(e);
    }
  }
}

checkCodeInput({
  @required BuildContext context,
  @required String phoneNumber,
  @required String verifyCode,
  @required Function(bool) changeHasError,
  @required Function(String) changeErrorMsg,
  @required Function(bool) changeInputPhoneStep,
  // @required Function(String, BuildContext) showSnackBarError,
}) async {
  List<dynamic> codeStringIsValid = checkCorrectCode(
    inputVerifyCode: verifyCode,
  );
  if (!codeStringIsValid[0]) {
    changeHasError(true);
    changeErrorMsg(codeStringIsValid[1]);
  } else {
    changeHasError(false);
    // closePreTelCodePanelController();
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild.unfocus();
    }
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
          globalLocator<SharedPreferences>()
              .setString(TOKEN, authReq.data.accessToken);
          print(
              'token has save, loaded token ${globalLocator<SharedPreferences>().getString(TOKEN)}');
          // getAllUserInfo(token: authReqData.accessToken); // ! Get All Info

          // !
          await Future.delayed(Duration(microseconds: 1000));
          await Phoenix.rebirth(context); // ! restart the app
        } else {
          changeInputPhoneStep(false);
          print('req is NOOOOT successfuly');
        }
      } else {
        print('statusCodes : ${statusCodes[authReq]["statusCodes"]}');
        print('message : ${statusCodes[authReq]["perMessage"]}');
        changeHasError(true);
        changeErrorMsg(statusCodes[authReq]["perMessage"]);
        // showSnackBarError(statusCodes[authReq]["perMessage"], context);
      }
    } catch (e) {
      changeErrorMsg(statusCodes[e.response.data['statusCode']]['perMessage']);
      changeHasError(true);
      printErrorMessage(e);
      print('error :(');
    }
  }
  // !
}

// bool checkCodeValidation(String pin) {
//   print('pin : $pin');
//   print('update checkVerifyCode');
//   List response = checkCorrectCode(
//     inputVerifyCode: pin,
//   );
//   bool checkVerifyCode = response[0];
//   print('checkVerifyCode : $checkVerifyCode');
//   return checkVerifyCode;
// }
