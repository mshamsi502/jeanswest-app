// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  13:46 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';

import 'circle_membership_widget.dart';

class LevelCardWidget extends StatefulWidget {
  final LevelCard levelCard;
  final bool isUserLevel;

  const LevelCardWidget({
    Key key,
    this.levelCard,
    this.isUserLevel,
  }) : super(key: key);

  State<StatefulWidget> createState() => _LevelCardWidgetState();
}

class _LevelCardWidgetState extends State<LevelCardWidget> {
  @override
  Widget build(BuildContext context) {
    print(' ***** widget.isUserLevel :: ${widget.isUserLevel}');
    return Container(
      alignment: Alignment.center,
      height: 100,
      margin: EdgeInsets.only(
        right: context.locale.toString() == 'en_US' ? 30 : 5,
        left: context.locale.toString() == 'en_US' ? 5 : 30,
        top: 15,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: widget.isUserLevel
            ? [
                BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 4,
                  spreadRadius: 0.2,
                  offset: Offset(2, 2),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.grey[500],
                ),
              ],
      ),
      child: Row(
        children: [
          Container(
            height: 85,
            padding: EdgeInsets.only(top: 15),
            alignment: Alignment.center,
            child: CircleMembershipWidget(
              level: widget.levelCard.title,
              state: 'active',
              minMoneyPaying: int.parse(widget.levelCard.minPay),
              maxMoneyPaying: int.parse(widget.levelCard.maxPay),
              minPayIsActive: false,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              // color: Colors.lightGreenAccent,
              height: 80,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.levelCard.subTitleOne != ''
                          ? Icon(
                              Icons.fact_check_outlined,
                              size: 12,
                            )
                          : Container(),
                      SizedBox(
                        width: 3,
                      ),
                      widget.levelCard.subTitleOne != ''
                          ? Expanded(
                              child: Text(
                                widget.levelCard.subTitleOne,
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.levelCard.subTitleTwo != ''
                          ? Icon(
                              Icons.date_range_outlined,
                              size: 12,
                            )
                          : Container(),
                      SizedBox(
                        width: 5,
                      ),
                      widget.levelCard.subTitleTwo != ''
                          ? Expanded(
                              child: Text(
                                widget.levelCard.subTitleTwo,
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.levelCard.subTitleThree != ''
                          ? Icon(
                              Icons.card_giftcard_outlined,
                              size: 12,
                            )
                          : Container(),
                      SizedBox(
                        width: 5,
                      ),
                      widget.levelCard.subTitleThree != ''
                          ? Expanded(
                              child: Text(
                                widget.levelCard.subTitleThree,
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.levelCard.subTitleFour != ''
                          ? Icon(
                              Icons.rss_feed,
                              size: 12,
                            )
                          : Container(),
                      SizedBox(
                        width: 5,
                      ),
                      widget.levelCard.subTitleFour != ''
                          ? Expanded(
                              child: Text(
                                widget.levelCard.subTitleFour,
                                style: TextStyle(fontSize: 10),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
