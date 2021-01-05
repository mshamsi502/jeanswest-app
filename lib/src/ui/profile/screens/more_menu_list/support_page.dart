// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/contact_us_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/main_ticket_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/questions_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/send_new_ticket_widget.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_more.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0;
  TabController tabController;
  PanelController panelController;

  @override
  void initState() {
    tabController = new TabController(initialIndex: 0, length: 3, vsync: this);
    panelController = new PanelController();
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
            width: _screenSize.width,
            height: _screenSize.height,
            child: SlidingUpPanel(
              controller: panelController,
              minHeight: 0,
              maxHeight: 0.7 * _screenSize.height, //450,
              backdropEnabled: true,
              backdropTapClosesPanel: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              panel: SendNewTicketWidget(
                sendMessage: (String department, String title, String text) {
                  setState(() {
                    addTicketToUserTicket(department, title, text);
                  });
                },
                closePanel: () => panelController.close(),
              ),
              body: Container(
                width: _screenSize.width,
                height: _screenSize.height,
                padding: EdgeInsets.symmetric(
                    horizontal: 0.027 * _screenSize.width //10
                    ),
                child: Column(
                  children: [
                    AppBarWithCloseWidget(
                      title: 'پشتیبانی',
                      closeOnTap: () => Navigator.pop(context),
                    ),
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
                          Tab(text: 'سوالات متداول'),
                          Tab(text: 'پیام به پشتیبانی'),
                          Tab(text: 'تماس با ما'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          QuestionsWidget(
                              headerAsset:
                                  'assets/images/png_images/profile/more/support_header.png'),
                          MainTicketWidget(
                            openNewTicketPanel: () => panelController.open(),
                            headerAsset:
                                'assets/images/png_images/profile/more/support_header.png',
                          ),
                          ContactUsWidget(
                              headerAsset:
                                  'assets/images/png_images/profile/more/support_header.png'),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
