// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  13:46 AM
// ****************************************************************************

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';

class CircleMembershipWidget extends StatefulWidget {
  final String level;
  final String state;
  final int minMoneyPaying;
  final int maxMoneyPaying;
  final bool minPayIsActive;

  const CircleMembershipWidget({
    Key key,
    this.level,
    this.state,
    this.minMoneyPaying,
    this.maxMoneyPaying,
    this.minPayIsActive,
  }) : super(key: key);

  State<StatefulWidget> createState() => _CircleMembershipWidgetState();
}

class _CircleMembershipWidgetState extends State<CircleMembershipWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50),
                          // color: Colors.greenAccent,
                          boxShadow: [
                        BoxShadow(
                          color: widget.state != 'active'
                              ? Colors.grey
                              : widget.level == 'Silver'
                                  ? Colors.black54
                                  : widget.level == 'Gold'
                                      ? MAIN_GOLD_COLOR
                                      : Colors.lightBlue[200],
                          blurRadius: widget.state == 'active'
                              ? widget.level == 'Blue' ||
                                      widget.level == 'Blue +' ||
                                      widget.level == 'Blue 2+'
                                  ? 3
                                  : 6
                              : 0,
                          spreadRadius: 0.05,
                        )
                      ]),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 25,
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Directionality(
                            textDirection: ltrTextDirection,
                            child: Text(
                              widget.level == 'Silver' || widget.level == 'Gold'
                                  ? 'VIP'
                                  : widget.level == 'Zero'
                                      ? ''
                                      : 'Membership',
                              style: TextStyle(
                                fontSize: widget.level == 'Silver' ||
                                        widget.level == 'Gold'
                                    ? 11
                                    : 7,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Directionality(
                            textDirection: ltrTextDirection,
                            child: Text(
                                widget.level == 'Zero' ||
                                        widget.level == 'Infinity'
                                    ? ''
                                    : widget.level,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: widget.state == 'active'
                                      ? widget.level == 'Silver'
                                          ? Colors.black54
                                          : widget.level == 'Gold'
                                              ? Color(0xffD6BC32)
                                              : Colors.lightBlue
                                      : Colors.black54,
                                )),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                  width: 50,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
