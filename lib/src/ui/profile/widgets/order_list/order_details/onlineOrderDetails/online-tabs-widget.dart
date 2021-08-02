// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-order-info.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_details/onlineOrderDetails/online_order_list_widget.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/onlineOrder/user-online-order-res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class OnlineTabsWidget extends StatefulWidget {
  List<UserOnlineOrderRes> inProgressOrders;
  List<UserOnlineOrderRes> compeletedOrders;
  List<UserOnlineOrderRes> returnedOrders;

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
    var _screenSize = MediaQuery.of(context).size;

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
                          width: 1.3055 * _screenSize.width, //470
                          padding: EdgeInsets.only(
                            top: 0.016 * _screenSize.height, //10
                            bottom: 0.0078 * _screenSize.height, //5,
                            left: 0.027 * _screenSize.width, //10,
                            right: 0.027 * _screenSize.width, //10,
                          ),
                          child: TabBar(
                            controller: tabController,
                            labelColor: MAIN_BLUE_COLOR,
                            indicatorColor: Colors.transparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: EdgeInsets.symmetric(
                              horizontal: 0.0194 * _screenSize.width, //7,
                              vertical: 0.0078 * _screenSize.height, //5,
                            ),
                            tabs: <Widget>[
                              Container(
                                height: 0.05468 * _screenSize.height, //35,
                                decoration: BoxDecoration(
                                  color: tabController.index == 0
                                      ? BLUE_SKY_FADE_COLOR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    0.011 * _screenSize.width, //4,
                                  ),
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
                                      style: TextStyle(
                                        fontSize:
                                            0.036 * _screenSize.width, //13,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.027 * _screenSize.width, //10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 0.069 * _screenSize.width, //25,
                                      height: 0.069 * _screenSize.width, //25,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            0.0138 * _screenSize.width, //5,
                                        vertical:
                                            0.003125 * _screenSize.height, //2,
                                      ),
                                      child: Text(
                                        widget.inProgressOrders != null
                                            ? widget.inProgressOrders.length
                                                .toString()
                                            : "0",
                                        style: TextStyle(
                                            fontSize:
                                                0.03 * _screenSize.width, //11
                                            color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        color: tabController.index == 0
                                            ? MAIN_BLUE_COLOR
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(
                                          0.011 * _screenSize.width, //4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 0.05468 * _screenSize.height, //35,
                                decoration: BoxDecoration(
                                  color: tabController.index == 1
                                      ? BLUE_SKY_FADE_COLOR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    0.011 * _screenSize.width, //4,
                                  ),
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
                                      style: TextStyle(
                                        fontSize:
                                            0.036 * _screenSize.width, //13,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.027 * _screenSize.width, //10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 0.069 * _screenSize.width, //25,
                                      height: 0.069 * _screenSize.width, //25,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            0.0138 * _screenSize.width, //5,
                                        vertical:
                                            0.003125 * _screenSize.height, //2,
                                      ),
                                      child: Text(
                                        widget.compeletedOrders != null
                                            ? widget.compeletedOrders.length
                                                .toString()
                                            : "0",
                                        style: TextStyle(
                                            fontSize:
                                                0.03 * _screenSize.width, //11
                                            color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        color: tabController.index == 1
                                            ? MAIN_BLUE_COLOR
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(
                                          0.011 * _screenSize.width, //4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 0.05468 * _screenSize.height, //35,
                                decoration: BoxDecoration(
                                  color: tabController.index == 2
                                      ? BLUE_SKY_FADE_COLOR
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    0.011 * _screenSize.width, //4,
                                  ),
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
                                      style: TextStyle(
                                        fontSize:
                                            0.036 * _screenSize.width, //13,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.027 * _screenSize.width, //10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      width: 0.069 * _screenSize.width, //25,
                                      height: 0.069 * _screenSize.width, //25,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            0.0138 * _screenSize.width, //5,
                                        vertical:
                                            0.003125 * _screenSize.height, //2,
                                      ),
                                      child: Text(
                                        widget.returnedOrders != null
                                            ? widget.returnedOrders.length
                                                .toString()
                                            : "0",
                                        style: TextStyle(
                                            fontSize:
                                                0.03 * _screenSize.width, //11
                                            color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                        color: tabController.index == 2
                                            ? MAIN_BLUE_COLOR
                                            : Colors.grey,
                                        borderRadius: BorderRadius.circular(
                                          0.011 * _screenSize.width, //4,
                                        ),
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
                            OnlineOrderListWidget(
                              onlineOrders: userOrdersa.inProgressOrders,
                            ),
                            OnlineOrderListWidget(
                              onlineOrders: userOrdersa.compeletedOrders,
                            ),
                            OnlineOrderListWidget(
                              onlineOrders: userOrdersa.returnedOrders,
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
