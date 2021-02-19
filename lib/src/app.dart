// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'ui/branch/screens/init_branch_page.dart';
import 'ui/global/screens/loading_page.dart';
import 'ui/global/widgets/app_bars/bottom_navigation_bar_widget.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/utils/helper/initCreate/init-create.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isSplash;
  bool pagesCreatedFinished = false;
  String loading;
  bool isFirstLaunchBranch;
  AnimationController controller;
  int _selectedIndex = 4;

  /// => [showButtonNavigationBar] is for when Bottom Navigation Bar Should to Hide Like [LoginPage]
  bool showButtonNavigationBar;

  /// => [fToast] and [currentBackPressTime] are for Exit App by Back Button
  FToast fToast;
  DateTime currentBackPressTime;

  /// => [_children] is Pages of Bottom Navigation Bar
  List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    isSplash = true;
    _children = new List<Widget>();
    fToast = new FToast();
    fToast.init(context);
    showButtonNavigationBar = true;
    isFirstLaunchBranch = true;
    loading = 'Loading';
    // ! check user auth and Create Pages
    auth();
  }

  auth() async {
    Map<String, dynamic> authServiceRes = await authService();
    setState(() {
      userIsAuth = authServiceRes['userIsAuth'];
      pagesCreatedFinished = authServiceRes['pagesCreatedFinished'];
      // ! => add Pages of Bottom Navigation Bar to [_children]
      _children = authServiceRes['children'];
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Jeanswest',
      theme: ThemeData(
        fontFamily: 'IRANSans',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isSplash
          ? LoadingPage(
              text: 'بارگذاری',
              widthText: 0.22, //0.22 * _screenSize.width , 80,
              milliSecond: 3000,
              allowFinish: pagesCreatedFinished,
              closeLoading: () {
                setState(() {
                  isSplash = false;
                });
              },
            )
          : WillPopScope(
              onWillPop: () => _onWillPop(context),
              child: Scaffold(
                body: Container(
                  color: Colors.grey,
                  child: SafeArea(
                    child: Container(
                      color: Colors.white,
                      child: IndexedStack(
                        index: _selectedIndex,
                        children: [
                          _children[0],
                          _children[1],
                          _children[2],
                          _children[3],
                          _children[4],
                        ],
                      ),
                      // ),
                    ),
                  ),
                ),
                bottomNavigationBar: showButtonNavigationBar
                    ? BottomNavigationBarWidget(
                        selectedIndex: _selectedIndex,
                        updateProp: updateProp,
                      )
                    : SizedBox(),
              ),
            ),
    );
  }

  /// => when user change NavigationBar and TapOn Wich One of [_children],
  /// [updateProp] change [_selectedIndex] for show that Page
  updateProp(int selectedIndex) {
    setState(() {
      if (isFirstLaunchBranch) {
        _children[1] = InitBranchPage();
        isFirstLaunchBranch = false;
      }
      _selectedIndex = selectedIndex;
    });
  }

  /// => [changeShowButtonNavigationBar] change [showButtonNavigationBar] for when Bottom Navigation Bar Should to be Hide Like [LoginPage]
  changeShowButtonNavigationBar(bool isShow) {
    setState(() {
      showButtonNavigationBar = isShow;
    });
  }

  /// => [_onWillPop] is show a Toast when TapOn Back Button Once,
  /// and Exit from App when TapOn Back Button Twice
  Future<bool> _onWillPop(BuildContext context) {
    if (!showButtonNavigationBar) {
      return Future.value(true);
    } else {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 1)) {
        // showToast("برای خروج دوبار دکمه بازگشت را بزنید.", fToast);
        Fluttertoast.showToast(
            msg: "برای خروج دوبار دکمه بازگشت را بزنید.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Color(0xAA000000),
            textColor: Colors.white,
            fontSize: 14.0);

        return Future.value(false);
      }
      exit(0);
      // return Future.value(true);
    }
  }
}
