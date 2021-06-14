//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfflinePaymentInfoWidget extends StatefulWidget {
  final UserOfflineOrderRes order;
  final int totalCount;

  OfflinePaymentInfoWidget({
    Key key,
    this.order,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OfflinePaymentInfoWidgetState();
}

class _OfflinePaymentInfoWidgetState extends State<OfflinePaymentInfoWidget> {
  String shamsiDay = '';
  int totalOrgPrice = 0;
  int discountedPrice = 0;
  //
  int payblePrice = 0;
  String totalPaymentPlans;

  @override
  void initState() {
    totalPaymentPlans = widget.order.paymentPlan[0];
    for (var i = 0; i < widget.order.products.length; i++) {
      totalOrgPrice =
          totalOrgPrice + int.parse(widget.order.products[i].orgPrice);
      discountedPrice =
          discountedPrice + int.parse(widget.order.products[i].discountedPrice);
    }
    payblePrice = discountedPrice;
    // if (widget.order.recieveDate.yearOfDate.length == 4)
    //   year = widget.order.recieveDate.yearOfDate;
    // else if (widget.order.recieveDate.yearOfDate.length == 2)
    //   year = '13${widget.order.recieveDate.yearOfDate}';
    // else
    //   year = '1400';
    for (var i = 1; i < widget.order.paymentPlan.length; i++) {
      totalPaymentPlans = '$totalPaymentPlans , ${widget.order.paymentPlan[i]}';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('  orgPrice        : $totalOrgPrice');
    print('- off             : ${totalOrgPrice - discountedPrice}');
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
            blurRadius: 0.041 * _screenSize.width, //15,
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
            'اطلاعات پرداخت',
            style: TextStyle(
              color: Colors.black,
              fontSize: 0.038 * _screenSize.width, //14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 0.0078 * _screenSize.height, //5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ' نحوه پرداخت:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 0.027 * _screenSize.width, //10,
                ),
                Expanded(
                  child: Text(
                    totalPaymentPlans,
                    style: TextStyle(
                      color: GREEN_TEXT_COLOR,
                      fontSize: 0.038 * _screenSize.width, //14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
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
                  'تاریخ و زمان پرداخت:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.order.paymentDate.hourOfDate}:${widget.order.paymentDate.minuteOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 0.054 * _screenSize.width, //20
                      width: 0.054 * _screenSize.width, //20
                      child: VerticalDivider(
                        color: Colors.grey,
                        // color: MAIN_BLUE_COLOR,
                        thickness: 0.00138 * _screenSize.width, //0.5,
                        width: 0.0138 * _screenSize.width, //5
                      ),
                    ),
                    Text(
                      '${widget.order.paymentDate.yearOfDate}/${widget.order.paymentDate.mouthOfDate}/${widget.order.paymentDate.dayOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.038 * _screenSize.width, //14,
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
        ],
      ),
    );
  }
}
