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
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
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
                screenSize: _screenSize,
              ),
              SizedBox(
                width: 0.027 * _screenSize.width, //10,
              ),
              Expanded(
                child: Container(
                    child: Column(
                  children: [
                    SizedBox(height: 0.016 * _screenSize.height //10
                        ),
                    LevelCardWidget(
                      levelCard: blueLevel,
                      isUserLevel: widget.userLevel.title == blueLevel.title,
                      state: widget.moneyBuying > int.parse(blueLevel.minPay)
                          ? 'active'
                          : 'deactive',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LevelCardWidget(
                      levelCard: bluePlusLevel,
                      isUserLevel:
                          widget.userLevel.title == bluePlusLevel.title,
                      state:
                          widget.moneyBuying > int.parse(bluePlusLevel.minPay)
                              ? 'active'
                              : 'deactive',
                    ),
                    SizedBox(height: 0.016 * _screenSize.height //10
                        ),
                    LevelCardWidget(
                      levelCard: blueTwoPlusLevel,
                      isUserLevel:
                          widget.userLevel.title == blueTwoPlusLevel.title,
                      state: widget.moneyBuying >
                              int.parse(blueTwoPlusLevel.minPay)
                          ? 'active'
                          : 'deactive',
                    ),
                    SizedBox(height: 0.016 * _screenSize.height //10,
                        ),
                    LevelCardWidget(
                      levelCard: silverLevel,
                      isUserLevel: widget.userLevel.title == silverLevel.title,
                      state: widget.moneyBuying > int.parse(silverLevel.minPay)
                          ? 'active'
                          : 'deactive',
                    ),
                    SizedBox(height: 0.016 * _screenSize.height //10
                        ),
                    LevelCardWidget(
                      levelCard: goldLevel,
                      isUserLevel: widget.userLevel.title == goldLevel.title,
                      state: widget.moneyBuying > int.parse(goldLevel.minPay)
                          ? 'active'
                          : 'deactive',
                    ),
                    SizedBox(height: 0.016 * _screenSize.height //10
                        ),
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
