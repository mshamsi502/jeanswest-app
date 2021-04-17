// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';
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
            spreadRadius: 0.5,
            blurRadius: 15,
            color: Colors.grey[400],
          ),
        ],
      ),
      child: widget.offlineOrders.length == 0
          ? Center(
              child: Container(
                height: 60,
                width: 60,
                color: Colors.green,
              ),
            )
          : SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ListView.builder(
                    controller: scrollController,
                    itemCount: widget.offlineOrders.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        width: _screenSize.width,
                        child: OfflineOrderInfoWidget(
                          offlineOrder: widget.offlineOrders[index],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
    );
  }
}
