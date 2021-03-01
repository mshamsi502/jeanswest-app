// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/global-response-jdata.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';

Future<bool> checkIsAuthWithRetro(String phoneNumber) async {
  bool isSuccess;
  Map<String, String> reqBody = {
    "phoneNumber": "0$phoneNumber",
  };
  GlobalResponseJData globalResponseJData =
      await globalLocator<GlobalRestClient>().reqOtp(reqBody);

  // SuccessRespons successRespons =
  // await globalLocator<GlobalRestClient>().reqForVerifyCode(phoneNumber);
  isSuccess = globalResponseJData.data == "message sent";
  print('12315465498 -- successRespons.success : $isSuccess');
  return isSuccess ?? false;
}

Future<bool> checkConnectionInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  return (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi);
}

// bool localeIsRtl(BuildContext context) {
//   if (context.locale.toString() == 'fa_IR') {}
// }

class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}

throwException() {
  throw new CustomException('This is my first custom exception');
}

String toPriceStyle(int price) {
  String sPrice = price.toString();
  int _counter = 0;
  String comma = ',';
  for (var i = sPrice.length - 1; i >= 0; i--) {
    _counter++;
    if (_counter == 3) {
      comma = i == 0 ? '' : ',';
      sPrice =
          sPrice.substring(0, i) + comma + sPrice.substring(i, sPrice.length);
      _counter = 0;
    }
  }
  return sPrice;
}

String toPhoneStyle(String phone) {
  int _counter = 0;
  String comma = '-';
  bool isInit = true;
  for (var i = phone.length - 1; i >= 0; i--) {
    _counter++;
    if (isInit ? _counter == 4 : _counter == 3) {
      isInit = false;
      comma = i == 0 ? '' : '-';
      phone = phone.substring(0, i) + comma + phone.substring(i, phone.length);
      _counter = 0;
    }
  }
  return phone;
}

showToast({String message, FToast fToast}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Color(0xAA000000),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon(Icons.alternate_email),
        // SizedBox(
        //   width: 12.0,
        // ),
        Text(
          message,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            fontFamily: 'IRANSans',
          ),
        ),
      ],
    ),
  );
  // print(message);
  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: 1),
    positionedToastBuilder: (context, child) {
      return Positioned(
        child: child,
        bottom: MediaQuery.of(context).size.height / 6,
        left: 10,
        right: 10,
      );
    },
  );
  // print('bbbbbb ${fToast.context}');
}

bool checkFreeSend(String sendPrice) {
  return (sendPrice == null || sendPrice == '' || sendPrice == 'ریگان');
}

/// => this method listen to change [Orientation] ([portrait] or [landscape]) device
/// and update [width] of [screenSize] and [widthDropdown]
Orientation orientationDeviceListener(
    BuildContext context, Orientation myOrientation) {
  Orientation newOrientation;
  if (MediaQuery.of(context).orientation != myOrientation) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      print('####  Orientation change to :  portrait');
      newOrientation = Orientation.portrait;
    } else {
      print('####  Orientation change to :  portrait');
      newOrientation = Orientation.portrait;
    }
  }
  return newOrientation;
}

/// => [printErrorMessage] is handling try-catch and print Errors
printErrorMessage(DioError e) {
  if (e.response != null) {
    print("respone is NOOOOT Null");
    print("%% pEM - e..res.data : ${e.response.data}");
    print("%% pEM - e..res.headers : ${e.response.headers}");
    print("%% pEM - e..res.request : ${e.response.request}");
  } else {
    // Something happened in setting up or sending the request that triggered an Error
    print("respone is Null");
    print("%% pEM - e.req : ${e.request}");
    print("%% pEM - e.mess : ${e.message}");
  }
}
