//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/ui/profile/screens/orderList/order_details_screen.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_main_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class OrderInfoWidget extends StatefulWidget {
  final Order order;
  final String state;

  OrderInfoWidget({
    Key key,
    this.order,
    this.state,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OrderInfoWidgetState();
}

class _OrderInfoWidgetState extends State<OrderInfoWidget> {
  ScrollController scrollController = new ScrollController();
  int totalCount = 0;
  bool isBigger = false;
  int maxItem;
  @override
  void initState() {
    widget.order.countProducts.forEach((count) {
      totalCount = totalCount + count;
    });
    // print('totalCount : $totalCount');
    // print('count : ${widget.order.countProducts.length}');
    maxItem = widget.order.countProducts.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    isBigger =
        (widget.order.countProducts.length) * 90 > (_screenSize.width - 20);
    if (isBigger) {
      maxItem = ((_screenSize.width - 75) / 90).round();
    }
    // print('maxItem : $maxItem');
    // print('_screenSize.width - 30 : ${_screenSize.width - 20}');
    // print('isBigger : $isBigger');
    // print('.||||||||||||||||||||||||||||||||||.');
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'کد سفارش',
                  style: TextStyle(
                    color: MAIN_BLUE_COLOR,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  widget.order.code,
                  style: TextStyle(
                    color: MAIN_BLUE_COLOR,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(child: SizedBox()),
                GlobalSvgImages.leftIcon,
              ],
            ),
            Row(
              children: [
                // Expanded(
                //   child:
                Container(
                  // color: Colors.red,
                  height: 100,
                  child: ListView.builder(
                    // itemCount: widget.order.products.length,
                    itemCount:
                        isBigger ? maxItem : widget.order.products.length,
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                            image: new AssetImage(
                                widget.order.products[index].assets),
                          ),
                        ),
                      );
                    },
                  ),
                  // ),
                ),
                SizedBox(width: 5),
                isBigger
                    ? Container(
                        // color: Colors.blue,
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.more_horiz,
                          size: 35,
                          color: Colors.grey,
                        ),
                      )
                    : Container(),
              ],
            ),
            OrderMainInfoWidget(
              state: widget.state,
              confirmDate:
                  '${widget.order.confirmDate.yearOfDate}/${widget.order.confirmDate.mouthOfDate}/${widget.order.confirmDate.dayOfDate}',
              totalPrice: toPriceStyle(int.parse(widget.order.payablePrice)),
              // countProducts: widget.order.countProducts,
              totalCount: totalCount,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderDetailsScreen(
                      order: widget.order,
                      state: widget.state,
                      totalCount: totalCount,
                    )));
      },
    );
  }
}
