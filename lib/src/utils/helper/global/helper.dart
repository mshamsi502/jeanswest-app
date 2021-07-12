// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:typed_data';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-int.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-filter-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-option-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-req-body.dart';
import 'package:jeanswest/src/models/api_body/productFilter/product-unique-req-body.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/otp-req-response.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/branch/branch-for-product.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';
import 'package:latlong/latlong.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:io';

import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/extra.dart' as android_extra;

Map<String, double> updateHeigths({
  double screenHeight,
  int lines,
  String title,
  bool hasValidation,
  bool isValid,
}) {
  double heightTextField =
      (lines == null || lines == 1) ? 25 : ((20 * lines.toDouble()) + 25);
  double heightTitle = (title == null || title == "") ? 15 : 55;
  double heightError = ((!hasValidation && isValid) ? 0 : 25);
  // print("heightTitle ---- : $heightTitle");
  // print("heightTextField ---- : $heightTextField");
  // print("heightError ---- : $heightError");
  // print("---------------------------------");
  double totalHeigth = heightTextField + heightTitle + heightError + 10;
  return {
    'heightTitle': heightTitle,
    'heightTextField': heightTextField,
    'heightError': heightError,
    'totalHeigth': totalHeigth,
  };
}

backPanelClose(List<PanelController> panelControllers, BuildContext context) {
  bool isColse = false;
  for (int index = 0; index < panelControllers.length; index++) {
    // print(
    //     "panelControllers[$index] is open? ${panelControllers[index].isPanelOpen}");
    if (panelControllers[index].isPanelOpen) {
      panelControllers[index].close();
      isColse = true;
    }
    if (isColse) break;
  }
  if (!isColse) {
    // print('all panel is close, navigation.pop');
    Navigator.pop(context);
  }
}

