// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ! ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

import 'custom_circular_percent_indicator_widget.dart';

class CurrentLevelWidget extends StatefulWidget {
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;
  final bool currentLevelWidgetAnimation;

  const CurrentLevelWidget(
      {Key key,
      this.userLevel,
      this.moneyBuying,
      this.nextLevel,
      this.currentLevelWidgetAnimation})
      : super(key: key);

  State<StatefulWidget> createState() => _CurrentLevelWidgetState();
}

class _CurrentLevelWidgetState extends State<CurrentLevelWidget> {
  int userLevelIndex;

  @override
  void initState() {
    userLevelIndex = widget.userLevel.title == 'Gold'
        ? 2
        : widget.userLevel.title == 'Silver'
            ? 1
            : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: 0.015 * _screenSize.height, //10
              horizontal: 20,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MAIN_ORANGE_COLOR,
                    ),
                    child: Text(
                        'سطح فعلی شما: ${widget.userLevel == zeroLevel ? ' __ ' : widget.userLevel.title}'),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  height: 125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      CustomCircularPercentIndicatorWidget(
                        userLevel: widget.userLevel,
                        moneyBuying: widget.moneyBuying,
                        nextLevel: widget.nextLevel,
                        currentLevelWidgetAnimation:
                            widget.currentLevelWidgetAnimation,
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(),
                      ),
                      Container(
                        width: 155,
                        // height: 0.172 * _screenSize.height, //110,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: new AssetImage(widget.userLevel == zeroLevel
                                ? 'assets/images/png_images/profile/unlevel_card.png'
                                : assetsLevelCard.elementAt(userLevelIndex)),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   flex: 5,
                      //   child: Container(),
                      // ),
                    ],
                  ),
                ),
                widget.userLevel == zeroLevel
                    ? Column(
                        children: [
                          SizedBox(height: 15),
                          Text(
                            'میتونی با خرید بالای 200 هزار تومان به باشگاه مشتریان جین وست بپیوندی',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(height: 15),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                SizedBox(height: 25),
                Text(
                  'مجموع خرید شما تا به الان:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Container(
                  width: 110,
                  height: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MAIN_BLUE_COLOR,
                  ),
                  child: Text(
                    toPriceStyle(widget.moneyBuying),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'انقد دیگه خرید کنی به مرحله بعد میرسی',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Container(
                  width: 110,
                  height: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: BLUE_SKY_FADE_COLOR,
                  ),
                  child: Text(
                    toPriceStyle((int.parse(widget.nextLevel.minPay) -
                        widget.moneyBuying)),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  'برای رفتن به مرحله بعدی عضویت مجموع خریدات این مبلغ باید باشه',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Container(
                  width: 110,
                  height: 40,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MAIN_GOLD_COLOR,
                  ),
                  child: Text(
                    toPriceStyle((int.parse(widget.nextLevel.minPay))),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: _screenSize.width,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: Colors.red,
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: new AssetImage(
                  'assets/images/png_images/profile/happy_level_card.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
