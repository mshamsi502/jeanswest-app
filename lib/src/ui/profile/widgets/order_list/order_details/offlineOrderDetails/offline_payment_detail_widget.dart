//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';

import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfflinePaymentDetailWidget extends StatefulWidget {
  final UserOfflineOrderRes order;
  final int totalCount;

  OfflinePaymentDetailWidget({
    Key key,
    this.order,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OfflinePaymentDetailWidgetState();
}

class _OfflinePaymentDetailWidgetState
    extends State<OfflinePaymentDetailWidget> {
  // String shamsiDay = '';
  int totalOrgPrice = 0;
  int discountedPrice = 0;
  int sendPrice = 0;
  //
  int payblePrice = 0;

  @override
  void initState() {
    for (var i = 0; i < widget.order.products.length; i++) {
      totalOrgPrice =
          totalOrgPrice + int.parse(widget.order.products[i].orgPrice);
      discountedPrice =
          discountedPrice + int.parse(widget.order.products[i].discountedPrice);
    }
    payblePrice = discountedPrice + sendPrice;
    // if (widget.order.recieveDate.yearOfDate.length == 4)
    //   year = widget.order.recieveDate.yearOfDate;
    // else if (widget.order.recieveDate.yearOfDate.length == 2)
    //   year = '13${widget.order.recieveDate.yearOfDate}';
    // else
    //   year = '1400';
    // shamsiDay = shamsiDayOfWeek(
    //   // int.parse(year),
    //   int.parse(widget.order.recieveDate.yearOfDate),
    //   int.parse(widget.order.recieveDate.mouthOfDate),
    //   int.parse(widget.order.recieveDate.dayOfDate),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('  orgPrice        : $totalOrgPrice');
    print('- off             : ${(totalOrgPrice - discountedPrice)}');
    print('+ finalSendPrice  : $sendPrice');
    print('  ----------------------------');
    print('= payblePrice :  $payblePrice');
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.00138 * _screenSize.width, //0.5,
            blurRadius: 0.027 * _screenSize.width, //10,
            color: Colors.grey[200],
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 0.0078 * _screenSize.height, //5
        horizontal: 0.041 * _screenSize.width, //15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.016 * _screenSize.height, //10
          ),
          Text(
            'جزییات پرداخت',
            style: TextStyle(
              color: Colors.black,
              fontSize: 0.038 * _screenSize.width, //14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مبلغ کل:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      toPriceStyle(totalOrgPrice),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' تومان',
                      style: TextStyle(
                        fontSize: 0.027 * _screenSize.width, //10,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'سود شما:',
                  style: TextStyle(
                    color: MAIN_BLUE_COLOR,
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      (totalOrgPrice - discountedPrice) > 0.0
                          ? toPriceStyle(totalOrgPrice - discountedPrice)
                          : '0',
                      style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' تومان',
                      style: TextStyle(
                        fontSize: 0.027 * _screenSize.width, //10,
                        color: MAIN_BLUE_COLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Divider(
            thickness: 0.00138 * _screenSize.width, //0.5,
            color: Colors.grey[300],
          ),
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مبلغ قابل پرداخت:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      toPriceStyle(payblePrice),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      ' تومان',
                      style: TextStyle(
                        fontSize: 0.027 * _screenSize.width, //10,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
