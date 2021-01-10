// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
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
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 250,
      width: _screenSize.width,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${"profile_screen.your_current_level".tr()} ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: MAIN_BLUE_COLOR),
                      ),
                      Directionality(
                        textDirection: ltrTextDirection,
                        child: Text(
                          '${widget.userLevel.title}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: widget.userLevel.title == 'Blue'
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
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "profile_screen.payment_ceiling_level".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: MAIN_BLUE_COLOR),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "profile_screen.user_payment".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: MAIN_BLUE_COLOR),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              "profile_screen.remainder_payment".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10,
                                  color: MAIN_BLUE_COLOR),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.userLevel.title == 'Gold'
                                      ? '_____'
                                      : '${toPriceStyle(int.parse(widget.userLevel.maxPay))}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: MAIN_BLUE_COLOR),
                                ),
                                Text(
                                  ' ${"profile_screen.toman".tr()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 8,
                                      color: MAIN_BLUE_COLOR),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${toPriceStyle(widget.moneyBuying)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: MAIN_BLUE_COLOR),
                                ),
                                Text(
                                  ' ${"profile_screen.toman".tr()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 8,
                                      color: MAIN_BLUE_COLOR),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  widget.userLevel.title == 'Gold'
                                      ? '_____'
                                      : '${toPriceStyle(int.parse(widget.userLevel.maxPay) - (widget.moneyBuying))}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                      color: MAIN_BLUE_COLOR),
                                ),
                                Text(
                                  ' ${"profile_screen.toman".tr()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 8,
                                      color: MAIN_BLUE_COLOR),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  CustomCircularPercentIndicatorWidget(
                    userLevel: widget.userLevel,
                    moneyBuying: widget.moneyBuying,
                    nextLevel: widget.nextLevel,
                    currentLevelWidgetAnimation:
                        widget.currentLevelWidgetAnimation,
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          Expanded(child: Container()),
          MainDetailWidget(
            count: 3,
            titles: [
              'سقف خرید',
              'مجموع خرید',
              'باقی مانده خرید',
            ],
            values: [
              toPriceStyle(int.parse(widget.userLevel.maxPay)),
              toPriceStyle(widget.moneyBuying),
              toPriceStyle(
                  (int.parse(widget.userLevel.maxPay) - widget.moneyBuying)),
            ],
          ),
        ],
      ),
    );
  }
}
