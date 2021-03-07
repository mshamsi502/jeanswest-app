//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class SecThreeOrderDetailWidget extends StatefulWidget {
  final String orgPrice;
  final int finalSendPrice;
  final String payablePrice;
  final int totalCount;

  SecThreeOrderDetailWidget({
    Key key,
    this.totalCount,
    this.orgPrice,
    this.payablePrice,
    this.finalSendPrice,
  }) : super(key: key);

  State<StatefulWidget> createState() => _SecThreeOrderDetailWidgetState();
}

class _SecThreeOrderDetailWidgetState extends State<SecThreeOrderDetailWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'جزئیات پرداخت',
            style: TextStyle(
              color: Colors.black,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'قیمت کل (${widget.totalCount} کالا)',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${toPriceStyle(int.parse(widget.orgPrice))}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    'تومان',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'هزینه ارسال',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              widget.finalSendPrice == 0
                  ? Text(
                      'رایگان',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Row(
                      children: [
                        Text(
                          '${toPriceStyle(widget.finalSendPrice)}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 3),
                        Text(
                          'تومان',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'سود شما از خرید',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${toPriceStyle(int.parse(widget.orgPrice) - int.parse(widget.payablePrice) + widget.finalSendPrice)}',
                    style: TextStyle(
                      color: widget.orgPrice == widget.payablePrice
                          ? Colors.black
                          : MAIN_BLUE_COLOR,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    'تومان',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 0.5,
            color: Colors.grey[400],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'مبلغ قابل پرداخت',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${toPriceStyle(int.parse(widget.payablePrice))}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 3),
                  Text(
                    'تومان',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