Future<bool> checkIsAuthWithRetro(String phoneNumber) async {
  bool isSuccess;
  Map<String, String> reqBody = {
    "phoneNumber": "0$phoneNumber",
  };
  OTPReqResponse oTPReqResponse =
      await globalLocator<GlobalRestClient>().reqOtp(reqBody);

  // SuccessRespons successRespons =
  // await globalLocator<GlobalRestClient>().reqForVerifyCode(phoneNumber);
  isSuccess = oTPReqResponse.statusCode == 200;
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

String toPriceStyle(int price, {bool isFromRialToToman = false}) {
  String sPrice = price.toString();
  if (isFromRialToToman) {
    if (sPrice == null || sPrice == "" || sPrice == "0")
      sPrice = "0";
    else
      sPrice = (int.parse(sPrice) ~/ 10).toString();
  }
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
  @required String message,
  Color textColor = Colors.black,
  FontWeight fontWeight = FontWeight.w600,
  double fontSize = 14,
  Color backgroundColor = DARK_GREY,
}) async {
  TextStyle _textStyle = TextStyle(
    fontWeight: fontWeight,
    color: textColor,
    fontSize: fontSize,
  );
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..toastPosition = EasyLoadingToastPosition.top
    ..indicatorSize = 0
    ..indicatorWidget = SizedBox()
    ..loadingStyle = EasyLoadingStyle.custom
    ..radius = 10.0
    ..backgroundColor = backgroundColor
    ..textStyle = _textStyle
    ..maskType = EasyLoadingMaskType.none
    ..maskColor = Colors.transparent
    ..userInteractions = true
    ..dismissOnTap = true;
  EasyLoading.showToast(
    message,
    maskType: EasyLoadingMaskType.custom,
    duration: Duration(milliseconds: 1500),
  );
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

scrollJumpAfterKeyborad({
  @required KeyboardVisibilityController keyboardVisibilityController,
  @required ScrollController scrollController,
  @required Size screenSize,
}) {
  keyboardVisibilityController.onChange.listen((bool visible) {
    if (visible && scrollController.hasClients) {
      // scrollController.jumpTo(screenSize.height);
      double pos = screenSize.height;
      while (pos <= scrollController.position.maxScrollExtent) {
        pos = pos + 10;
      }
      // scrollController.jumpTo(scrollController.position.maxScrollExtent);
      scrollController.jumpTo(pos);
    } else {
      scrollController.jumpTo(0);
    }
  });
  // KeyboardVisibilityNotification().addNewListener(
  //   onHide: () {
  //
  //   },
  //   onShow: () {
  //     // scrollController.jumpTo(screenSize.height);
  //     double pos = screenSize.height;
  //     while (pos <= scrollController.position.maxScrollExtent) {
  //       pos = pos + 10;
  //     }
  //     // scrollController.jumpTo(scrollController.position.maxScrollExtent);
  //     scrollController.jumpTo(pos);
  //   },
  // );
}

Future<Uint8List> capturePng(GlobalKey globalKey) async {
  if (globalKey == null) return null;
  RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
  ui.Image image = await boundary.toImage(pixelRatio: 3);
  ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData.buffer.asUint8List();
  return pngBytes;
}

// Future<Uint8List> takeSnapshotMethod(GoogleMapController controller) {
//   return controller.takeSnapshot();
// }

shareATextLink(String textLink) {
  // String link = 'club.avakatan.ir/public/jeanswest.apk';
  // String text = 'به جین وست ملحق شو :)\n$link';

  if (Platform.isAndroid) {
    android_intent.Intent()
      ..setAction(android_action.Action.ACTION_SEND)
      ..setType('text/plain')
      ..putExtra(android_extra.Extra.EXTRA_TEXT, textLink)
      ..startActivity().catchError((e) => print(e));
  }

  // ignore: unused_element

  //  else if (Platform.isIOS) {
  //   // IOS Intent to Map Apps
  //   //   "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"
  //   Uri.parse(
  //       'comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit');
  // } else {
  //   // Other OS Intent to Map Apps
  // }
}

Future<ListOfProductsRes> getAllColorsAndSizes(String styleCode) async {
  // ListOfProductsRes allColorsAndSizesProducts;
  Map<String, dynamic> mapFilter = {
    "filter": {
      "styleCode": {"eq": styleCode},
      // "quantity": {"gt": 0}
    },
    "option": {
      "page": {"eq": 1},
      "limit": {"eq": 20}
    },
    "unique": {
      "color": {"eq": 1}
    }
  };
  return await globalLocator<GlobalRestClient>().getProductList(mapFilter);
}

Future<ListOfProductsRes> getRelatedProduct({
  // SingleProductInfoRes product,
  @required String group,
  @required String subGroup,
  @required String gender,
  @required String ageGroup,
}) async {
  ProductReqBody filter = ProductReqBody(
    filter: ProductFilterReqBody(
      group: OperationString(oEQ: group),
      subGroup: OperationString(oEQ: subGroup),
      gender: OperationString(oEQ: gender),
      ageGroup: OperationString(oEQ: ageGroup),
      // quantity: OperationInt(
      //   oGT: 0,
      // ),
    ),
    option: ProductOptionReqBody(
      page: OperationInt(oEQ: 1),
      limit: OperationInt(oEQ: 8),
      ascent: OperationInt(oEQ: 1),
      sort: OperationString(oEQ: RANDOM_SORT),
    ),
    unique: ProductUniqueReqBody(
      color: OperationInt(oEQ: 1),
    ),
  );
  return await globalLocator<GlobalRestClient>().getProductList(filter.map);
}

Future<List<double>> createDistances(
    {@required List<BranchForProduct> branches}) async {
  CameraPosition userLocation = await updateUserLocation();
  List<double> _distances = [];
  branches.forEach((branch) {
    double _dis = getDistanceFromLatLonInKm(
      lat1: userLocation.target.latitude,
      lon1: userLocation.target.longitude,
      lat2: double.parse(branch.lat),
      lon2: double.parse(branch.lng),
    );
    _distances.add(_dis);
  });
  return _distances;
}

double getDistanceFromLatLonInKm({
  @required double lat1,
  @required double lon1,
  @required double lat2,
  @required double lon2,
}) {
  double R = 6371; // Radius of the earth in km
  double dLat = deg2rad(deg: lat2 - lat1); // deg2rad below
  double dLon = deg2rad(deg: lon2 - lon1);
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(deg2rad(deg: lat1)) *
          cos(deg2rad(deg: lat2)) *
          sin(dLon / 2) *
          sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  double d = R * c; // Distance in km
  return d;
}

double deg2rad({@required double deg}) {
  return deg * (PI / 180);
}
