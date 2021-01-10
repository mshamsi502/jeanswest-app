// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  13:46 AM
// ****************************************************************************

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircularPercentIndicatorWidget extends StatefulWidget {
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;
  final bool currentLevelWidgetAnimation;

  const CustomCircularPercentIndicatorWidget(
      {Key key,
      this.userLevel,
      this.moneyBuying,
      this.nextLevel,
      this.currentLevelWidgetAnimation})
      : super(key: key);

  State<StatefulWidget> createState() =>
      _CustomCircularPercentIndicatorWidgetState();
}

class _CustomCircularPercentIndicatorWidgetState
    extends State<CustomCircularPercentIndicatorWidget> {
  bool isEndAnimation;
  int loadPercent;

  @override
  void initState() {
    loadPercent = 0;
    isEndAnimation = false;
    percentAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // color: Colors.greenAccent,
          padding: EdgeInsets.only(
              left: context.locale.toString() == 'en_US' ? 0 : 15,
              right: context.locale.toString() == 'en_US' ? 15 : 0,
              bottom: 15),
          height: 120,
          width: 100,
          color: Colors.white,
          child: CircularPercentIndicator(
            startAngle: 225,
            radius: 100.0,
            // reverse: true,
            lineWidth: 3.0,
            animation: widget.currentLevelWidgetAnimation,
            restartAnimation: widget.currentLevelWidgetAnimation,
            animationDuration: 2000,
            percent: widget.userLevel.title == 'Gold'
                ? 0.75
                : ((widget.moneyBuying -
                            double.parse(widget.userLevel.minPay)) /
                        (double.parse(widget.userLevel.maxPay) -
                            double.parse(widget.userLevel.minPay))) *
                    0.75,
            center: AnimatedSwitcher(
              duration: const Duration(milliseconds: 50),
              child: Text(
                '${isEndAnimation ? widget.userLevel.title == 'Gold' ? '100' : ((widget.moneyBuying - double.parse(widget.userLevel.minPay)) / (double.parse(widget.userLevel.maxPay) - double.parse(widget.userLevel.minPay)) * 100).toStringAsFixed(0) : loadPercent} %',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: MAIN_BLUE_COLOR,
                ),
              ),
            ),
            backgroundColor: Colors.grey,
            progressColor: Colors.blue,
          ),
        ),
        Positioned(
          bottom: 0,
          left: context.locale.toString() == 'en_US' ? 0 : 15,
          right: context.locale.toString() == 'en_US' ? 15 : 0,
          child: Container(
            width: 100,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  "profile_screen.to_next_level".tr(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      color: MAIN_BLUE_COLOR),
                ),
                Directionality(
                  textDirection: ltrTextDirection,
                  child: Text(
                    widget.userLevel.title == 'Gold'
                        ? '_____'
                        : '${widget.nextLevel.title}',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: widget.userLevel.title == 'Gold'
                            ? MAIN_BLUE_COLOR
                            : widget.nextLevel.title == 'Blue'
                                ? MAIN_BLUE_COLOR
                                : widget.nextLevel.title == 'Silver'
                                    ? Colors.grey
                                    : widget.nextLevel.title == 'Gold'
                                        ? Color(0xeeD6BC32)
                                        : Colors.lightBlue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Future<void> percentAnimation() async {
  //   animationDuration();
  //   do {
  //     setState(() {
  //       loadPercent = random(9, 100);
  //     });
  //     await Future.delayed(Duration(milliseconds: 50));
  //   } while (!isEndAnimation);
  // }
  Future<void> percentAnimation() async {
    loadPercent = 0;
    animationDuration();
    do {
      setState(() {
        loadPercent = loadPercent + 1;
      });
      await Future.delayed(Duration(
          milliseconds: (int.parse((2000 /
                  (((double.parse((widget.moneyBuying).toStringAsFixed(0)) -
                          double.parse(widget.userLevel.minPay)) /
                      (double.parse(widget.userLevel.maxPay) -
                          double.parse(widget.userLevel.minPay)) *
                      100)))
              .toStringAsFixed(0)))));
    } while (!isEndAnimation);
  }

  Future<void> animationDuration() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      isEndAnimation = true;
    });
  }

  int random(int min, int max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }
}
