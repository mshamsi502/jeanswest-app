// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/offlineOrderDetails/offline_order_list_widget.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-order-info.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/onlineOrderDetails/online-tabs-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen>
    with SingleTickerProviderStateMixin {
  PanelController editingPanel = new PanelController();
  int selectedTab = 0;
  TabController tabController;
  @override
  void initState() {
    tabController = new TabController(initialIndex: 0, length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTab = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: SlidingUpPanel(
            controller: editingPanel,
            minHeight: 0,
            maxHeight: _screenSize.height,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                0.041 * _screenSize.width, //15,
              ),
              topRight: Radius.circular(
                0.041 * _screenSize.width, //15,
              ),
            ),
            panel: Container(
              color: Colors.white,
              height: _screenSize.height,
            ),
            body: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.078125 * _screenSize.height, //40
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          height: 0.0625 * _screenSize.height, //50,
                          // color: Colors.red,
                          child: TabBar(
                            controller: tabController,
                            labelColor: MAIN_BLUE_COLOR,
                            labelPadding: EdgeInsets.only(
                              top: 0.00625 * _screenSize.height, //5,
                              bottom: 0.00625 * _screenSize.height, //5,
                            ),
                            indicatorColor: MAIN_BLUE_COLOR,
                            labelStyle: TextStyle(
                                fontSize: 0.038 * _screenSize.width, //14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'IRANSans'),
                            indicatorPadding: EdgeInsets.symmetric(
                              horizontal: 0.027 * _screenSize.width, //10,
                            ),
                            indicatorWeight: 0.00416 * _screenSize.width, //1.5,
                            tabs: <Widget>[
                              Tab(text: 'آنلاین'),
                              Tab(text: 'آفلاین'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: <Widget>[
                              OnlineTabsWidget(
                                // ignore: deprecated_member_use
                                inProgressOrders: userOrdersa.inProgressOrders,
                                compeletedOrders: userOrdersa.compeletedOrders,
                                returnedOrders: userOrdersa.returnedOrders,
                              ),
                              OfflineOrderListWidget(
                                offlineOrders: userOrdersa.offlineOrders,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppBarWithBackWidget(
                    title: 'سفارشات من',
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
