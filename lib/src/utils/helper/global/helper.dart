// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/services/rest_client_global.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

backPanelClose(List<PanelController> panelControllers, BuildContext context) {
  bool isColse = false;
  for (int index = 0; index < panelControllers.length; index++) {
    if (panelControllers[index].isPanelOpen) {
      panelControllers[index].close();
      isColse = true;
    }
    if (isColse) break;
  }
  if (!isColse) {
    print('all panel is close, navigation.pop');
    Navigator.pop(context);
  }
}

Future<bool> checkIsAuthWithRetro(String phoneNumber) async {
  bool isSuccess;
  Map<String, String> reqBody = {
    "phoneNumber": "0$phoneNumber",
  };
  GeneralRespons globalResponseJData =
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

String shamsiDayOfWeek(int year, int mouth, int day) {
  String shamsiDay;
  Jalali j = Jalali(year, mouth, day);

  int dayOfWeek = j.weekDay;
  switch (dayOfWeek) {
    case 0:
      {
        shamsiDay = 'جمعه';
      }
      break;
    case 1:
      {
        shamsiDay = 'شنبه';
      }
      break;
    case 2:
      {
        shamsiDay = 'یک شنبه';
      }
      break;
    case 3:
      {
        shamsiDay = 'دوشنبه';
      }
      break;
    case 4:
      {
        shamsiDay = 'سه شنبه';
      }
      break;
    case 5:
      {
        shamsiDay = 'چهار شنبه';
      }
      break;
    case 6:
      {
        shamsiDay = 'پنج شنبه';
      }
      break;
  }
  return shamsiDay;
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

showToast({
  String message,
// FToast fToast
}) {
  // Widget toast = Container(
  //   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
  //   decoration: BoxDecoration(
  //     borderRadius: BorderRadius.circular(25.0),
  //     color: Color(0xAA000000),
  //   ),
  //   child: Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       // Icon(Icons.alternate_email),
  //       // SizedBox(
  //       //   width: 12.0,
  //       // ),
  //       Text(
  //         message,
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 12.0,
  //           fontFamily: 'IRANSans',
  //         ),
  //       ),
  //     ],
  //   ),
  // );
  // print(message);

  //!
  // fToast.showToast(
  //   child: toast,
  //   gravity: ToastGravity.CENTER,
  //   toastDuration: Duration(seconds: 1),
  //   positionedToastBuilder: (context, child) {
  //     return Positioned(
  //       child: child,
  //       bottom: MediaQuery.of(context).size.height / 6,
  //       left: 10,
  //       right: 10,
  //     );
  //   },
  // );
  //!
  EasyLoading.instance
        ..displayDuration = const Duration(milliseconds: 2000)
        ..indicatorType = EasyLoadingIndicatorType.fadingCircle
        ..loadingStyle = EasyLoadingStyle.dark
        ..indicatorSize = 45.0
        ..radius = 10.0
        ..progressColor = Colors.yellow
        ..backgroundColor = Colors.green
        ..indicatorColor = Colors.yellow
        ..textColor = Colors.yellow
        ..maskColor = Colors.blue.withOpacity(0.5)
        ..userInteractions = true
        ..dismissOnTap = false
      // ..customAnimation = EasyLoadingAnimation()
      ;
  EasyLoading.show(
    status: message,
  );
  //!
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

scrollJumpAfterKeyborad({ScrollController scrollController, Size screenSize}) {
  KeyboardVisibilityNotification().addNewListener(
    onHide: () {
      scrollController.jumpTo(0);
    },
    onShow: () {
      scrollController.jumpTo(screenSize.width);
    },
  );
}
