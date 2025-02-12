import 'package:flutter/material.dart';
import 'package:jeanswest/src/ui/profile/screens/main_profile_page.dart';
import 'package:jeanswest/src/utils/helper/getAllInfo/get-all-info.dart';

import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:jeanswest/src/utils/helper/global/helper.dart';

Map<String, dynamic> createBottomNavigationBarPages({bool isAuth}) {
  // ignore: deprecated_member_use
  List<Widget> _children = List<Widget>();
  bool pagesCreatedFinished = false;
  _children.add(MainProfilePage(
    isAuth: !isAuth,
    showCompeletProfileMessage: showCompeletProfileMessage,
    changeCompeletProfileMessage: (bool value) =>
        showCompeletProfileMessage = value,
  ));
  _children.add(Container(color: Colors.white));
  _children.add(Container(color: Colors.blue));
  // _children.add(shoppingBasketPage);
  _children.add(Container(color: Colors.green));
  _children.add(MainProfilePage(
    isAuth: isAuth,
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
  // String getToken =
  //     mockoonGlobalLocator<SharedPreferences>().getString(TOKEN);
  //
  // globalLocator<SharedPreferences>().clear();

  // //
  // // ! put token in device
  globalLocator<SharedPreferences>().setString(
      TOKEN, 'testToken.001.64sdcs6510d1f5s1d5s6dfsd654dc56fd1s65f4ds');
  // //

  String getToken = globalLocator<SharedPreferences>().getString(TOKEN);
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
            await getAllUserInfo(token: getToken);

            isAuth = true;

            print('^*^*^ getAllUserInfo : Successfully');
            Map<String, dynamic> initCreateRes =
                createBottomNavigationBarPages(isAuth: isAuth);
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

  Map<String, dynamic> initCreateRes =
      createBottomNavigationBarPages(isAuth: isAuth);
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
