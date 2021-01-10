// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/current_level_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/level_cards_info_widget.dart';

class MembershipLevelPage extends StatefulWidget {
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;

  const MembershipLevelPage(
      {Key key, this.userLevel, this.moneyBuying, this.nextLevel})
      : super(key: key);

  @override
  _MembershipLevelPageState createState() => _MembershipLevelPageState();
}

class _MembershipLevelPageState extends State<MembershipLevelPage> {
  bool currentLevelWidgetAnimation = true;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Color(0xfff7f7f7),
      width: _screenSize.width,
      height: _screenSize.height,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          CurrentLevelWidget(
            userLevel: widget.userLevel,
            moneyBuying: widget.moneyBuying,
            nextLevel: widget.nextLevel,
            currentLevelWidgetAnimation: currentLevelWidgetAnimation,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: LevelCardsInfoWidget(
              userLevel: widget.userLevel,
              moneyBuying: widget.moneyBuying,
            ),
          ),
        ],
      ),
    );
  }
}
