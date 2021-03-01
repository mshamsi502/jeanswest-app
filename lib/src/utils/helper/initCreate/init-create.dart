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
  _children.add(MainProfilePage(isAuth: !isAuth));
  _children.add(Container(color: Colors.white));
  _children.add(Container(color: Colors.blue));
  // _children.add(shoppingBasketPage);
  _children.add(Container(color: Colors.green));
  _children.add(MainProfilePage(isAuth: isAuth));
  pagesCreatedFinished = true;
  return {
    'success': pagesCreatedFinished,
    'children': _children,
  };
}

Future<Map<String, dynamic>> authService() async {
  // String getToken =
  //     mockoonGlobalLocator<SharedPreferences>().getString(TOKEN);
  // globalLocator<SharedPreferences>().clear();

  String getToken = globalLocator<SharedPreferences>().getString(TOKEN);
  // ignore: deprecated_member_use
  List<Widget> _children = List<Widget>();
  bool pagesCreatedFinished = false;
  bool isAuth = false;
//
  if (getToken != null) {
    print('user Have TOKEN : $getToken');
    try {
      await getAllUserInfo(token: getToken);
      isAuth = true;
      print('^*^*^ getAllUserInfo : Successfully');
    } catch (e) {
      print('^*^*^ getAllUserInfo : NOOOT Successfully');
      printErrorMessage(e);
      isAuth = false;
      tryToGetAllUserInfo--;
      print('try to getAllUser : remaind $tryToGetAllUserInfo time');
      if (tryToGetAllUserInfo >= 0) await authService();
    }
  } else {
    print('user NOOOT Have TOKEN!!');
    isAuth = false;
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
}
