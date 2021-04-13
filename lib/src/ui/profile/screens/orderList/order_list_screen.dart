// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/orders.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_list_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/online-tabs-widget.dart';
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
  //
  // bool isNew;
  //
  // int selectedIndex;
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
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            panel: Container(
              color: Colors.white,
              height: _screenSize.height,
              //
              // child: EditInfoAddressWidget(
              //     title: 'اطلاعات آدرس',
              //     name: user.perName,
              //     isNew: isNew,
              //     closePanel: () {
              //       setState(() {
              //         isNew = false;
              //         editingPanel.close();
              //       });
              //     },
              //     confirmInfo: confirmInfo),
            ),
            body: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        TabBar(
                          controller: tabController,
                          labelColor: MAIN_BLUE_COLOR,
                          indicatorColor: MAIN_BLUE_COLOR,
                          indicatorPadding:
                              EdgeInsets.symmetric(horizontal: 10),
                          indicatorWeight: 1.5,
                          tabs: <Widget>[
                            Tab(text: 'آنلاین'),
                            Tab(text: 'آفلاین'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: <Widget>[
                              OnlineTabsWidget(
                                // ignore: deprecated_member_use
                                inProgressOrders: inProgressOrders,
                                compeletedOrders: compeletedOrders,
                                returnedOrders: returnedOrders,
                              ),
                              OrderListWidget(
                                orders: endedOrders,
                                isOffline: true,
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
