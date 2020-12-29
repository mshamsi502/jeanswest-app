// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/constants/test_data/user_tickets.dart';
import 'package:jeanswest/src/models/message/user_ticket/ticket_message.dart';
import 'package:jeanswest/src/models/message/user_ticket/user_ticket.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/contact_us_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/main_ticket_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/questions_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/send_new_ticket_widget.dart';
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
              maxHeight: 450,
              backdropEnabled: true,
              backdropTapClosesPanel: true,
              // onPanelClosed: _onPanelClosed,
              // onPanelOpened: _onPanelOpened,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              panel: SendNewTicketWidget(
                sendMessage: (String department, String title, String text) {
                  print('******* message sended !');
                  print('department : $department');
                  print('title : $title');
                  print('text : $text');
                  print('old userTickets length: ${userTickets.length}');
                  setState(() {
                    userTickets.add(UserTicket(
                        title: title,
                        message: [
                          TicketMessage(
                            title: user.perName,
                            text: text,
                            yearOfSend: DateTime.now().year.toString(),
                            monthOfSend: DateTime.now().month.toString(),
                            dayOfSend: DateTime.now().day.toString(),
                            hourOfSend: DateTime.now().hour.toString(),
                            minOfSend: DateTime.now().minute.toString(),
                            isUser: true,
                          ),
                        ],
                        isClosed: false));
                  });
                  print('new userTickets length: ${userTickets.length}');
                },
                closePanel: () => panelController.close(),
                screenSize: _screenSize,
              ),
              body: Container(
                width: _screenSize.width,
                height: _screenSize.height,
                // color: Colors.white,
                // color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    AppBarWithCloseWidget(
                      title: 'پشتیبانی',
                      closeOnTap: () => Navigator.pop(context),
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
                            fontSize: 12,
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
                            title: 'پیام به پشتیبانی',
                            height: 30,
                            borderColor: MAIN_BLUE_COLOR,
                            radius: 5,
                            fontSize: 12,
                            onTap: () {
                              setState(() {
                                tabController.index = 1;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: AvakatanButtonWidget(
                            backgroundColor: tabController.index == 2
                                ? Color(0xfff2f2f2)
                                : MAIN_BLUE_COLOR,
                            textColor: tabController.index == 2
                                ? Colors.black
                                : Colors.white,
                            title: 'تماس با ما',
                            height: 30,
                            borderColor: MAIN_BLUE_COLOR,
                            radius: 5,
                            fontSize: 12,
                            onTap: () {
                              setState(() {
                                tabController.index = 2;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    Container(
                      height: 200,
                      width: _screenSize.width,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: new AssetImage(
                              'assets/images/png_images/profile/support_header.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          QuestionsWidget(),
                          MainTicketWidget(
                              openNewTicketPanel: () => panelController.open()),
                          ContactUsWidget(),
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
