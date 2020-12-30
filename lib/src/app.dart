import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'ui/branch/screens/init_branch_page.dart';
import 'ui/global/screens/loading_page.dart';
import 'ui/global/widgets/app_bars/bottom_navigation_bar_widget.dart';
import 'ui/profile/screens/main_profile_page.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isSplash;
  String loading;
  bool isFirstLaunchBranch;
  AnimationController controller;
  int _selectedIndex = 4;
  GlobalKey scaffoldKey;

  /// => [showButtonNavigationBar] is for when Bottom Navigation Bar Should to Hide Like [LoginPage]
  bool showButtonNavigationBar;

  /// => [fToast] and [currentBackPressTime] are for Exit App by Back Button
  FToast fToast;
  DateTime currentBackPressTime;

  /// => [_children] is Pages of Bottom Navigation Bar
  final List<Widget> _children = [];

  @override
  void initState() {
    super.initState();
    isSplash = true;
    isFirstLaunchBranch = true;
    loading = 'Loading';
    scaffoldKey = new GlobalKey();
    fToast = new FToast();
    fToast.init(context);
    print('aaaa ${fToast.context}');
    showButtonNavigationBar = true;

    /// => add Pages of Bottom Navigation Bar to [_children]
    // // _children.add(homePage);
    // _children.add(loginPage);
    _children.add(Container(color: Colors.red));
    _children.add(Container(color: Colors.white));
    _children.add(Container(color: Colors.blue));
    // _children.add(shoppingBasketPage);
    _children.add(Container(color: Colors.green));
    _children.add(MainProfilePage());
  }

  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Branch Test',
      theme: ThemeData(
        fontFamily: 'IRANSans',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isSplash
          ? LoadingPage(
              text: 'بارگذاری',
              widthText: 80,
              milliSecond: 3000,
              closeLoading: () {
                setState(() {
                  isSplash = false;
                });
              },
            )
          : WillPopScope(
              onWillPop: () => _onWillPop(context),
              child: Scaffold(
                key: scaffoldKey,
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
