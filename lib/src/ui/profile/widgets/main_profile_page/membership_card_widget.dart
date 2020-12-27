//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';

class MembershipCardWidget extends StatefulWidget {
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final LevelCard preLevel;
  final int moneyBuying;

  const MembershipCardWidget({
    Key key,
    this.userLevel,
    this.moneyBuying,
    this.nextLevel,
    this.preLevel,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MembershipCardWidgetState();
}

class _MembershipCardWidgetState extends State<MembershipCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      // child: GestureDetector(
      //   onTap: () {
      //     //
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => LevelHelpScreen(
      //                   userLevel: widget.userLevel,
      //                   moneyBuying: widget.moneyBuying,
      //                   nextLevel: widget.nextLevel,
      //                 )));
      //   },
      //   child: Container(
      //     height: 105,
      //     color: Colors.transparent,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(
      //           height: 5,
      //         ),
      //         ProfileSvgImages.helpIcon,
      //         // Icon(
      //         //   Icons.help_outline,
      //         //   size: 15,
      //         //   color: Colors.grey,
      //         // ),
      //         Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 10),
      //           child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               CircleMembershipWidget(
      //                 level:
      //                     // widget.userLevel.title == 'Gold'
      //                     //     ? widget.userLevel.title
      //                     //     :
      //                     widget.nextLevel.title,
      //                 state: 'lock',
      //                 minMoneyPaying:
      //                     // widget.userLevel.title == 'Gold'
      //                     //     ? int.parse(widget.userLevel.minPay)
      //                     //     :
      //                     int.parse(widget.nextLevel.minPay),
      //                 maxMoneyPaying:
      //                     // widget.userLevel.title == 'Gold'
      //                     //     ? int.parse(widget.userLevel.maxPay)
      //                     //     :
      //                     int.parse(widget.nextLevel.maxPay),
      //                 minPayIsActive:
      //                     widget.userLevel.title == 'Gold' ? false : true,
      //               ),
      //               SizedBox(
      //                 width: 5,
      //               ),
      //               Expanded(
      //                 child: Container(
      //                   alignment: Alignment.topCenter,
      //                   height: 75,
      //                   child: Column(
      //                     children: [
      //                       UserBuyingAnimationWidget(
      //                         userLevel: widget.userLevel,
      //                         moneyBuying: widget.moneyBuying,
      //                       ),
      //                       CustomLinearPercentIndicatorWidget(
      //                         userLevel: widget.userLevel,
      //                         moneyBuying: widget.moneyBuying,
      //                       ),
      //                       widget.userLevel.title == 'Gold'
      //                           ? Container(
      //                               height: 15,
      //                             )
      //                           : RemainderBuyWidget(
      //                               userLevel: widget.userLevel,
      //                               moneyBuying: widget.moneyBuying,
      //                             ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 5,
      //               ),
      //               CircleMembershipWidget(
      //                 level: widget.userLevel.title,
      //                 state: 'active',
      //                 minMoneyPaying: int.parse(widget.userLevel.minPay),
      //                 maxMoneyPaying: int.parse(widget.userLevel.maxPay),
      //                 minPayIsActive: true,
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
