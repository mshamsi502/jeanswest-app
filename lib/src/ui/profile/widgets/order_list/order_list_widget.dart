// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderListWidget extends StatefulWidget {
  final List<Order> orders;
  final String status;

  const OrderListWidget({
    Key key,
    this.orders,
    this.status,
  }) : super(key: key);
  @override
  _OrderListWidgetState createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
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
      color: Color(0xfff2f2f2),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            ListView.builder(
              controller: scrollController,
              // itemCount: myAddresses.length,
              itemCount: widget.orders.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: _screenSize.width,
                  child: OrderInfoWidget(
                    order: widget.orders[index],
                    state: widget.status,
                  ),
                  // FavoriteInfoWidget(
                  //   product: myFavorites[index],
                  // ),
                );
              },
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
