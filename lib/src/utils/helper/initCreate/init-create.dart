import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/ui/profile/screens/main_profile_page.dart';
import 'package:jeanswest/src/ui/store/screens/main_store_page.dart';
import 'package:jeanswest/src/utils/helper/getInfos/get-all-info.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map<String, dynamic> createBottomNavigationBarPages({
  bool isAuth,
  Function(bool) changeShowButtonNavigationBar,
}) {
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
  // _children.add(Container(color: Colors.blue));
  _children.add(MainStorePage(
    changeShowButtonNavigationBar: changeShowButtonNavigationBar,
  ));
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

Future<Map<String, dynamic>> authService({
  Function(bool) changeShowButtonNavigationBar,
}) async {
  if (sharedPrefs == null) sharedPrefs = await SharedPreferences.getInstance();
  // ! clear manual token
  // sharedPrefs.clear();
  // sharedPrefs.setString(TOKEN, "");
  //
  if (MANUAL_TOKEN_IS_ENABLE) {
    // ! put token in device
    sharedPrefs.setString(
      TOKEN,
      MANUAL_TOKEN,
    );
  }
  //
  String getToken = "";
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
            tryToGetAllUserInfo = -1;
            tryToGetAllUser = -1;
            isAuth = false;
            tokenIsExpired = true;
          });
          if (!tokenIsExpired) {
            isAuth = true;
            print('^*^*^ getAllUserInfo : Successfully');
            Map<String, dynamic> initCreateRes = createBottomNavigationBarPages(
              isAuth: isAuth,
              changeShowButtonNavigationBar: changeShowButtonNavigationBar,
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
    changeShowButtonNavigationBar: changeShowButtonNavigationBar,
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
