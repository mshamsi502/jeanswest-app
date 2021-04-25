// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ! ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
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
              horizontal: 0.054 * _screenSize.width, //20
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.023 * _screenSize.height, //15
                  ),
                  child: Container(
                    height: 0.0625 * _screenSize.height, //40
                    width: 0.555555 * _screenSize.width, //200,
                    padding: EdgeInsets.symmetric(
                      vertical: 0.011824 * _screenSize.height, //7,
                      horizontal: 0.041 * _screenSize.width, //15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        0.0138 * _screenSize.width, //5,
                      ),
                      color: MAIN_ORANGE_COLOR,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'سطح فعلی شما: ',
                          style: TextStyle(
                            fontSize: 0.0444 * _screenSize.width, //16,
                          ),
                        ),
                        Text(
                          widget.userLevel == zeroLevel
                              ? ' __ '
                              : widget.userLevel.title,
                          textDirection: ltrTextDirection,
                          style: TextStyle(
                            fontSize: 0.0444 * _screenSize.width, //16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  height: 0.23 * _screenSize.height, //136,
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
                        width: 0.430555 * _screenSize.width, //155,
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
                          SizedBox(
                            height: 0.023 * _screenSize.height, //15
                          ),
                          Text(
                            'میتونی با خرید بالای 200 هزار تومان به باشگاه مشتریان جین وست بپیوندی',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 0.038 * _screenSize.width, //14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  height: 0.023 * _screenSize.height, //15
                ),
                Divider(
                  height: 0.001689 * _screenSize.height, //1,
                  thickness: 0.001689 * _screenSize.height, //1,
                ),
                SizedBox(
                  height: 0.039 * _screenSize.height, //25,
                ),
                Text(
                  'مجموع خرید شما تا به الان:',
                  style: TextStyle(
                    fontSize: 0.0444 * _screenSize.width, //16,
                  ),
                ),
                SizedBox(height: 0.0078 * _screenSize.height //5,
                    ),
                Container(
                  width: 0.3055 * _screenSize.width, //110,
                  height: 0.0625 * _screenSize.height, //40
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 0.010135 * _screenSize.height, //6
                    horizontal: 0.054 * _screenSize.width, //20
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      0.138 * _screenSize.width, //50,
                    ),
                    color: MAIN_BLUE_COLOR,
                  ),
                  child: Text(
                    toPriceStyle(widget.moneyBuying),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 0.0444 * _screenSize.width, //16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.039 * _screenSize.height, //25,
                ),
                Text(
                  'انقد دیگه خرید کنی به مرحله بعد میرسی',
                  style: TextStyle(
                    fontSize: 0.0444 * _screenSize.width, //16,
                  ),
                ),
                SizedBox(height: 0.0078 * _screenSize.height //5,
                    ),
                Container(
                  width: 0.3055 * _screenSize.width, //110,
                  height: 0.0625 * _screenSize.height, //40
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 0.010135 * _screenSize.height, //6
                    horizontal: 0.054 * _screenSize.width, //20
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      0.138 * _screenSize.width, //50,
                    ),
                    color: BLUE_SKY_FADE_COLOR,
                  ),
                  child: Text(
                    toPriceStyle((int.parse(widget.nextLevel.minPay) -
                        widget.moneyBuying)),
                    style: TextStyle(
                      fontSize: 0.0444 * _screenSize.width, //16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.039 * _screenSize.height, //25,
                ),
                Text(
                  'برای رفتن به مرحله بعدی عضویت مجموع خریدات این مبلغ باید باشه',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 0.0444 * _screenSize.width, //16,
                  ),
                ),
                SizedBox(height: 0.0078 * _screenSize.height //5,
                    ),
                Container(
                  width: 0.3055 * _screenSize.width, //110,
                  height: 0.0625 * _screenSize.height, //40
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 0.010135 * _screenSize.height, //6
                    horizontal: 0.054 * _screenSize.width, //20
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      0.138 * _screenSize.width, //50,
                    ),
                    color: MAIN_GOLD_COLOR,
                  ),
                  child: Text(
                    toPriceStyle((int.parse(widget.nextLevel.minPay))),
                    style: TextStyle(
                      fontSize: 0.0444 * _screenSize.width, //16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: _screenSize.width,
            height: 0.3125 * _screenSize.height, //200
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
