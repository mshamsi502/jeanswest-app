// // ! *  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
// // ! *  Project Name:  avakatan_branches
// // ! *  Created on:    7th October - 07/10/2020     _     15:23:37
// // ! ****************************************************************************

// import 'package:fdottedline/fdottedline.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:jeanswest/src/models/coupon/coupon.dart';
// import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
// import 'package:jeanswest/src/constants/global/colors.dart';
// import 'package:jeanswest/src/utils/helper/global/helper.dart';

// import 'conditions_info_widget.dart';

// class SingleCouponInfoWidget extends StatefulWidget {
//   final Coupon coupon;
//   final Size screenSize;

//   const SingleCouponInfoWidget({
//     Key key,
//     this.coupon,
//     this.screenSize,
//   }) : super(key: key);
//   State<StatefulWidget> createState() => _SingleCouponInfoWidgetState();
// }

// class _SingleCouponInfoWidgetState extends State<SingleCouponInfoWidget> {
//   double bottomHeight;
//   @override
//   void initState() {
//     bottomHeight = 0.078125 * widget.screenSize.height; //50,
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _screenSize = MediaQuery.of(context).size;
//     return Container(
//       width: _screenSize.width,
//       // color: Colors.greenAccent,
//       child: Stack(
//         children: [
//           Container(
//             margin: EdgeInsets.only(
//               left: 0.041 * _screenSize.width, //15,
//               right: 0.041 * _screenSize.width, //15,
//               bottom: 0.016 * _screenSize.height, //10
//               top: 0.0016 * _screenSize.height, //1
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(
//                 0.011 * _screenSize.width, //4,
//               ),
//               boxShadow: <BoxShadow>[
//                 BoxShadow(
//                   color: Colors.grey[400],
//                   blurRadius: 0.0083 * _screenSize.width, //3,
//                   spreadRadius: 0.00555 * _screenSize.width, //2,
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(
//                     top: 0.016 * _screenSize.height, //10
//                     left: 0.027 * _screenSize.width, //10,
//                     right: 0.027 * _screenSize.width, //10,
//                   ),
//                   width: _screenSize.width,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.symmetric(
//                       vertical: BorderSide(
//                         width: 0.00555 * _screenSize.width, //2,
//                         color: Colors.transparent,
//                         // color: Colors.red,
//                       ),
//                       horizontal: BorderSide.none,
//                     ),
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                         color: Colors.grey[400],
//                         blurRadius: 0.00138 * _screenSize.height, //0.5,
//                         spreadRadius: 0.000555 * _screenSize.width, //0.2,
//                       )
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 0.0078 * _screenSize.height, //5,
//                           ),
//                           Container(
//                             height: 0.09166 * _screenSize.width, //33,
//                             width: 0.09166 * _screenSize.width, //33,
//                             child: ProfileSvgImages.couponIcon,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         width: 0.027 * _screenSize.width, //10,
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               widget.coupon.title,
//                               style: TextStyle(
//                                 fontSize: 0.034 * _screenSize.width, //12,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 0.0078 * _screenSize.height, //5,
//                             ),
//                             Container(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   for (var i = 0;
//                                       i < widget.coupon.conditions.length;
//                                       i++)
//                                     ConditionsInfoWidget(
//                                       coupon: widget.coupon,
//                                       index: i,
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 0.027 * _screenSize.width, //10,
//                   ),
//                   width: _screenSize.width,
//                   height: 0.054 * _screenSize.width, //20
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     // color: Colors.lightBlueAccent,
//                     border: Border.symmetric(
//                       vertical: BorderSide(
//                         width: 0.00555 * _screenSize.width, //2,
//                         color: Colors.transparent,
//                         // color: Colors.blue,
//                       ),
//                       horizontal: BorderSide.none,
//                     ),
//                   ),
//                   child: FDottedLine(
//                     color: Colors.grey[400],
//                     width: _screenSize.width -
//                         (0.125 * _screenSize.height //80,
//                         ),
//                     strokeWidth: 0.00277 * _screenSize.width, //1,,
//                     dottedLength: 0.022 * _screenSize.width, //8,
//                     space: 0.011 * _screenSize.width, //4,
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(
//                     bottom: 0.0078 * _screenSize.height, //5,
//                     left: 0.027 * _screenSize.width, //10,
//                     right: 0.027 * _screenSize.width, //10,
//                   ),
//                   width: _screenSize.width,
//                   height: bottomHeight -
//                       (0.016 * _screenSize.height //10
//                       ),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     // color: Colors.amberAccent,
//                     border: Border.symmetric(
//                       vertical: BorderSide(
//                         width: 0.00555 * _screenSize.width, //2,
//                         color: Colors.transparent,
//                         // color: Colors.amber,
//                       ),
//                       horizontal: BorderSide.none,
//                     ),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                           height: 0.069 * _screenSize.width, //25,
//                           width: 0.069 * _screenSize.width, //25,
//                           child: ProfileSvgImages.coinIcon),
//                       SizedBox(
//                         width: 0.027 * _screenSize.width, //10,
//                       ),
//                       Text(
//                         'مبلغ ${toPriceStyle(int.parse(widget.coupon.price))} تومان',
//                         style: TextStyle(
//                           fontSize: 0.03 * _screenSize.width, //11
//                           color: MAIN_BLUE_COLOR,
//                         ),
//                       ),
//                       Expanded(
//                         child: SizedBox(),
//                       ),
//                       Text(
//                         'مدت اعتبار از تاریخ ${widget.coupon.startYear}/${widget.coupon.startMonth}/${widget.coupon.startDay} تا ${widget.coupon.endYear}/${widget.coupon.endMonth}/${widget.coupon.endDay}',
//                         style: TextStyle(
//                           fontSize: 0.022 * _screenSize.width, //8,
//                           color: Colors.grey,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           //
//           Positioned(
//             right: 0.0083 * _screenSize.width, //3,
//             bottom: bottomHeight,
//             child: Container(
//               height: 0.054 * _screenSize.width, //20
//               width: 0.054 * _screenSize.width, //20
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(
//                   0.138 * _screenSize.width, //50,
//                 ),
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                     color: Colors.grey[400],
//                     blurRadius: 0.0083 * _screenSize.width, //3,
//                     spreadRadius: 0.00555 * _screenSize.width, //2,
//                     offset: Offset(
//                         0.00277 * _screenSize.width, //1,
//                         0),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0.0083 * _screenSize.width, //3,
//             bottom: bottomHeight,
//             child: Container(
//               height: 0.054 * _screenSize.width, //20
//               width: 0.054 * _screenSize.width, //20
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(
//                   0.138 * _screenSize.width, //50,
//                 ),
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                     color: Colors.grey[400],
//                     blurRadius: 0.0083 * _screenSize.width, //3,
//                     spreadRadius: 0.00555 * _screenSize.width, //2,
//                     offset: Offset(
//                         -(0.00277 * _screenSize.width //1,
//                         ),
//                         0),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           //
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Container(
//               height: _screenSize.height,
//               width: 0.038 * _screenSize.width, //14,
//               color: Colors.white,
//               // color: Colors.red,
//             ),
//           ),
//           Positioned(
//             left: 0,
//             bottom: 0,
//             child: Container(
//               height: _screenSize.height,
//               width: 0.038 * _screenSize.width, //14,
//               color: Colors.white,
//               // color: Colors.red,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
