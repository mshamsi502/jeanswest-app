//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderMainInfoWidget extends StatefulWidget {
  final Color backgroungColor;
  final double radius;
  //
  final String firstTitle;
  final String secTitle;
  final String thirdTitle;
  //
  final String firstValue;
  final String secValue;
  final String thirdValue;
  //
  // final int totalCount;
  // final String state;
  // final String totalPrice;
  // final String confirmDate;

  OrderMainInfoWidget({
    Key key,
    this.firstTitle,
    this.secTitle,
    this.thirdTitle,
    this.firstValue,
    this.secValue,
    this.thirdValue,
    this.backgroungColor = FB_BACKGROUND_COLOR,
    this.radius = 4,

    // this.state,
    // this.totalPrice,
    // this.confirmDate,
    // this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OrderMainInfoWidgetState();
}

class _OrderMainInfoWidgetState extends State<OrderMainInfoWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroungColor,
        borderRadius: BorderRadius.circular(widget.radius),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.5,
            blurRadius: 10,
            color: Colors.grey[200],
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 5),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.firstTitle,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.firstValue,
                  textDirection: ltrTextDirection,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2),
          Container(
            height: 70,
            child: VerticalDivider(
              color: Colors.grey[400],
              thickness: 0.5,
              indent: 8,
              endIndent: 8,
              width: 5,
            ),
          ),
          SizedBox(width: 2),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.secTitle,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  widget.secValue,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2),
          Container(
            height: 70,
            child: VerticalDivider(
              color: Colors.grey[400],
              thickness: 0.5,
              indent: 8,
              endIndent: 8,
              width: 5,
            ),
          ),
          SizedBox(width: 2),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.thirdTitle,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  // totalCount.toString(),
                  widget.thirdValue,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
