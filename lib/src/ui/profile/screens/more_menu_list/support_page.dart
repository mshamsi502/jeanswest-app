// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-tickets-info.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/login/screens/login_page.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/contact_us_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/main_ticket_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/questions_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/support_page/send_new_ticket_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
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
  bool newTicketIsValid;
  bool floatingisShowing;
  // ignore: deprecated_member_use
  List<Map<String, dynamic>> resCheckIsValid = new List<Map<String, dynamic>>();

  @override
  void initState() {
    resCheckIsValid = [
      {
        'isValid': true,
        'errorMessage': '',
      },
      {
        'isValid': true,
        'errorMessage': '',
      },
    ];
    newTicketIsValid = false;
    tabController = new TabController(initialIndex: 0, length: 3, vsync: this);
    panelController = new PanelController();
    floatingisShowing = true;
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
        child: WillPopScope(
          onWillPop: () => backPanelClose(
            [panelController],
            context,
          ),
          child: Scaffold(
            floatingActionButton: floatingisShowing
                ? GestureDetector(
                    child: Container(
                      height: 0.14 * _screenSize.width, //55
                      width: 0.14 * _screenSize.width, //55
                      decoration: BoxDecoration(
                        color: MAIN_GOLD_COLOR,
                        borderRadius: BorderRadius.circular(
                          0.14 * _screenSize.width, // 50
                        ),
                      ),
                      padding: EdgeInsets.all(
                        0.023 * _screenSize.height, //15
                      ),
                      child: GlobalSvgImages.editIconForLeft,
                    ),
                    onTap: () {
                      if (userIsAuth) {
                        setState(() {
                          floatingisShowing = false;
                        });

                        panelController.open();
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              screenSize: _screenSize,
                              navigatorPop: (BuildContext context) =>
                                  Navigator.pop(context),
                            ),
                          ),
                        );
                      }
                    })
                : SizedBox(),
            body: Container(
              width: _screenSize.width,
              height: _screenSize.height,
              child: SlidingUpPanel(
                controller: panelController,
                minHeight: 0,
                maxHeight: 0.72635 * _screenSize.height, //430
                backdropEnabled: true,
                backdropTapClosesPanel: true,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                onPanelClosed: () {
                  setState(() {
                    floatingisShowing = true;
                    resCheckIsValid = [
                      {
                        'isValid': true,
                        'errorMessage': '',
                      },
                      {
                        'isValid': true,
                        'errorMessage': '',
                      },
                    ];
                  });
                },
                panel: SendNewTicketWidget(
                  resCheckIsValid: resCheckIsValid,
                  checkIsValid: (String title, String text) {
                    List<Map<String, dynamic>> _resCheckIsValid =
                        checkTicketIsValid(title: title, text: text);
                    setState(() {
                      resCheckIsValid = _resCheckIsValid;
                      newTicketIsValid = (resCheckIsValid[0]['isValid'] &&
                          resCheckIsValid[1]['isValid']);
                    });
                    print(
                        '00 title isValid : ${resCheckIsValid[0]['isValid']}');
                    print('00 text isValid : ${resCheckIsValid[1]['isValid']}');
                  },
                  canSendMessage: newTicketIsValid,
                  sendMessage: (String title, String text) {
                    // ! call send new ticket api
                    setState(() {
                      addTicketToUserTicket(title, text);
                    });
                  },
                  closePanel: () async {
                    await panelController.close().then((value) {
                      setState(() {
                        floatingisShowing = true;
                      });
                    });
                  },
                ),
                body: Container(
                  width: _screenSize.width,
                  height: _screenSize.height,
                  color: Colors.white,
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
                                    'assets/images/png_images/profile/more/support-header.png'),
                            MainTicketWidget(
                              headerAsset:
                                  'assets/images/png_images/profile/more/support-header.png',
                              emptyTicketAsset:
                                  'assets/images/png_images/profile/more/create-ticket-help.png',
                              ticket: userTickets,
                            ),
                            ContactUsWidget(
                              headerAsset:
                                  'assets/images/png_images/profile/more/support-header.png',
                              contactUs: contactUsInfo,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.046 * _screenSize.height, //30
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
