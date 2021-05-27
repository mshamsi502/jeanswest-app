//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/onlineOrder/user-online-order-res.dart';

import 'package:jeanswest/src/ui/profile/screens/orderList/online_order_details_screen.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_main_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class OnlineOrderInfoWidget extends StatefulWidget {
  final UserOnlineOrderRes onlineOrder;

  OnlineOrderInfoWidget({
    Key key,
    this.onlineOrder,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OnlineOrderInfoWidgetState();
}

class _OnlineOrderInfoWidgetState extends State<OnlineOrderInfoWidget> {
  ScrollController scrollController = new ScrollController();
  int totalCount = 0;
  bool isBigger = false;
  int maxItem;
  //
  int payblePrice = 0;
  @override
  void initState() {
    for (var i = 0; i < widget.onlineOrder.products.length; i++) {
      payblePrice = payblePrice +
          int.parse(widget.onlineOrder.products[i].discountedPrice);
    }
    widget.onlineOrder.countProducts.forEach((count) {
      totalCount = totalCount + count;
    });
    maxItem = widget.onlineOrder.countProducts.length;
    // print('totalCount : $totalCount');
    // print('count : ${widget.order.countProducts.length}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    isBigger = (widget.onlineOrder.countProducts.length) *
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
                  widget.onlineOrder.code,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.038 * _screenSize.width, //14,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 0.0138 * _screenSize.width, //5,
                ),

                widget.onlineOrder.statusShopping == 'مرجوعی'
                    ? Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.0138 * _screenSize.width, //5,
                          vertical: 0.001689 * _screenSize.height, //1,
                        ),
                        decoration: BoxDecoration(
                          color: LIGHT_YELLOW_SKIN_COLOR,
                          borderRadius: BorderRadius.circular(
                            0.0138 * _screenSize.width, //5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              size: 0.05 * _screenSize.width, //18,
                              color: MAIN_GOLD_COLOR,
                            ),
                            SizedBox(
                              width: 0.0138 * _screenSize.width, //5,
                            ),
                            Container(
                              width:
                                  widget.onlineOrder.statusStepReturn.length >
                                          // 0.054 * _screenSize.width //20
                                          0.03611 * _screenSize.width //13
                                      ? 0.27 * _screenSize.width //100,
                                      : null,
                              child: Text(
                                widget.onlineOrder.statusStepReturn,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 0.0333 * _screenSize.width, //12,
                                  color: MAIN_GOLD_COLOR,
                                ),
                              ),
                            ),
                            // ),
                          ],
                        ),
                      )
                    // ,
                    // )
                    : SizedBox(),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 0.054 * _screenSize.width, //20
                  color: Colors.black87,
                ),
                // GlobalSvgImages.leftIcon,
              ],
            ),
            SizedBox(
              height: 0.016 * _screenSize.height, //10
            ),
            Row(
              children: [
                // Expanded(
                //   child:
                Container(
                  // color: Colors.red,
                  height: 0.078125 * _screenSize.height, //50,
                  child: ListView.builder(
                    // itemCount: widget.order.products.length,
                    itemCount:
                        isBigger ? maxItem : widget.onlineOrder.products.length,
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        // padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(
                          horizontal: 0.00555 * _screenSize.width, //2,
                        ),
                        height: 0.078125 * _screenSize.height, //50,
                        width: 0.078125 * _screenSize.height, //50,
                        // color: Colors.red,
                        child: Image.network(
                            widget.onlineOrder.products[index].assets),
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
                          "+ ${(widget.onlineOrder.countProducts.length) - maxItem}",
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
            SizedBox(
              height: 0.016 * _screenSize.height, //10
            ),
            OrderMainInfoWidget(
              backgroungColor: FB_BACKGROUND_COLOR,
              radius: 0.011 * _screenSize.width, //4,
              firstTitle: 'تاریخ ثبت سفارش',
              firstValue:
                  '${widget.onlineOrder.confirmDate.yearOfDate}/${widget.onlineOrder.confirmDate.mouthOfDate}/${widget.onlineOrder.confirmDate.dayOfDate}',
              secTitle: 'مبلغ پرداخت شده',
              secValue:
                  // toPriceStyle(int.parse(widget.onlineOrder.payablePrice)),
                  toPriceStyle(payblePrice),
              // countProducts: widget.order.countProducts,
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
                builder: (context) => OnlineOrderDetailsScreen(
                      order: widget.onlineOrder,
                      totalCount: totalCount,
                    )));
      },
    );
  }
}
