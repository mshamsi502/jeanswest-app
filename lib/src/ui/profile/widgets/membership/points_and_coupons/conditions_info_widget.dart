// //*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
// //*  Project Name:  avakatan_branches
// //*  Created on:    7th October - 07/10/2020     _     15:23:37
// //****************************************************************************

// import 'package:jeanswest/src/models/coupon/coupon.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ConditionsInfoWidget extends StatefulWidget {
//   final int index;
//   final Coupon coupon;

//   const ConditionsInfoWidget({
//     Key key,
//     this.index,
//     this.coupon,
//   }) : super(key: key);
//   State<StatefulWidget> createState() => _ConditionsInfoWidgetState();
// }

// class _ConditionsInfoWidgetState extends State<ConditionsInfoWidget> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _screenSize = MediaQuery.of(context).size;
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(height: 0.003125 * _screenSize.height //2,
//               ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: 0.013 * _screenSize.width, //5
//                 ),
//                 child: Container(
//                   height: 0.013 * _screenSize.width, //5
//                   width: 0.013 * _screenSize.width, //5
//                   decoration: BoxDecoration(
//                     color: Color(0xffffC107),
//                     borderRadius: BorderRadius.circular(
//                       0.138 * _screenSize.width, //50
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 0.013 * _screenSize.width, //5
//               ),
//               Expanded(
//                 child: Text(
//                   widget.coupon.conditions[widget.index],
//                   style: TextStyle(
//                     fontSize: 0.027 * _screenSize.width, //10,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
