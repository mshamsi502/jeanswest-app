// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/membership_level_page.dart';

class MembershipPage extends StatefulWidget {
  final String title;
  final int selectedTab;
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;

  const MembershipPage({
    Key key,
    this.selectedTab,
    this.title,
    this.userLevel,
    this.nextLevel,
    this.moneyBuying,
  }) : super(key: key);
  @override
  _MembershipPageState createState() => _MembershipPageState();
}

class _MembershipPageState extends State<MembershipPage>
    with SingleTickerProviderStateMixin {
  int selectedTab;
  TabController tabController;

  @override
  void initState() {
    tabController = new TabController(
        initialIndex: widget.selectedTab, length: 2, vsync: this);
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
                    tabs: <Widget>[
                      Tab(text: 'سطح عضویت من'),
                      Tab(text: 'جین پوینت ها و بن ها'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: <Widget>[
                      MembershipLevelPage(
                        userLevel: widget.userLevel,
                        nextLevel: widget.nextLevel,
                        moneyBuying: widget.moneyBuying,
                      ),
                      Container(),
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
