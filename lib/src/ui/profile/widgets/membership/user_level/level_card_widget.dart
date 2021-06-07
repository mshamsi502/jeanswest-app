// // *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// // *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// // *   Created Date & Time:  2021-01-01  ,  13:46 AM
// // ****************************************************************************

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:jeanswest/src/constants/test_data/levels_card.dart';
// import 'package:jeanswest/src/models/profile/level_card/level_card.dart';

// import 'package:jeanswest/src/ui/profile/widgets/membership/user_level/circle_membership_widget.dart';

// class LevelCardWidget extends StatefulWidget {
//   final LevelCard levelCard;
//   final String state;
//   final bool isUserLevel;

//   const LevelCardWidget({
//     Key key,
//     this.levelCard,
//     this.isUserLevel,
//     this.state,
//   }) : super(key: key);

//   State<StatefulWidget> createState() => _LevelCardWidgetState();
// }

// class _LevelCardWidgetState extends State<LevelCardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     var _screenSize = MediaQuery.of(context).size;
//     return Container(
//       alignment: Alignment.center,
//       height: 0.15625 * _screenSize.height, //100,
//       margin: EdgeInsets.only(
//         right: context.locale.toString() == 'en_US'
//             ? 0.083 * _screenSize.width //30
//             : 0.013 * _screenSize.width, //5,
//         left: context.locale.toString() == 'en_US'
//             ? 0.013 * _screenSize.width //5
//             : 0.083 * _screenSize.width, //30,
//         top: 0.023 * _screenSize.height, //15,
//       ),
//       padding: EdgeInsets.symmetric(
//           horizontal: 0.027 * _screenSize.width, //10,
//           vertical: 0.0078 * _screenSize.height //5
//           ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//           0.013 * _screenSize.width, //5
//         ),
//         color: Colors.white,
//         boxShadow: widget.isUserLevel
//             ? [
//                 BoxShadow(
//                   color: Colors.grey[500],
//                   blurRadius: 0.011 * _screenSize.width, //4,
//                   spreadRadius: 0.00055 * _screenSize.width, //0.2,
//                   offset: Offset(
//                     0.00555 * _screenSize.width, //2,
//                     0.00555 * _screenSize.width, //2,
//                   ),
//                 )
//               ]
//             : [
//                 BoxShadow(
//                   color: Colors.grey[500],
//                 ),
//               ],
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 0.1328 * _screenSize.height, //85,
//             padding: EdgeInsets.only(top: 0.023 * _screenSize.height //15
//                 ),
//             alignment: Alignment.center,
//             child: CircleMembershipWidget(
//               level: widget.levelCard.title,
//               state: widget.state,
//               minMoneyPaying: int.parse(widget.levelCard.minPay),
//               maxMoneyPaying: int.parse(widget.levelCard.maxPay),
//               minPayIsActive: false,
//             ),
//           ),
//           SizedBox(
//             width: 0.027 * _screenSize.width, //10,
//           ),
//           Expanded(
//             child: Container(
//               // color: Colors.lightGreenAccent,
//               height: 0.125 * _screenSize.height, //80,
//               alignment: Alignment.center,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 // !
//                 itemCount: levels.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       widget.levelCard.subtitles[index] != ''
//                           ? Icon(
//                               Icons.fact_check_outlined,
//                               size: 0.034 * _screenSize.width, //12,
//                             )
//                           : Container(),
//                       SizedBox(
//                         width: 0.0083 * _screenSize.width, //3,
//                       ),
//                       widget.levelCard.subtitles[index] != ''
//                           ? Expanded(
//                               child: Text(
//                                 widget.levelCard.subtitles[index],
//                                 style: TextStyle(
//                                   fontSize: 0.027 * _screenSize.width, //10,
//                                 ),
//                               ),
//                             )
//                           : Container(),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 0.041 * _screenSize.width, //15,
//           ),
//         ],
//       ),
//     );
//   }
// }
