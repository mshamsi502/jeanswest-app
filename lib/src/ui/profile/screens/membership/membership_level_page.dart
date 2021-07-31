// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/level-cards-data.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/user_level/current_level_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/user_level/level_cards_info_widget.dart';

class MembershipLevelPage extends StatefulWidget {
  final String userLevelName;
  final SingleLevelCard userLevel;
  // final LevelCard userLevel;
  final SingleLevelCard nextLevel;
  // final LevelCard nextLevel;
  final String imageType;
  final String assetsLevelCard;

  final int moneyBuying;

  const MembershipLevelPage(
      {Key key,
      this.userLevel,
      this.moneyBuying,
      this.nextLevel,
      this.userLevelName,
      this.imageType,
      this.assetsLevelCard})
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
    print("widget.assetsLevelCard : ${widget.assetsLevelCard}");
    print("widget.imageType : ${widget.imageType}");
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
                height: 0.38006 * _screenSize.height, //225,
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
                height: 0.38006 * _screenSize.height, //225,
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
                Container(
                  height: 0.0078 * _screenSize.height, //5,
                  color: F7_BACKGROUND_COLOR,
                ),
                CurrentLevelWidget(
                  userLevelName: widget.userLevelName,
                  userLevel: widget.userLevel,
                  imageType: widget.imageType,
                  moneyBuying: widget.moneyBuying,
                  assetsLevelCard: widget.assetsLevelCard,
                  nextLevel: widget.nextLevel,
                  currentLevelWidgetAnimation: currentLevelWidgetAnimation,
                ),
                SizedBox(
                  height: 0.023 * _screenSize.height, //15
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 0.054 * _screenSize.width, //20
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 0.011 * _screenSize.height, //7
                    horizontal: 0.041 * _screenSize.width, //15,
                  ),
                  decoration: BoxDecoration(
                    color: BLUE_SKY_FADE_COLOR,
                    borderRadius: BorderRadius.circular(
                      0.00555 * _screenSize.width, //2,
                    ),
                  ),
                  child: Text(
                    'در ادامه میتونی اطلاعات مربوط به هر سطح رو مطالعه کنی',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 0.038 * _screenSize.width, //14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.0156 * _screenSize.height, //10,
                ),
                LevelCardsInfoWidget(
                  userLevel: widget.userLevel,
                  moneyBuying: widget.moneyBuying,
                  cardsInfo: levelCardsData,
                ),
                SizedBox(
                  height: 0.34628 * _screenSize.height, //205,
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
