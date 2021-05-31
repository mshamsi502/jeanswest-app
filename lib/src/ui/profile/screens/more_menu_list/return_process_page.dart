// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

import 'package:jeanswest/src/models/api_response/globalRes/ReturnPolicy/return-policy-data.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/return_process_widget.dart';

class ReturnProcessPage extends StatefulWidget {
  final int initialTab;
  final ReturnPolicyData returnProciyData;

  const ReturnProcessPage(
      {Key key, this.initialTab, @required this.returnProciyData})
      : super(key: key);
  @override
  _ReturnProcessPageState createState() => _ReturnProcessPageState();
}

class _ReturnProcessPageState extends State<ReturnProcessPage>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0;
  TabController tabController;
  ScrollController scrollController;

  @override
  void initState() {
    scrollController = new ScrollController();

    tabController = new TabController(
        initialIndex: widget.initialTab, length: 2, vsync: this);
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
            height: _screenSize.height,
            width: _screenSize.width,
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Column(
              children: [
                AppBarWithCloseWidget(
                  title: 'شرایط بازگشت کالا',
                  closeOnTap: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Container(
                    width: _screenSize.width,
                    child: Column(
                      children: [
                        Container(
                          height: 0.0625 * _screenSize.height, //40,
                          child: TabBar(
                            controller: tabController,
                            labelColor: MAIN_BLUE_COLOR,
                            indicatorColor: MAIN_BLUE_COLOR,
                            labelStyle: TextStyle(
                                fontSize: 0.034 * _screenSize.width, //12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'IRANSans'),
                            indicatorWeight: 0.0023 * _screenSize.height, //1.5,
                            tabs: <Widget>[
                              Tab(text: 'خرید های آنلاین'),
                              Tab(text: 'خرید های آفلاین'),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: TabBarView(
                              controller: tabController,
                              children: <Widget>[
                                ReturnProcessWidget(
                                  assetHeader: widget.returnProciyData.picture,
                                  text: widget.returnProciyData.header,
                                  describtion: widget.returnProciyData.terms,
                                  phoneNumber:
                                      widget.returnProciyData.phoneNumber,
                                ),
                                ReturnProcessWidget(
                                  assetHeader: widget.returnProciyData.picture,
                                  text: widget.returnProciyData.header,
                                  describtion: widget.returnProciyData.terms,
                                  phoneNumber:
                                      widget.returnProciyData.phoneNumber,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
