// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/return_process_page.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/offlineOrderDetails/shopping_info_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/offlineOrderDetails/offline_payment_info_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/offlineOrderDetails/offline_payment_detail_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_main_info_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OfflineOrderDetailsScreen extends StatefulWidget {
  final UserOfflineOrderRes order;
  final String state;
  final int totalCount;

  const OfflineOrderDetailsScreen({
    Key key,
    this.order,
    this.state,
    this.totalCount,
  }) : super(key: key);
  @override
  _OfflineOrderDetailsScreenState createState() =>
      _OfflineOrderDetailsScreenState();
}

class _OfflineOrderDetailsScreenState extends State<OfflineOrderDetailsScreen> {
  PanelController editingPanel = new PanelController();
  ScrollController scrollController = new ScrollController();
  int payblePrice = 0;
  @override
  void initState() {
    for (var i = 0; i < widget.order.products.length; i++) {
      payblePrice =
          payblePrice + int.parse(widget.order.products[i].discountedPrice);
    }
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
                                secValue: toPriceStyle(payblePrice),
                                // countProducts: widget.order.countProducts,
                                thirdTitle: 'تحویل گیرنده',
                                thirdValue: widget.order.receiverName,
                              ),
                            ),
                            ShoppingInfoWidget(
                              order: widget.order,
                              totalCount: widget.totalCount,
                            ),
                            SizedBox(height: 10),
                            OfflinePaymentDetailWidget(
                              order: widget.order,
                              totalCount: widget.totalCount,
                            ),
                            SizedBox(height: 10),
                            OfflinePaymentInfoWidget(
                              order: widget.order,
                              totalCount: widget.totalCount,
                            ),
                            // ReciverInfoWidget(
                            //   order: widget.order,
                            //   totalCount: widget.totalCount,
                            // ),
                            // SizedBox(height: 15),
                            // PackageSenderInfoWidget(
                            //   order: widget.order,
                            //   totalCount: widget.totalCount,
                            // ),
                            // SizedBox(height: 15),
                            // PaymentDetailWidget(
                            //   order: widget.order,
                            //   totalCount: widget.totalCount,
                            // ),
                            // SizedBox(height: 15),
                            // PaymentInfoWidget(
                            //   order: widget.order,
                            //   totalCount: widget.totalCount,
                            // ),
                            SizedBox(height: 15),
                            GestureDetector(
                              child: Container(
                                width: _screenSize.width,
                                height: 50,
                                color: GREY_EB_BACKGROUND_COLOR,
                                child: Row(
                                  children: [
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.swap_horizontal_circle_outlined,
                                      size: 28,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'شرایط بازگشت کالا',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                      color: Colors.grey[700],
                                    ),
                                    SizedBox(width: 20),
                                  ],
                                ),
                              ),
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReturnProcessPage(
                                            initialTab: 1,
                                          ))),
                            ),
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
