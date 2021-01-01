//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    5th October - 05/10/2020     _     14:32:15
//****************************************************************************

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

Color fadeColor(String color, double controller) {
  // print('controller[150, 120] :  ${controller.round()}');
  // print(
  //     'opacity :  ${((8.5 * (controller) - 1020).round())} : ${((8.5 * (controller) - 1020).round()).toRadixString(16)}');

  String colorCode =
      '0x${((8.5 * (controller) - 1020).round()).toRadixString(16)}$color';
  // print('colorCode $colorCode');
  return Color(int.parse(colorCode));
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

showToast(String message, FToast fToast) {
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
