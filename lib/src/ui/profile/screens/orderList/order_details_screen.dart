// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/sec_one_order_detail_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/reciver_info_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/sec_three_order_detail_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/sec_two_order_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_main_info_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Order order;
  final String state;
  final int totalCount;

  const OrderDetailsScreen({
    Key key,
    this.order,
    this.state,
    this.totalCount,
  }) : super(key: key);
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  PanelController editingPanel = new PanelController();
  ScrollController scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(body: Builder(builder: (BuildContext context) {
          return SlidingUpPanel(
            controller: editingPanel,
            minHeight: 0,
            maxHeight: _screenSize.height,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            panel: Container(
              color: Color(0x44000000),
              height: _screenSize.height,
            ),
            body: Container(
              // color: Colors.white,
              color: F7_BACKGROUND_COLOR,
              child: Stack(
                children: [
                  Positioned(
                    top: 45,
                    child: Container(
                      height: _screenSize.height - 70,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Container(
                              width: _screenSize.width,
                              color: F7_BACKGROUND_COLOR,
                              padding: EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 15,
                              ),
                              child: OrderMainInfoWidget(
                                backgroungColor: Colors.white,
                                radius: 4,
                                firstTitle: 'کد سفارش',
                                firstValue: widget.order.code,
                                secTitle: 'قیمت قابل پرداخت',
                                secValue: toPriceStyle(
                                    int.parse(widget.order.payablePrice)),
                                // countProducts: widget.order.countProducts,
                                thirdTitle: 'تحویل گیرنده',
                                thirdValue: widget.order.receiverName,
                              ),
                            ),
                            ReciverInfoWidget(
                              order: widget.order,
                              totalCount: widget.totalCount,
                            ),
                            // SecOneOrderDetailWidget(
                            //   order: widget.order,
                            //   state: widget.state,
                            //   totalCount: widget.totalCount,
                            // ),
                            // SizedBox(height: 3),
                            // SecTwoOrderDetailWidget(
                            //   order: widget.order,
                            //   state: widget.state,
                            //   totalCount: widget.totalCount,
                            // ),
                            // SizedBox(height: 3),
                            // SecThreeOrderDetailWidget(
                            //   totalCount: widget.totalCount,
                            //   orgPrice: widget.order.orgPrice,
                            //   // sendPrice: widget.,
                            //   payablePrice: widget.order.payablePrice,
                            //   finalSendPrice: widget.order.finalSendPrice,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppBarWithBackWidget(
                    title: 'جزئیات سفارش',
                    option: ProfileSvgImages.myBlueBarcodeIcon,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        })),
      ),
    );
  }
}
