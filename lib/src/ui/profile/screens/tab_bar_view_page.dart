// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ! ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

class TabBarViewPage extends StatefulWidget {
  final String title;
  final List<String> tabTitles;
  final List<Widget> tabWidgets;
  final int selectedTab;
  final String bottomButton;
  final Function bottomButtonFunction;

  const TabBarViewPage({
    Key key,
    @required this.selectedTab,
    @required this.title,
    @required this.tabTitles,
    @required this.tabWidgets,
    this.bottomButton,
    this.bottomButtonFunction,
  }) : super(key: key);
  @override
  _TabBarViewPageState createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage>
    with SingleTickerProviderStateMixin {
  int selectedTab;
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(
        initialIndex: widget.selectedTab,
        length: widget.tabWidgets.length,
        vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTab = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: _screenSize.width,
            height: _screenSize.height,
            color: Colors.white,
            child: Column(
              children: [
                AppBarWithBackWidget(title: widget.title),
                Container(
                  height: 0.0625 * _screenSize.height, //40,
                  child: TabBar(
                    controller: tabController,
                    labelColor: MAIN_BLUE_COLOR,
                    indicatorColor: MAIN_BLUE_COLOR,
                    labelStyle: TextStyle(
                        fontSize: 0.034 * _screenSize.width, //12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'IRANSans'),
                    indicatorWeight: 0.0023 * _screenSize.height, //1.5,
                    tabs: List<Widget>.generate(
                      widget.tabTitles.length,
                      (int index) {
                        return Tab(text: widget.tabTitles[index]);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: List<Widget>.generate(
                      widget.tabWidgets.length,
                      (int index) {
                        return widget.tabWidgets[index];
                      },
                    ),
                  ),
                ),
                widget.bottomButton == null
                    ? SizedBox()
                    : Container(
                        width: _screenSize.width,
                        height: 0.09375 * _screenSize.height, //60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Colors.red,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey[200],
                              blurRadius: 0.0083 * _screenSize.width, //3,
                              spreadRadius: 0.00555 * _screenSize.width, //2,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(child: SizedBox()),
                            AvakatanButtonWidget(
                              backgroundColor: MAIN_BLUE_COLOR,
                              textColor: Colors.white,
                              title: widget.bottomButton,
                              height: 0.0625 * _screenSize.height, //40,
                              width: _screenSize.width * 0.8,
                              radius: 0.0138 * _screenSize.width, //5,
                              fontSize: 0.041 * _screenSize.width, //15,
                              borderColor: MAIN_BLUE_COLOR,
                              onTap: () => widget.bottomButtonFunction(),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
