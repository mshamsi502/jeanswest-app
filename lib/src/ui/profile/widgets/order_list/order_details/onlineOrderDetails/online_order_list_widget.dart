// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/onlineOrder/user-online-order-res.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/onlineOrderDetails/online-order_info_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnlineOrderListWidget extends StatefulWidget {
  final List<UserOnlineOrderRes> onlineOrders;
  const OnlineOrderListWidget({
    Key key,
    this.onlineOrders,
  }) : super(key: key);
  @override
  _OnlineOrderListWidgetState createState() => _OnlineOrderListWidgetState();
}

class _OnlineOrderListWidgetState extends State<OnlineOrderListWidget> {
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
      child: widget.onlineOrders.length == 0
          ? Padding(
              padding: EdgeInsets.all(
                0.054 * _screenSize.width, //20
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 0.27 * _screenSize.width, //100,
                    width: 0.27 * _screenSize.width, //100,
                    child: GlobalSvgImages.emptyBox,
                  ),
                  SizedBox(
                    height: 0.031 * _screenSize.height, //20,
                  ),
                  Text(
                    'سفارش فعالی در این بخش موجود نیست',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 0.0444 * _screenSize.width, //16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 0.234 * _screenSize.height, //150,
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  SizedBox(
                    height: 0.016 * _screenSize.height, //10
                  ),
                  ListView.builder(
                    controller: scrollController,
                    itemCount: widget.onlineOrders.length,
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
                        child: OnlineOrderInfoWidget(
                          onlineOrder: widget.onlineOrders[index],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 0.031 * _screenSize.height, //20,
                  ),
                ],
              ),
            ),
    );
  }
}
