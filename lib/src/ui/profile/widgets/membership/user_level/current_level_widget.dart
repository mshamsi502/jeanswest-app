// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ! ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/ui/global/widgets/main_detail_widget.dart';
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
      padding: EdgeInsets.symmetric(vertical: 0.015 * _screenSize.height //10
          ),
      height: 0.4 * _screenSize.height, //250,
      width: _screenSize.width,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 0.0416 * _screenSize.width //15
                    ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${"profile_screen.your_current_level".tr()} ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 0.0361 * _screenSize.width, //13,
                      color: MAIN_BLUE_COLOR),
                ),
                Directionality(
                  textDirection: ltrTextDirection,
                  child: Text(
                    widget.userLevel.title == zeroLevel.title
                        ? '_____'
                        : '${widget.userLevel.title}',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 0.0361 * _screenSize.width, //13,
                        color: widget.userLevel.title == zeroLevel.title
                            ? Colors.grey
                            : widget.userLevel.title == 'Blue'
                                ? MAIN_BLUE_COLOR
                                : widget.userLevel.title == 'Silver'
                                    ? Colors.grey
                                    : widget.userLevel.title == 'Gold'
                                        ? Color(0xeeD6BC32)
                                        : Colors.lightBlue),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.2 * _screenSize.height, //130,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 8, child: Container()),
                    Divider(
                      color: MAIN_BLUE_COLOR,
                      thickness: 0.00277 * _screenSize.width, //1,
                      height: 0.00555 * _screenSize.width, //2,
                    ),
                    Expanded(flex: 10, child: Container()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 0.0078125 * _screenSize.height, //5,
                        ),
                        widget.userLevel.title == zeroLevel.title
                            ? Container(
                                width: 0.455 * _screenSize.width, //164,
                                height: 0.172 * _screenSize.height, //110,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.grey[200],
                                ),
                                child: Text(
                                  'NO MEMBERSHIP',
                                  style: TextStyle(
                                    color: MAIN_BLUE_COLOR,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            : Container(
                                width: 0.455 * _screenSize.width, //164,
                                height: 0.172 * _screenSize.height, //110,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new AssetImage(assetsLevelCard
                                        .elementAt(userLevelIndex)),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 0.0156 * _screenSize.height, //10,
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 10,
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
                      flex: 5,
                      child: Container(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          MainDetailWidget(
            count: 3,
            titles: [
              'سقف خرید',
              'مجموع خرید',
              'باقی مانده خرید',
            ],
            titleStyle: TextStyle(
              fontSize: 0.0277 * _screenSize.width, //10,
              color: Colors.grey[500],
            ),
            values: [
              toPriceStyle(int.parse(widget.userLevel.maxPay)),
              toPriceStyle(widget.moneyBuying),
              toPriceStyle(
                  (int.parse(widget.userLevel.maxPay) - widget.moneyBuying)),
            ],
            valueStyle: TextStyle(
              fontSize: 0.0388 * _screenSize.width, //14,
              color: MAIN_BLUE_COLOR,
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
