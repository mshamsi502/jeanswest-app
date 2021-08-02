// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/empty_order_list_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/offlineOrderDetails/offline-order_info_widget.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OfflineOrderListWidget extends StatefulWidget {
  final List<UserOfflineOrderRes> offlineOrders;

  const OfflineOrderListWidget({
    Key key,
    this.offlineOrders,
  }) : super(key: key);
  @override
  _OfflineOrderListWidgetState createState() => _OfflineOrderListWidgetState();
}

class _OfflineOrderListWidgetState extends State<OfflineOrderListWidget> {
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = new ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        // color: Color(0xfff2f2f2),
        color: F7_BACKGROUND_COLOR,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.00138 * _screenSize.width, //0.5,
            blurRadius: 0.041 * _screenSize.width, //15,
            color: Colors.grey[400],
          ),
        ],
      ),
      child: widget.offlineOrders == null
          ? widget.offlineOrders.length <= 0
              ? EmptyOrderListWidget()
              : SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.016 * _screenSize.height, //10
                      ),
                      ListView.builder(
                        controller: scrollController,
                        itemCount: widget.offlineOrders.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 0.027 * _screenSize.width, //10,
                              vertical: 0.0194 * _screenSize.width, //7,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                0.011 * _screenSize.width, //4,
                              ),
                            ),
                            width: _screenSize.width,
                            child: OfflineOrderInfoWidget(
                              offlineOrder: widget.offlineOrders[index],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 0.031 * _screenSize.height, //20,
                      ),
                    ],
                  ),
                )
          : EmptyOrderListWidget(),
    );
  }
}
