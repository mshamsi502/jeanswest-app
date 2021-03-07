//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderMainInfoWidget extends StatefulWidget {
  // final List<int> countProducts;
  final int totalCount;
  final String state;
  final String totalPrice;
  final String confirmDate;

  OrderMainInfoWidget({
    Key key,
    this.state,
    this.totalPrice,
    this.confirmDate,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OrderMainInfoWidgetState();
}

class _OrderMainInfoWidgetState extends State<OrderMainInfoWidget> {
  // int totalCount = 0;

  @override
  void initState() {
    // widget.countProducts.forEach((count) {
    //   totalCount = totalCount + count;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحله انجام',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.state,
                style: TextStyle(
                  color: widget.state == 'تکمیل شده'
                      ? Color(0xff32BE93)
                      : Color(0xffFFC107),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(width: 2),
          VerticalDivider(
            color: Colors.grey,
            // color: MAIN_BLUE_COLOR,
            thickness: 0.5,
            indent: 8,
            endIndent: 8,
            width: 5,
          ),
          SizedBox(width: 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تاریخ ثبت',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.confirmDate,
                textDirection: ltrTextDirection,
                style: TextStyle(
                  color: MAIN_BLUE_COLOR,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: 2),
          VerticalDivider(
            color: Colors.grey,
            // color: MAIN_BLUE_COLOR,
            thickness: 0.5,
            indent: 8,
            endIndent: 8,
            width: 5,
          ),
          SizedBox(width: 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'قیمت کل',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.totalPrice,
                style: TextStyle(
                  color: MAIN_BLUE_COLOR,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: 2),
          VerticalDivider(
            color: Colors.grey,
            // color: MAIN_BLUE_COLOR,
            thickness: 0.5,
            indent: 8,
            endIndent: 8,
            width: 5,
          ),
          SizedBox(width: 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تعداد کالا',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                // totalCount.toString(),
                widget.totalCount.toString(),
                style: TextStyle(
                  color: MAIN_BLUE_COLOR,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }
}
