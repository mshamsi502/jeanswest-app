// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/return_process_page.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/onlineOrderDetails/package_sender_info_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/onlineOrderDetails/reciver_info_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/onlineOrderDetails/online_payment_detail_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/onlineOrderDetails/online_payment_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/onlineOrder/user-online-order-res.dart';
import 'package:jeanswest/src/constants/global/globalInstances/return-policy-data.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/qr_code_order_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_main_info_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OnlineOrderDetailsScreen extends StatefulWidget {
  final UserOnlineOrderRes order;
  final String state;
  final int totalCount;

  const OnlineOrderDetailsScreen({
    Key key,
    this.order,
    this.state,
    this.totalCount,
  }) : super(key: key);
  @override
  _OnlineOrderDetailsScreenState createState() =>
      _OnlineOrderDetailsScreenState();
}

class _OnlineOrderDetailsScreenState extends State<OnlineOrderDetailsScreen> {
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
          return Container(
            height: _screenSize.height,
            width: _screenSize.width,
            child: Stack(
              children: [
                Positioned(
                  top: 0.075 * _screenSize.height, //45,
                  child: Container(
                    height: _screenSize.height -
                        (0.1093 * _screenSize.height), //70,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Container(
                            width: _screenSize.width,
                            color: F7_BACKGROUND_COLOR,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.069 * _screenSize.width, //25,
                              vertical: 0.023 * _screenSize.height, //15
                            ),
                            child: OrderMainInfoWidget(
                              backgroungColor: Colors.white,
                              radius: 0.011 * _screenSize.width, //4,
                              firstTitle: 'کد سفارش',
                              firstValue: widget.order.code,
                              secTitle: 'قیمت قابل پرداخت',
                              secValue: toPriceStyle(payblePrice),
                              // countProducts: widget.order.countProducts,
                              thirdTitle: 'تحویل گیرنده',
                              thirdValue: widget.order.receiverName,
                            ),
                          ),
                          ReciverInfoWidget(
                            order: widget.order,
                            totalCount: widget.totalCount,
                            // totalCount: 2,
                          ),
                          SizedBox(
                            height: 0.023 * _screenSize.height, //15
                          ),
                          PackageSenderInfoWidget(
                            order: widget.order,
                            totalCount: widget.totalCount,
                          ),
                          SizedBox(
                            height: 0.023 * _screenSize.height, //15
                          ),
                          PaymentDetailWidget(
                            order: widget.order,
                            totalCount: widget.totalCount,
                          ),
                          SizedBox(
                            height: 0.023 * _screenSize.height, //15
                          ),
                          OnlinePaymentInfoWidget(
                            order: widget.order,
                            totalCount: widget.totalCount,
                          ),
                          SizedBox(
                            height: 0.023 * _screenSize.height, //15
                          ),
                          GestureDetector(
                            child: Container(
                              width: _screenSize.width,
                              height: 0.078125 * _screenSize.height, //50,
                              color: GREY_EB_BACKGROUND_COLOR,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 0.054 * _screenSize.width, //20
                                  ),
                                  Icon(
                                    Icons.swap_horizontal_circle_outlined,
                                    size: 0.07777 * _screenSize.width, //28
                                  ),
                                  SizedBox(
                                    width: 0.027 * _screenSize.width, //10,
                                  ),
                                  Text(
                                    'شرایط بازگشت کالا',
                                    style: TextStyle(
                                      fontSize: 0.038 * _screenSize.width, //14,
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 0.05 * _screenSize.width, //18,
                                    color: Colors.grey[700],
                                  ),
                                  SizedBox(
                                    width: 0.054 * _screenSize.width, //20
                                  ),
                                ],
                              ),
                            ),
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReturnProcessPage(
                                          initialTab: 0,
                                          returnProciyData: returnPolicyData,
                                        ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AppBarWithBackWidget(
                  title: 'جزئیات سفارش',
                  option: GestureDetector(
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(6),
                      margin: EdgeInsets.all(3),
                      child: ProfileSvgImages.myBlueBarcodeIcon,
                    ),
                    onTap: () {
                      showPlatformDialog(
                        context: context,
                        builder: (_) => BasicDialogAlert(
                          content: QRCodeOrderWidget(
                            orderCode: widget.order.code,
                          ),
                        ),
                        androidBarrierDismissible: true,
                      );
                    },
                  ),
                  onTapBack: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        })),
      ),
    );
  }
}
