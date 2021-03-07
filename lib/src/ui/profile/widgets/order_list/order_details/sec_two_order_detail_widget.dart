//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/detail_order_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecTwoOrderDetailWidget extends StatefulWidget {
  final Order order;
  final String state;
  final int totalCount;

  SecTwoOrderDetailWidget({
    Key key,
    this.order,
    this.state,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _SecTwoOrderDetailWidgetState();
}

class _SecTwoOrderDetailWidgetState extends State<SecTwoOrderDetailWidget> {
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
      width: _screenSize.width,
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Column(
        children: [
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.order.products.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  index == 0
                      ? Container()
                      : Divider(
                          thickness: 0.8,
                          color: Colors.grey[400],
                        ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    width: _screenSize.width,
                    child: DetailOrderInfoWidget(
                      product: widget.order.products[index],
                      count: widget.order.countProducts[index],
                      //
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
