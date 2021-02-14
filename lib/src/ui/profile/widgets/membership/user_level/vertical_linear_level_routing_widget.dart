// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  13:46 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VerticalLinearLevelRoutingWidget extends StatefulWidget {
  final LevelCard userLevel;
  final int moneyBuying;
  final Size screenSize;

  const VerticalLinearLevelRoutingWidget({
    Key key,
    this.userLevel,
    this.moneyBuying,
    this.screenSize,
  }) : super(key: key);

  State<StatefulWidget> createState() =>
      _VerticalLinearLevelRoutingWidgetState();
}

class _VerticalLinearLevelRoutingWidgetState
    extends State<VerticalLinearLevelRoutingWidget> {
  int dynamicMoneyBuying;
  double dynamicMoneyBuyingPosition;
  bool isBeforeLimit;
  bool isAfterLimit;
  @override
  void initState() {
    dynamicMoneyBuying = 0;
    dynamicMoneyBuyingPosition = 0;
    //
    // example for blue+: : widget.moneyBuying > 1420000 && widget.moneyBuying < 1500000
    isBeforeLimit = widget.moneyBuying >
            int.parse(widget.userLevel.minPay) +
                int.parse(((double.parse(widget.userLevel.maxPay) -
                                double.parse(widget.userLevel.minPay)) *
                            0.9388)
                        .round()
                        .toString()
                    // .toStringAsFixed(0)
                    ) &&
        widget.moneyBuying < double.parse(widget.userLevel.maxPay);
    print('isBeforeLimit : $isBeforeLimit');
    // example for blue+: :  widget.moneyBuying > 1500000 && widget.moneyBuying <= 1850000
    isAfterLimit = widget.moneyBuying > int.parse(widget.userLevel.minPay) &&
        widget.moneyBuying <=
            int.parse(widget.userLevel.minPay) +
                (int.parse(((double.parse(widget.userLevel.maxPay) -
                                double.parse(widget.userLevel.minPay)) *
                            0.23334)
                        .round()
                        .toString()
                    // .toStringAsFixed(0)
                    ));
    print('isAfterLimit : $isAfterLimit');
    //
    print(
        'isCenterLimit : ${(widget.moneyBuying == int.parse(widget.userLevel.minPay))}');
    //

    moneyBuyingPositionAnimation(widget.screenSize);
    moneyBuyingAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(
        top: 0.028125 * _screenSize.height, //18,
        bottom: 0.039 * _screenSize.height, //25
      ),
      height: 0.96875 * _screenSize.height, //620,
      width: 0.19444 * _screenSize.width, //70,
      child: Stack(
        children: [
          // vertical progress bar
          Positioned(
            right: context.locale.toString() == 'en_US'
                ? null
                : 0.069 * _screenSize.width, //25,
            left: context.locale.toString() == 'en_US'
                ? 0.069 * _screenSize.width //25,
                : null,
            child: Container(
              height: 0.96875 * _screenSize.height, //620,
              width: 0.2083 * _screenSize.width, // 75,
              child: RotatedBox(
                quarterTurns: -3,
                child: LinearPercentIndicator(
                  percent: widget.moneyBuying < int.parse(blueLevel.minPay)
                      ? 0.04
                      : widget.userLevel.title == goldLevel.title
                          ? widget.moneyBuying ==
                                  int.parse(widget.userLevel.minPay)
                              ? 0.9
                              : 0.95
                          : widget.moneyBuying ==
                                  int.parse(widget.userLevel.minPay)
                              ? findPercentProgressIndicator(
                                      int.parse(widget.userLevel.minPay)) -
                                  0.02
                              //
                              : isBeforeLimit
                                  ? findPercentProgressIndicator(
                                          widget.moneyBuying) -
                                      0.033
                                  : isAfterLimit
                                      ? findPercentProgressIndicator(
                                          int.parse(widget.userLevel.minPay))
                                      : findPercentProgressIndicator(int.parse(
                                              (widget.moneyBuying)
                                                  .toStringAsFixed(0))) -
                                          0.02,
                  progressColor: Color(0xff32BE93),
                  animation: true,
                  restartAnimation: true,
                  curve: Curves.linear,
                  animationDuration: 3200,
                  lineHeight: 0.00234 * _screenSize.height, //1.5,
                ),
              ),
            ),
          ),

          // user level
          AnimatedPositioned(
            right: context.locale.toString() == 'en_US'
                ? 0.01527 * _screenSize.width //5.5
                : null,
            left: context.locale.toString() == 'en_US'
                ? null
                : 0.01527 * _screenSize.width //5.5
            ,
            duration: Duration(milliseconds: 3000),
            curve: Curves.linear,
            top: dynamicMoneyBuyingPosition - 0.016 * _screenSize.height, //10,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.blue,
                      width: 0.011 * _screenSize.width, //4,
                      height: isAfterLimit
                          ? 0.016 * _screenSize.height //10
                          : 0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.00277 * _screenSize.width, //1,
                            spreadRadius: 0.005,
                            offset: Offset(0.5, 0.5),
                            color: Colors.grey,
                          )
                        ],
                      ),
                      child: Text(toPriceStyle(dynamicMoneyBuying),
                          style: TextStyle(
                              fontSize: 0.023 * _screenSize.width, //9,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      // color: Colors.blue,
                      width: 0.011 * _screenSize.width, //4,
                      height: (
                                  // isBeforeLimit ||
                                  widget.moneyBuying ==
                                      int.parse(widget.userLevel.minPay)) &&
                              (widget.moneyBuying > int.parse(blueLevel.minPay))
                          ? 0.016 * _screenSize.height //10
                          : 0,
                    ),
                  ],
                ),
                SizedBox(
                  width: 0.0083 * _screenSize.width, //3,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.red,
                      height: (widget.moneyBuying ==
                                  int.parse(widget.userLevel.minPay)) &&
                              (widget.moneyBuying > int.parse(blueLevel.minPay))
                          ? 0.02968 * _screenSize.height //19,
                          : 0,
                      width: 0.013 * _screenSize.width, //5
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 0.011 * _screenSize.width, //4,
                      width: 0.011 * _screenSize.width, //4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          0.138 * _screenSize.width, //50,
                        ),
                        color: Color(0xff32BE93),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      height: isAfterLimit
                          ? 0.02968 * _screenSize.height //19,
                          : 0,
                      width: 0.013 * _screenSize.width, //5
                    ),
                  ],
                ),
              ],
            ),
          ),
          // tick and money levels
          Positioned(
            right: context.locale.toString() == 'en_US'
                ? null
                : 0.023 * _screenSize.width, //9,
            left: context.locale.toString() == 'en_US'
                ? 0.023 * _screenSize.width //9,
                : null,
            child: Container(
              height: 0.9843 * _screenSize.height, //630,
              width: 0.1805 * _screenSize.width, //65,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.031 * _screenSize.height, //20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.14 * _screenSize.height, //90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              toPriceStyle(int.parse(blueLevel.minPay)),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0.025 * _screenSize.width, //9,
                                  color: MAIN_BLUE_COLOR),
                            ),
                            Text(
                              "profile_screen.toman".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.0166 * _screenSize.width, //6,
                                  color: MAIN_BLUE_COLOR),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.046 * _screenSize.height, //30
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.14 * _screenSize.height, //90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              toPriceStyle(int.parse(bluePlusLevel.minPay)),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0.025 * _screenSize.width, //9,
                                  color: MAIN_BLUE_COLOR),
                            ),
                            Text(
                              "profile_screen.toman".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.0166 * _screenSize.width, //6,
                                  color: MAIN_BLUE_COLOR),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.0625 * _screenSize.height, //40
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.14 * _screenSize.height, //90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              toPriceStyle(int.parse(blueTwoPlusLevel.minPay)),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0.025 * _screenSize.width, //9,
                                  color: MAIN_BLUE_COLOR),
                            ),
                            Text(
                              "profile_screen.toman".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.0166 * _screenSize.width, //6,
                                  color: MAIN_BLUE_COLOR),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.046 * _screenSize.height, //30
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.14 * _screenSize.height, //90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              toPriceStyle(int.parse(silverLevel.minPay)),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0.025 * _screenSize.width, //9,
                                  color: MAIN_BLUE_COLOR),
                            ),
                            Text(
                              "profile_screen.toman".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.0166 * _screenSize.width, //6,
                                  color: MAIN_BLUE_COLOR),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 0.05468 * _screenSize.height //35,
                          ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.14 * _screenSize.height, //90,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              toPriceStyle(int.parse(goldLevel.minPay)),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 0.025 * _screenSize.width, //9,
                                  color: MAIN_BLUE_COLOR),
                            ),
                            Text(
                              "profile_screen.toman".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 0.0166 * _screenSize.width, //6,
                                  color: MAIN_BLUE_COLOR),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                  SizedBox(
                    width: 0.023 * _screenSize.width, //8.3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 0.023 * _screenSize.height //15
                          ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.14 * _screenSize.height, //90,
                        child: widget.moneyBuying >= int.parse(blueLevel.minPay)
                            ? Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greenTickIcon)
                            : Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greyTickIcon),
                      ),
                      SizedBox(
                        height: 0.046 * _screenSize.height, //30
                      ),
                      SizedBox(
                        height: 0.14 * _screenSize.height, //90,
                        child: widget.moneyBuying >=
                                int.parse(bluePlusLevel.minPay)
                            ? Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greenTickIcon)
                            : Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greyTickIcon),
                      ),
                      SizedBox(
                        height: 0.0625 * _screenSize.height, //40
                      ),
                      SizedBox(
                        height: 0.14 * _screenSize.height, //90,
                        child: widget.moneyBuying >=
                                int.parse(blueTwoPlusLevel.minPay)
                            ? Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greenTickIcon)
                            : Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greyTickIcon),
                      ),
                      SizedBox(
                        height: 0.046 * _screenSize.height, //30
                      ),
                      SizedBox(
                        height: 0.14 * _screenSize.height, //90,
                        child:
                            widget.moneyBuying >= int.parse(silverLevel.minPay)
                                ? Container(
                                    height: 0.041 * _screenSize.width, //15,
                                    width: 0.041 * _screenSize.width, //15,
                                    child: GlobalSvgImages.greenTickIcon)
                                : Container(
                                    height: 0.041 * _screenSize.width, //15,
                                    width: 0.041 * _screenSize.width, //15,
                                    child: GlobalSvgImages.greyTickIcon),
                      ),
                      SizedBox(
                        height: 0.05468 * _screenSize.height, //35,
                      ),
                      SizedBox(
                        height: 0.14 * _screenSize.height, //90,
                        child: widget.moneyBuying >= int.parse(goldLevel.minPay)
                            ? Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greenTickIcon)
                            : Container(
                                height: 0.041 * _screenSize.width, //15,
                                width: 0.041 * _screenSize.width, //15,
                                child: GlobalSvgImages.greyTickIcon),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double findPercentProgressIndicator(int moneyBuying) {
    double percentProgressIndicator = 0.05;
    // print('111 :$percentProgressIndicator');
    //
    percentProgressIndicator =
        (moneyBuying < int.parse(blueLevel.minPay) ? 0.05 : 0.1);
    // print('222 :$percentProgressIndicator');
    //
    percentProgressIndicator = percentProgressIndicator +
        ((moneyBuying >= int.parse(bluePlusLevel.minPay))
            ? 0.2
            : ((moneyBuying - int.parse(blueLevel.minPay)) /
                ((int.parse(blueLevel.maxPay) - int.parse(blueLevel.minPay))) *
                0.2));
    // print('333 :$percentProgressIndicator');
    //
    percentProgressIndicator = percentProgressIndicator +
        ((moneyBuying >= int.parse(blueTwoPlusLevel.minPay))
            ? 0.2
            : ((moneyBuying < int.parse(bluePlusLevel.minPay)))
                ? 0
                : ((moneyBuying - int.parse(bluePlusLevel.minPay)) /
                    ((int.parse(bluePlusLevel.maxPay) -
                        int.parse(bluePlusLevel.minPay))) *
                    0.2));
    // print('444 :$percentProgressIndicator');
    //
    percentProgressIndicator = percentProgressIndicator +
        ((moneyBuying >= int.parse(silverLevel.minPay))
            ? 0.2
            : ((moneyBuying < int.parse(blueTwoPlusLevel.minPay)))
                ? 0
                : ((moneyBuying - int.parse(blueTwoPlusLevel.minPay)) /
                    ((int.parse(blueTwoPlusLevel.maxPay) -
                        int.parse(blueTwoPlusLevel.minPay))) *
                    0.2));
    // print('555 :$percentProgressIndicator');
    //
    percentProgressIndicator = percentProgressIndicator +
        ((moneyBuying >= int.parse(goldLevel.minPay))
            ? 0.2
            : ((moneyBuying < int.parse(silverLevel.minPay)))
                ? 0
                : ((moneyBuying - int.parse(silverLevel.minPay)) /
                    ((int.parse(silverLevel.maxPay) -
                        int.parse(silverLevel.minPay))) *
                    0.2));
    // print('666 :$percentProgressIndicator');
    //
    percentProgressIndicator = percentProgressIndicator +
        ((moneyBuying >= int.parse(goldLevel.minPay)) ? 0.07 : 0);
    // print('777 :$percentProgressIndicator');
    return percentProgressIndicator;
    //
  }

  Future<void> moneyBuyingAnimation() async {
    int _step;
    if (widget.moneyBuying < 3000000)
      _step = 100000;
    else if (widget.moneyBuying < 15000000)
      _step = 1000000;
    else
      _step = 4000000;
    while (dynamicMoneyBuying + _step < widget.moneyBuying) {
      setState(() {
        dynamicMoneyBuying = dynamicMoneyBuying + _step;
      });
      await Future.delayed(Duration(
          milliseconds: int.parse(
              (3000 / (widget.moneyBuying / _step)).toStringAsFixed(0))));
      // milliseconds: 250));
    }
    setState(() {
      dynamicMoneyBuying = widget.moneyBuying;
    });
  }

  Future<void> moneyBuyingPositionAnimation(Size _screenSize) async {
    dynamicMoneyBuyingPosition = 0.035 * (0.96875 * _screenSize.height); //620;
    await Future.delayed(Duration(milliseconds: 1));
    setState(() {
      // example for blue+: ?(findPercentProgressIndicator(1430000) - 0.015) * 620
      double positionInCenterLimit =
          (findPercentProgressIndicator(int.parse(widget.userLevel.minPay)) -
                  0.025) *
              (0.96875 * _screenSize.height); //620;
      print('positionInCenterLimit : $positionInCenterLimit');
      //

      // example for blue+:  minLimit= (findPercentProgressIndicator(1430000) - 0.021) * 620
      double positionInMinLimit =
          // (findPercentProgressIndicator(1430000) - 0.03) * 620;
          (findPercentProgressIndicator(int.parse(widget.userLevel.minPay) +
                      int.parse(((double.parse(widget.userLevel.maxPay) -
                                      double.parse(widget.userLevel.minPay)) *
                                  0.94667)
                              .round()
                              .toString()
                          // .toStringAsFixed(0)
                          )) -
                  0.015) *
              (0.96875 * _screenSize.height); //620;
      print('positionInMinLimit : $positionInMinLimit');

      //

      // example for blue+:  maxLimit= (findPercentProgressIndicator(1570000) + 0.01) * 620
      double positionInMaxLimit =
          // (findPercentProgressIndicator(1570000) + 0.01) * 620;
          (findPercentProgressIndicator(int.parse(widget.userLevel.minPay) +
                      int.parse(((double.parse(widget.userLevel.maxPay) -
                                      double.parse(widget.userLevel.minPay)) *
                                  0.0467)
                              .round()
                              .toString()
                          // .toStringAsFixed(0)

                          )) +
                  0.017) *
              (0.96875 * _screenSize.height); //620;
      print('positionInMaxLimit : $positionInMaxLimit');

      dynamicMoneyBuyingPosition =
          //
          widget.moneyBuying < int.parse(blueLevel.minPay)
              ? (0.06 * (0.96875 * _screenSize.height) //620;
                  )
              : widget.userLevel.title == goldLevel.title
                  ? widget.moneyBuying == int.parse(widget.userLevel.minPay)
                      ? (0.87 * (0.96875 * _screenSize.height) //620;
                          )
                      : (0.95 * (0.96875 * _screenSize.height) //620;
                      )
                  : widget.moneyBuying == int.parse(widget.userLevel.minPay)
                      ? positionInCenterLimit
                      : isBeforeLimit
                          ? positionInMinLimit
                          : isAfterLimit
                              ? positionInMaxLimit
                              : (findPercentProgressIndicator(
                                          widget.moneyBuying) -
                                      0.01) *
                                  (0.96875 * _screenSize.height); //620;
      // }
    });
  }
}
