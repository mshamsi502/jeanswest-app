// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-01  ,  13:46 AM
// ! ****************************************************************************

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
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
    var _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 0.0078 * _screenSize.height //5,
            ),
        CircularPercentIndicator(
          startAngle: 180,
          radius: 0.22 * _screenSize.width, //80,
          lineWidth: 0.00416 * _screenSize.width, //1.5,
          animation: widget.currentLevelWidgetAnimation,
          restartAnimation: widget.currentLevelWidgetAnimation,
          animationDuration: 2000,
          percent: widget.userLevel.title == 'Gold'
              // ? 0.75
              ? 1
              : (widget.moneyBuying - double.parse(widget.userLevel.minPay)) /
                  (double.parse(widget.userLevel.maxPay) -
                      double.parse(widget.userLevel.minPay)),
          center: AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: Padding(
              padding: EdgeInsets.only(top: 0.0078 * _screenSize.height //5,
                  ),
              child: Text(
                '${isEndAnimation ? widget.userLevel.title == 'Gold' ? '100' : ((widget.moneyBuying - double.parse(widget.userLevel.minPay)) / (double.parse(widget.userLevel.maxPay) - double.parse(widget.userLevel.minPay)) * 100).toStringAsFixed(0) : loadPercent} %',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 0.05 * _screenSize.width, //18,
                  color: MAIN_BLUE_COLOR,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.grey,
          progressColor: Colors.blue,
        ),
        Container(
          width: 0.277 * _screenSize.width, //100,
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "profile_screen.to_next_level".tr(),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 0.0333 * _screenSize.width, //12,
                ),
              ),
              Directionality(
                textDirection: ltrTextDirection,
                child: Text(
                  widget.userLevel.title == 'Gold'
                      ? '_____'
                      : '${widget.nextLevel.title}',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 0.0333 * _screenSize.width, //12,
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ],
    );
  }

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
