// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/contact_us_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/questions_widget.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage>
    with SingleTickerProviderStateMixin {
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
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Container(
                  height: _screenSize.height - 20,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 220,
                        width: _screenSize.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: new AssetImage('assets/images/support.png'),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 55, right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120,
                                alignment: Alignment.center,
                                // color: Color(0x44ff0000),
                                child: Text(
                                  'چه کمکی از دست ما',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: MAIN_BLUE_COLOR,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 120,
                                // color: Color(0x44ff0000),
                                child: Text(
                                  'برمیاد؟',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: MAIN_BLUE_COLOR,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: AvakatanButtonWidget(
                              backgroundColor: tabController.index == 0
                                  ? Color(0xfff2f2f2)
                                  : MAIN_BLUE_COLOR,
                              textColor: tabController.index == 0
                                  ? Colors.black
                                  : Colors.white,
                              title: 'سوالات متداول',
                              height: 30,
                              borderColor: MAIN_BLUE_COLOR,
                              radius: 5,
                              fontSize: 14,
                              onTap: () {
                                setState(() {
                                  tabController.index = 0;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: AvakatanButtonWidget(
                              backgroundColor: tabController.index == 1
                                  ? Color(0xfff2f2f2)
                                  : MAIN_BLUE_COLOR,
                              textColor: tabController.index == 1
                                  ? Colors.black
                                  : Colors.white,
                              title: 'تماس با ما',
                              height: 30,
                              borderColor: MAIN_BLUE_COLOR,
                              radius: 5,
                              fontSize: 14,
                              onTap: () {
                                setState(() {
                                  tabController.index = 1;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: <Widget>[
                            QuestionsWidget(),
                            ContactUsWidget(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
                AppBarWithCloseWidget(
                  title: 'پشتیبانی',
                  closeOnTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
