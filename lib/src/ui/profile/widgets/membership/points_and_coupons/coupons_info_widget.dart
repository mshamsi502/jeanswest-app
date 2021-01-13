//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:jeanswest/src/models/coupon/coupon.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/points_and_coupons/single_coupon_info_widget.dart';

import 'package:flutter/material.dart';

class CouponsInfoWidget extends StatefulWidget {
  final List<Coupon> coupons;
  final ScrollController scrollController;

  CouponsInfoWidget({
    Key key,
    this.coupons,
    this.scrollController,
  }) : super(key: key);

  State<StatefulWidget> createState() => _CouponsInfoWidgetState();
}

class _CouponsInfoWidgetState extends State<CouponsInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 0.016 * _screenSize.height, //10
            left: 0.069 * _screenSize.width, //25,
            right: 0.069 * _screenSize.width, //25,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 0.0138 * _screenSize.height, //5,
            horizontal: 0.0138 * _screenSize.width, //5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              0.0054 * _screenSize.width, //2
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 0.00138 * _screenSize.height, //0.5,
                spreadRadius: 0.0003125 * _screenSize.height, //0.2,
              )
            ],
          ),
          child: Row(
            children: [
              Icon(
                Icons.attach_money,
                size: 0.054 * _screenSize.width, //20
                color: MAIN_BLUE_COLOR,
              ),
              SizedBox(
                width: 0.0138 * _screenSize.width, //5,
              ),
              Text(
                '${widget.coupons.length} بن',
                style: TextStyle(
                    fontSize: 0.036 * _screenSize.width, //13,
                    color: MAIN_BLUE_COLOR),
              ),
            ],
          ),
        ),
        Container(
          child: ListView.builder(
            controller: widget.scrollController,
            itemCount: widget.coupons.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(
                        bottom: 0.03125 * _screenSize.height, //20,
                        left: 0.027 * _screenSize.width, //10,
                        right: 0.027 * _screenSize.width, //10,
                      ),
                      child: SingleCouponInfoWidget(
                        coupon: widget.coupons[index],
                        screenSize: _screenSize,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
