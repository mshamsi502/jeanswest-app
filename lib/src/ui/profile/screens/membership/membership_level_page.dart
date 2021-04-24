// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/user_level/current_level_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/user_level/level_cards_info_widget.dart';

class MembershipLevelPage extends StatefulWidget {
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;

  const MembershipLevelPage(
      {Key key, this.userLevel, this.moneyBuying, this.nextLevel})
      : super(key: key);

  @override
  _MembershipLevelPageState createState() => _MembershipLevelPageState();
}

class _MembershipLevelPageState extends State<MembershipLevelPage> {
  bool currentLevelWidgetAnimation = true;
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: _screenSize.width,
      height: _screenSize.height,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: _screenSize.width,
                height: 225,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: new AssetImage(
                      'assets/images/png_images/profile/celebrity_level_card.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: _screenSize.width,
                height: 225,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xccffffff),
                      Color(0x88ffffff),
                      Color(0x33ffffff),
                      Color(0x11ffffff),
                      Color(0x00ffffff),
                      Color(0x00ffffff),
                      Color(0x00ffffff),
                      Color(0x00ffffff),
                      Color(0x00ffffff),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 0.0078 * _screenSize.height, //5,
                ),
                CurrentLevelWidget(
                  userLevel: widget.userLevel,
                  moneyBuying: widget.moneyBuying,
                  nextLevel: widget.nextLevel,
                  currentLevelWidgetAnimation: currentLevelWidgetAnimation,
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  decoration: BoxDecoration(
                    color: BLUE_SKY_FADE_COLOR,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    'در ادامه میتونی اطلاعات مربوط به هر سطح رو مطالعه کنی',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 0.0156 * _screenSize.height, //10,
                ),
                LevelCardsInfoWidget(
                  userLevel: widget.userLevel,
                  moneyBuying: widget.moneyBuying,
                ),
                SizedBox(
                  height: 205,
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
