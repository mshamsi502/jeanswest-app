<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/ui/profile/screens/main_profile_page.dart';
import 'package:jeanswest/src/ui/store/screens/main_store_page.dart';
import 'package:jeanswest/src/utils/helper/getInfos/get-all-info.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> createBottomNavigationBarPages({bool isAuth}) {
  // ignore: deprecated_member_use
  List<Widget> _children = List<Widget>();
  bool pagesCreatedFinished = false;
  _children.add(MainProfilePage(
    isAuth: !isAuth,
    // screenSize: screenSize,
    showCompeletProfileMessage: showCompeletProfileMessage,
    changeCompeletProfileMessage: (bool value) =>
        showCompeletProfileMessage = value,
  ));
  _children.add(Container(color: Colors.white));
  // _children.add(Container(color: Colors.blue));
  _children.add(MainStorePage());
  // _children.add(shoppingBasketPage);
  _children.add(Container(color: Colors.green));
  _children.add(MainProfilePage(
    isAuth: isAuth,
    // screenSize: screenSize,
    showCompeletProfileMessage: showCompeletProfileMessage,
    changeCompeletProfileMessage: (bool value) =>
        showCompeletProfileMessage = value,
  ));
  pagesCreatedFinished = true;
  return {
    'success': pagesCreatedFinished,
    'children': _children,
  };
}

Future<Map<String, dynamic>> authService() async {
  //
  // globalLocator<SharedPreferences>().clear();
  //
  // ! put token in device
  globalLocator<SharedPreferences>().setString(
    TOKEN,
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWNyZXQiOiI4NDU2ZTU1ZS1lNGEzLTRmYzMtOTQ0OC03ZGQyODNkNTQzOTIiLCJpYXQiOjE2MjE4MzU3ODYsImV4cCI6MTYyMTg1Mzc4Nn0.Kg_cKRL1Up15rmn6dUJvva_OoJrUy9SZPVIMotglx08',
  );
  //

  String getToken = globalLocator<SharedPreferences>().getString(TOKEN) ?? "";
  // ignore: deprecated_member_use
  List<Widget> _children = List<Widget>();
  bool pagesCreatedFinished = false;
  bool isAuth = false;
//
  bool hasNet = await checkConnectionInternet();
  if (hasNet) {
    if (getToken != null) {
      print('user Have TOKEN : $getToken');
      if (!isAuth) {
        while (tryToGetAllUserInfo >= 0) {
          try {
            await getAllUserInfo();
            isAuth = true;
            print('^*^*^ getAllUserInfo : Successfully');
            Map<String, dynamic> initCreateRes = createBottomNavigationBarPages(
              isAuth: isAuth,
              // screenSize: screenSize,
            );
            print('created BottomNavigationBarPages');
            _children = initCreateRes['children'];
            pagesCreatedFinished = initCreateRes['success'];
            //
            checkCompleteProfileMsgDateTime();
            //
            return {
              'userIsAuth': isAuth,
              'pagesCreatedFinished': pagesCreatedFinished,
              'children': _children,
            };
          } catch (e) {
            print('^*^*^ getAllUserInfo : NOOOT Successfully');
            printErrorMessage(e);
            isAuth = false;
            tryToGetAllUserInfo--;
            print('try to getAllUser : remaind $tryToGetAllUserInfo time');
            //
          }
        }
        // ! server is down, try agian
        isAuth = false;
      }
    } else {
      print('user NOOOT Have TOKEN!!');
      isAuth = false;
    }
  } else {
    // ! no internet, turn on and try again
  }

  //

  Map<String, dynamic> initCreateRes = createBottomNavigationBarPages(
    isAuth: isAuth,
    // screenSize: screenSize,
  );
  print('created BottomNavigationBarPages');
  _children = initCreateRes['children'];
  pagesCreatedFinished = initCreateRes['success'];
  //

  return {
    'userIsAuth': isAuth,
    'pagesCreatedFinished': pagesCreatedFinished,
    'children': _children,
  };
  // }
}

