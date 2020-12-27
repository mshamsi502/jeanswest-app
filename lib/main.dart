import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jeanswest/src/utils/service_locator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'src/constants/global/svg_images/global_svg_images.dart';
import 'src/ui/branch/screens/init_branch_page.dart';
import 'src/ui/global/screens/loading_page.dart';
import 'src/ui/global/widgets/bottom_navigation_bar/bottom_navigation_bar_widget.dart';
import 'src/ui/profile/screens/main_profile_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    EasyLocalization(
      /// => select default application language
      startLocale: Locale('fa', 'IR'),
      // startLocale: Locale('en', 'US'),
      //
      supportedLocales: [
        Locale('en', 'US'),
        Locale('fa', 'IR'),
        Locale('ar', 'AE')
      ],
      path: 'assets/translations', // <-- change patch to your
      fallbackLocale: Locale('fa', 'IR'),
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isSplash;
  String loading;
  bool isFirstLaunchBranch;
  //
  PanelController _pc = new PanelController();
  AnimationController controller;
  Animation<double> animation;
  int _selectedIndex = 4;
  int _catchSelectedIndex = 4;
  Animation<double> rotateAnimationOtherMenuTopIcon;

  /// => [showButtonNavigationBar] is for when Bottom Navigation Bar Should to Hide Like [LoginPage]
  bool showButtonNavigationBar;
  //

  /// => [fToast] and [currentBackPressTime] are for Exit App by Back Button
  FToast fToast;
  DateTime currentBackPressTime;
  //
  /// => [_children] is Pages of Bottom Navigation Bar
  final List<Widget> _children = [];
  //
  /// => [_controls] is [AnimationController] for More in NavigationBar
  FlareControls _controls;
  //
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    //
    isSplash = true;
    isFirstLaunchBranch = true;
    loading = 'Loading';
    //
    _controls = FlareControls();
    fToast = new FToast();
    fToast.init(context);
    showButtonNavigationBar = true;
    // final InitBranchPage initBranchPage = InitBranchPage(
    //     changeShowButtonNavigationBar: changeShowButtonNavigationBar);
    // final HomePage homePage = HomePage();
    // final LoginPage loginPage = LoginPage(updateProp: updateProp);
    // final ShoppingBasketPage shoppingBasketPage = ShoppingBasketPage();
    // final ProfilePage profilePage = ProfilePage();

    //
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print("completed = " + status.toString());
        } else if (status == AnimationStatus.dismissed) {
          print("dismissed = " + status.toString());
        } else if (status == AnimationStatus.forward) {
          if (_pc.isPanelClosed) _pc.open();
          _controls.play("Untitled");
        } else if (status == AnimationStatus.reverse) {
          if (_pc.isPanelOpen) _pc.close();
          _controls.play("Untitled");
        }
      });

    rotateAnimationOtherMenuTopIcon =
        Tween<double>(begin: 0, end: pi).animate(animation);
    //

    /// => add Pages of Bottom Navigation Bar to [_children]

    // // _children.add(homePage);
    // _children.add(loginPage);
    _children.add(Container(color: Colors.red));
    _children.add(Container(color: Colors.white));
    // _children.add(InitBranchPage());
    // _children.add(Container(color: Colors.blue));
    _children.add(Container());
    // _children.add(shoppingBasketPage);
    _children.add(Container(color: Colors.green));
    _children.add(MainProfilePage());
    // _children.add(Container(color: Colors.amberAccent));
  }

  //
  @override
  Widget build(BuildContext context) {
    // var _screenSize = MediaQuery.of(context).size;
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
              onWillPop: _onWillPop,
              child: Scaffold(
                body: Container(
                  color: Colors.grey,
                  child: SafeArea(
                    child: Container(
                      color: Colors.white,
                      child: SlidingUpPanel(
                        controller: _pc,
                        minHeight: 0,
                        maxHeight: 250,
                        backdropEnabled: true,
                        onPanelClosed: _onPanelClosed,
                        // onPanelClosed: _onSwip(false),
                        onPanelOpened: _onPanelOpened,
                        // onPanelOpened: _onSwip(true),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                        panel: CustomScrollView(
                          primary: false,
                          slivers: <Widget>[
                            SliverToBoxAdapter(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 3.0, 5.0, 5.0),
                                alignment: Alignment.center,
                                child: new AnimatedBuilder(
                                  animation: animation,
                                  child: GestureDetector(
                                    child: GlobalSvgImages.svgArrowTop,
                                    onTap: () => _onPanelClosed(),
                                    // onTap: () => _onSwip(false),
                                  ),
                                  builder:
                                      (BuildContext context, Widget _widget) {
                                    return new Transform.rotate(
                                      angle:
                                          rotateAnimationOtherMenuTopIcon.value,
                                      child: _widget,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SliverPadding(
                              padding: const EdgeInsets.all(20),
                              sliver: SliverGrid.count(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 5,
                                crossAxisCount: 4,
                                childAspectRatio: 70 / 90,
                                children: <Widget>[...getRandomWidgetArray()],
                              ),
                            ),
                          ],
                        ),
                        body: IndexedStack(
                          index: _selectedIndex == 2
                              ? _catchSelectedIndex
                              : _selectedIndex,
                          children: [
                            _children[0],
                            _children[1],
                            _children[_catchSelectedIndex],
                            _children[3],
                            _children[4],
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: showButtonNavigationBar
                    ? BottomNavigationBarWidget(
                        selectedIndex: _selectedIndex,
                        catchSelectedIndex: _catchSelectedIndex,
                        controller: controller,
                        animation: animation,
                        updateProp: updateProp,
                      )
                    : SizedBox(),
              ),
            ),
    );
  }

  /// => when user change NavigationBar and TapOn Wich One of [_children],
  /// [updateProp] change [_selectedIndex] for show that Page
  /// [catchSelectedIndex] is for save Previous index, using in when user TapOn More
  updateProp(int selectedIndex, int catchSelectedIndex) {
    setState(() {
      if (isFirstLaunchBranch) {
        _children[1] = InitBranchPage();
        isFirstLaunchBranch = false;
      }
      _selectedIndex = selectedIndex;
      _catchSelectedIndex = catchSelectedIndex;
      //
      // selectedIndex == 0
      //     ? showButtonNavigationBar = false
      //     : showButtonNavigationBar = true;
    });
  }

  /// => [changeShowButtonNavigationBar] change [showButtonNavigationBar] for when Bottom Navigation Bar Should to be Hide Like [LoginPage]
  changeShowButtonNavigationBar(bool isShow) {
    setState(() {
      showButtonNavigationBar = isShow;
    });
  }

  _onPanelOpened() {
    print("_onPanelOpened");
    _onSwip(true);
  }

  _onPanelClosed() {
    print("_onPanelClosed");
    _onSwip(false);
  }

  /// => [_onSwip] for Open and Close More options Animation
  _onSwip(bool open) {
    setState(() {
      if (open) {
        controller.forward();
        _selectedIndex = 2;
        // _pc.open();
      } else {
        controller.reverse();
        _selectedIndex = _catchSelectedIndex;
        // _pc.close();

      }
    });
  }

  /// => [_onWillPop] is show a Toast when TapOn Back Button Once,
  /// and Exit from App when TapOn Back Button Twice
  Future<bool> _onWillPop() async {
    if (_pc.isPanelOpen) {
      _onSwip(false);
      return Future.value(false);
    } else if (!showButtonNavigationBar) {
      return Future.value(true);
    } else {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 1)) {
        currentBackPressTime = now;
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
