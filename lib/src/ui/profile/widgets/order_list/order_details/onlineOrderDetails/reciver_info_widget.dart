//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/onlineOrder/user-online-order-res.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReciverInfoWidget extends StatefulWidget {
  final UserOnlineOrderRes order;
  final int totalCount;

  ReciverInfoWidget({
    Key key,
    this.order,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _ReciverInfoWidgetState();
}

class _ReciverInfoWidgetState extends State<ReciverInfoWidget> {
  @override
  Widget build(BuildContext context) {
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
            height: 0.027 * _screenSize.width, //10,
          ),
          Text(
            'اطلاعات تحویل گیرنده',
            style: TextStyle(
              color: Colors.black,
              fontSize: 0.038 * _screenSize.width, //14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 0.016 * _screenSize.height, //10
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تحویل گیرنده:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.order.receiverName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
              children: [
                Text(
                  'شماره تماس:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.order.phoneNumber,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
                  'آدرس:',
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
                    widget.order.address.address,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 0.038 * _screenSize.width, //14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
