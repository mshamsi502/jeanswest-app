// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/orders.dart';
import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class OnlineTabsWidget extends StatefulWidget {
  List<Order> inProgressOrders;
  List<Order> compeletedOrders;
  List<Order> returnedOrders;

  OnlineTabsWidget({
    Key key,
    this.inProgressOrders,
    this.compeletedOrders,
    this.returnedOrders,
  }) : super(key: key);
  @override
  _OnlineTabsWidgetState createState() => _OnlineTabsWidgetState();
}

class _OnlineTabsWidgetState extends State<OnlineTabsWidget>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0;
  TabController tabController;
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = new ScrollController();
    tabController = new TabController(initialIndex: 0, length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTab = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          width: 470,
                          padding: EdgeInsets.only(
                              top: 10, bottom: 5, left: 10, right: 10),
                          child: TabBar(
                            controller: tabController,
                            labelColor: MAIN_BLUE_COLOR,
                            indicatorColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 5),
                            tabs: <Widget>[
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: tabController.index == 0
                                      ? BLUE_SKY_FADE_COLOR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: tabController.index == 0
                                          ? MAIN_BLUE_COLOR
                                          : Colors.grey[200]),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'در حال انجام',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 25,
                                      height: 25,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: Text(
                                        widget.inProgressOrders.length
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        color: tabController.index == 0
                                            ? MAIN_BLUE_COLOR
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: tabController.index == 1
                                      ? BLUE_SKY_FADE_COLOR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: tabController.index == 1
                                          ? MAIN_BLUE_COLOR
                                          : Colors.grey[200]),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'تکمیل شده',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 25,
                                      height: 25,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: Text(
                                        widget.compeletedOrders.length
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        color: tabController.index == 1
                                            ? MAIN_BLUE_COLOR
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  color: tabController.index == 2
                                      ? BLUE_SKY_FADE_COLOR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: tabController.index == 2
                                          ? MAIN_BLUE_COLOR
                                          : Colors.grey[200]),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'مرجوعی',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 25,
                                      height: 25,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 2),
                                      child: Text(
                                        widget.returnedOrders.length.toString(),
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        color: tabController.index == 2
                                            ? MAIN_BLUE_COLOR
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: <Widget>[
                            OrderListWidget(
                              orders: inProgressOrders,
                              isOffline: false,
                            ),
                            OrderListWidget(
                              orders: compeletedOrders,
                              isOffline: false,
                            ),
                            OrderListWidget(
                              orders: returnedOrders,
                              isOffline: false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