checkCompleteProfileMsgDateTime() {
  // !
  //

  if (globalLocator<SharedPreferences>()
          .getString('completeProfileMsgDataTime') !=
      null) {
    completeProfileMsgDateTime = globalLocator<SharedPreferences>()
        .getString('completeProfileMsgDataTime');
    if (DateTime.now()
            .difference(DateTime.parse(completeProfileMsgDateTime))
            .inDays >
        7) {
      //     .inSeconds >
      // 15) {
      completeProfileMsgDateTime = DateTime.now().toString();
      globalLocator<SharedPreferences>()
          .setString('completeProfileMsgDataTime', completeProfileMsgDateTime);
      showCompeletProfileMessage = true;
    }
  } else {
    completeProfileMsgDateTime = DateTime.now().toString();
    globalLocator<SharedPreferences>()
        .setString('completeProfileMsgDataTime', completeProfileMsgDateTime);
    showCompeletProfileMessage = true;
  }
}
=======
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/ui/profile/screens/main_profile_page.dart';
import 'package:jeanswest/src/utils/helper/getInfos/get-all-info.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> createBottomNavigationBarPages({bool isAuth}) {
  // print('3 noAuth noAuthnoAuthnoAuth noAuth noAuth noAuth : $isAuth');
  // ignore: deprecated_member_use
  List<Widget> _children = List<Widget>();
  bool pagesCreatedFinished = false;
  if (isAuth)
    _children.add(MainProfilePage(
      isAuth: !isAuth,
      showCompeletProfileMessage: showCompeletProfileMessage,
      changeCompeletProfileMessage: (bool value) =>
          showCompeletProfileMessage = value,
    ));
  else {
    _children.add(Container(color: Colors.white));
  }
  _children.add(Container(color: Colors.white));
  _children.add(Container(color: Colors.blue));
  // _children.add(shoppingBasketPage);
  _children.add(Container(color: Colors.green));
  _children.add(MainProfilePage(
    isAuth: isAuth,
    // screenSize: screenSize,
    showCompeletProfileMessage: showCompeletProfileMessage,
    changeCompeletProfileMessage: (bool value) =>
        showCompeletProfileMessage = value,
  ));
  pagesCreatedFinished = true;
  return {
    'success': pagesCreatedFinished,
    'children': _children,
  };
}

Future<Map<String, dynamic>> authService() async {
  // // ! clear manual token
  // sharedPrefs.clear();
  // sharedPrefs.setString(TOKEN, "");
  //
  if (MANUAL_TOKEN_IS_ENABLE) {
    // ! put token in device
    if (sharedPrefs == null) {
      sharedPrefs = await SharedPreferences.getInstance();
    } else
      sharedPrefs.setString(
        TOKEN,
        MANUAL_TOKEN,
      );
  }
  //
  String getToken = "";
  if (sharedPrefs == null) {
    sharedPrefs = await SharedPreferences.getInstance();
  } else
    getToken = sharedPrefs.getString(TOKEN) ?? "";
  // ignore: deprecated_member_use
  List<Widget> _children = List<Widget>();
  bool pagesCreatedFinished = false;

//
  bool hasNet = await checkConnectionInternet();
  bool tokenIsExpired = false;
  bool isAuth = false;
  int tryToGetAllUser = tryToGetAllUserInfo;
  if (hasNet) {
    if (getToken != null) {
      print('user is Auth : $isAuth');
      print('user Have TOKEN : $getToken');
      print('tryToGetAllUser : $tryToGetAllUserInfo');
      // if (!isAuth) {
      while (tryToGetAllUser >= 0) {
        try {
          await getAllUserInfo(noAuth: () {
            tryToGetAllUserInfo = 0;
            tryToGetAllUser = 0;
            isAuth = false;
            tokenIsExpired = true;
          });
          if (!tokenIsExpired) {
            isAuth = true;
            print('^*^*^ getAllUserInfo : Successfully');
            Map<String, dynamic> initCreateRes = createBottomNavigationBarPages(
              isAuth: isAuth,
            );
            print('created BottomNavigationBarPages');
            _children = initCreateRes['children'];
            pagesCreatedFinished = initCreateRes['success'];
            //

            checkCompleteProfileMsgDateTime();
            //
            return {
              'userIsAuth': isAuth,
              'pagesCreatedFinished': pagesCreatedFinished,
              'children': _children,
            };
          }
          print('----tryToGetAllUserInfo : $tryToGetAllUserInfo');
        } catch (e) {
          print('^*^*^ getAllUserInfo : NOOOT Successfully');

          // printErrorMessage(e);
          isAuth = false;
          tryToGetAllUser--;
          print('try to getAllUser : remaind $tryToGetAllUser time');
          //
        }
      }
      // ! server is down, try agian
      isAuth = false;
      // }
    } else {
      print('user NOOOT Have TOKEN!!');
      isAuth = false;
    }
  } else {
    // ! no internet, turn on and try again
  }

  Map<String, dynamic> initCreateRes = createBottomNavigationBarPages(
    isAuth: isAuth,
  );
  print('created BottomNavigationBarPages');
  _children = initCreateRes['children'];
  pagesCreatedFinished = initCreateRes['success'];
  //

  return {
    'userIsAuth': isAuth,
    'pagesCreatedFinished': pagesCreatedFinished,
    'children': _children,
  };
  // }
}

checkCompleteProfileMsgDateTime() {
  // !
  //

  if (sharedPrefs.getString('completeProfileMsgDataTime') != null) {
    completeProfileMsgDateTime =
        sharedPrefs.getString('completeProfileMsgDataTime');
    if (DateTime.now()
            .difference(DateTime.parse(completeProfileMsgDateTime))
            .inDays >
        7) {
      //     .inSeconds >
      // 15) {
      completeProfileMsgDateTime = DateTime.now().toString();
      sharedPrefs.setString(
          'completeProfileMsgDataTime', completeProfileMsgDateTime);
      showCompeletProfileMessage = true;
    }
  } else {
    completeProfileMsgDateTime = DateTime.now().toString();
    sharedPrefs.setString(
        'completeProfileMsgDataTime', completeProfileMsgDateTime);
    showCompeletProfileMessage = true;
  }
}
>>>>>>> 44-bugfix-profile-05
