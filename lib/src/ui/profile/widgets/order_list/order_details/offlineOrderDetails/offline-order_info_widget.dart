//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';

import 'package:jeanswest/src/ui/profile/screens/orderList/offline_order_details_screen.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_main_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class OfflineOrderInfoWidget extends StatefulWidget {
  final UserOfflineOrderRes offlineOrder;

  OfflineOrderInfoWidget({
    Key key,
    this.offlineOrder,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OfflineOrderInfoWidgetState();
}

class _OfflineOrderInfoWidgetState extends State<OfflineOrderInfoWidget> {
  ScrollController scrollController = new ScrollController();
  int totalCount = 0;
  bool isBigger = false;
  int maxItem;
  //
  int payblePrice = 0;
  @override
  void initState() {
    for (var i = 0; i < widget.offlineOrder.products.length; i++) {
      payblePrice = payblePrice +
          int.parse(widget.offlineOrder.products[i].discountedPrice);
    }
    widget.offlineOrder.countProducts.forEach((count) {
      totalCount = totalCount + count;
    });
    maxItem = widget.offlineOrder.countProducts.length;

    // print('totalCount : $totalCount');
    // print('count : ${widget.order.countProducts.length}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    isBigger = (widget.offlineOrder.countProducts.length) *
            (0.166 * _screenSize.width //60,
            ) >
        (_screenSize.width -
            (0.054 * _screenSize.width //20
            ));
    if (isBigger) {
      maxItem = ((_screenSize.width -
                  (0.20833 * _screenSize.width //70
                  )) /
              (0.166 * _screenSize.width //60,
              ))
          .round();
    }

    // print('maxItem : $maxItem');
    // print('_screenSize.width - 30 : ${_screenSize.width - 20}');
    // print('isBigger : $isBigger');
    // print('.||||||||||||||||||||||||||||||||||.');
    return GestureDetector(
      child: Container(
        width: _screenSize.width,
        padding: EdgeInsets.all(
          0.027 * _screenSize.width, //10,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'کد سفارش',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.038 * _screenSize.width, //14,
                    // fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  width: 0.0138 * _screenSize.width, //5,
                ),
                Text(
                  widget.offlineOrder.code,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.038 * _screenSize.width, //14,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 0.0138 * _screenSize.width, //5,
                ),

                Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 0.054 * _screenSize.width, //20
                  color: Colors.black87,
                ),
                // GlobalSvgImages.leftIcon,
              ],
            ),
            Row(
              children: [
                // Expanded(
                //   child:
                Container(
                  // color: Colors.red,
                  height: 0.15625 * _screenSize.height, //100,
                  child: ListView.builder(
                    // itemCount: widget.order.products.length,
                    itemCount: isBigger
                        ? maxItem
                        : widget.offlineOrder.products.length,
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(
                          horizontal: 0.00555 * _screenSize.width, //2,
                        ),
                        height: 0.138 * _screenSize.width, //50,
                        width: 0.138 * _screenSize.width, //50,
                        // color: Colors.red,
                        child: Image.network(
                            widget.offlineOrder.products[index].assets),
                      );
                    },
                  ),
                  // ),
                ),
                SizedBox(
                  width: 0.0138 * _screenSize.width, //5,
                ),
                isBigger
                    ? Container(
                        // color: Colors.blue,
                        width: 0.09722 * _screenSize.width, //35,
                        height: 0.09722 * _screenSize.width, //35,
                        alignment: Alignment.center,
                        child: Text(
                          "+ ${(widget.offlineOrder.countProducts.length) - maxItem}",
                          textDirection: ltrTextDirection,
                          style: TextStyle(
                            fontSize: 0.0444 * _screenSize.width, //16,
                          ),
                        ),
                        // Icon(
                        //   Icons.more_horiz,
                        //   size: 35,
                        //   color: Colors.grey,
                        // ),
                      )
                    : SizedBox(),
              ],
            ),
            OrderMainInfoWidget(
              backgroungColor: FB_BACKGROUND_COLOR,
              radius: 0.011 * _screenSize.width, //4,
              firstTitle: 'شعبه',
              firstValue: widget.offlineOrder.shortBranchName,
              secTitle: 'مبلغ پرداخت شده',
              secValue: toPriceStyle(payblePrice),
              thirdTitle: 'تعداد کالا',
              thirdValue: totalCount.toString(),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OfflineOrderDetailsScreen(
                      order: widget.offlineOrder,
                      totalCount: totalCount,
                    )));
      },
    );
  }
}
