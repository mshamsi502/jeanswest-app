// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/vertical_linear_level_routing_widget.dart';

import 'level_card_widget.dart';

class LevelCardsInfoWidget extends StatefulWidget {
  final LevelCard userLevel;
  final int moneyBuying;

  const LevelCardsInfoWidget({
    Key key,
    this.userLevel,
    this.moneyBuying,
  }) : super(key: key);

  State<StatefulWidget> createState() => _LevelCardsInfoWidgetState();
}

class _LevelCardsInfoWidgetState extends State<LevelCardsInfoWidget> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalLinearLevelRoutingWidget(
                  userLevel: widget.userLevel,
                  moneyBuying: widget.moneyBuying,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      LevelCardWidget(
                        levelCard: blueLevel,
                        isUserLevel: widget.userLevel.title == blueLevel.title,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LevelCardWidget(
                        levelCard: bluePlusLevel,
                        isUserLevel:
                            widget.userLevel.title == bluePlusLevel.title,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LevelCardWidget(
                        levelCard: blueTwoPlusLevel,
                        isUserLevel:
                            widget.userLevel.title == blueTwoPlusLevel.title,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LevelCardWidget(
                        levelCard: silverLevel,
                        isUserLevel:
                            widget.userLevel.title == silverLevel.title,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LevelCardWidget(
                        levelCard: goldLevel,
                        isUserLevel: widget.userLevel.title == goldLevel.title,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      //   ),
      // ),
    );
  }
}
