// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ! ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/fix-bottom-button_bar_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/freinds/dotted-invite-help-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/freinds/invite-freind-panel-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/freinds/invite-table-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/global/expansion-tile_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class InviteFrindePage extends StatefulWidget {
  final String title;
  final String userId;
  final int receivedGift;
  final int someOfInvited;
  final int someOfInstallFromInvited;
  final int someOfShoppingFromInvited;
  final List<String> queFaq;
  final List<String> ansFaq;

  const InviteFrindePage({
    Key key,
    this.userId,
    this.receivedGift,
    this.someOfInvited,
    this.someOfInstallFromInvited,
    this.someOfShoppingFromInvited,
    this.title,
    this.queFaq,
    this.ansFaq,
  }) : super(key: key);
  @override
  _InviteFrindePageState createState() => _InviteFrindePageState();
}

class _InviteFrindePageState extends State<InviteFrindePage> {
  bool currentLevelWidgetAnimation = true;
  ScrollController _scrollController = new ScrollController();
  PanelController sendingPanel = PanelController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            // color: Colors.red,
            child: SlidingUpPanel(
              controller: sendingPanel,
              minHeight: 0,
              maxHeight: 0.61655 * _screenSize.height, //365,
              backdropEnabled: true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  0.03 * _screenSize.width, //11,
                ),
                topRight: Radius.circular(
                  0.03 * _screenSize.width, //11,
                ),
              ),
              panel: InviteFriendPanelWidget(
                closePanel: () => sendingPanel.close(),
                inviteLink:
                    "https://jeanswest.club/v1/jwclub/register?code=udilxv",
              ),
              body: Column(
                children: [
                  Container(
                    height: _screenSize.height -
                        (0.16047 * _screenSize.height //95
                        ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.027 * _screenSize.width, //10,
                    ),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          AppBarWithCloseWidget(
                            title: widget.title,
                            closeOnTap: () => Navigator.pop(context),
                          ),
                          Divider(
                            height: 0.003125 * _screenSize.height, //2,
                            thickness: 0.00555 * _screenSize.width, //2,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 0.016 * _screenSize.height //10
                              ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 0.027 * _screenSize.width, //10,
                                ),
                                child: InviteTableWidget(
                                  receivedGift: widget.receivedGift,
                                  someOfShoppingFromInvited:
                                      widget.someOfShoppingFromInvited,
                                  someOfInstallFromInvited:
                                      widget.someOfInstallFromInvited,
                                ),
                              ),
                              //
                              SizedBox(
                                height: 0.03125 * _screenSize.height, //20
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 0.041 * _screenSize.width, //15,
                                ),
                                child: Text(
                                  'شما میتونین با دعوت دوستانتون به اپلیکشن جین وست هم خودتون و هم دوستتون جوایز نقدی دریافت کنین',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    // color: MAIN_BLUE_COLOR,
                                    color: Colors.black,
                                    fontSize: 0.038 * _screenSize.width, //14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.016 * _screenSize.height //10
                                  ),
                              Container(
                                height: 0.234 * _screenSize.height, //150,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: new AssetImage(
                                        'assets/images/png_images/profile/friends_banner.png'),
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.016 * _screenSize.height //10
                                  ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 0.0138 * _screenSize.width, //5
                                  ),
                                  Container(
                                    height: 0.23611 * _screenSize.width, //85,
                                    width: 0.23611 * _screenSize.width, //85,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: new AssetImage(
                                            'assets/images/png_images/profile/delivery_motor.png'),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'حالا مراحلی که باید تا جایزه گرفتن طی کنی :',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 0.036 * _screenSize.width, //13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.041 * _screenSize.width, //15,
                                  ),
                                ],
                              ),
                              DottedBoxInviteHelpWidget(),
                              SizedBox(
                                height: 0.023 * _screenSize.height, //15
                              ),
                              ExpansionTileWidget(
                                title: 'سوالات متداول',
                                que: widget.queFaq,
                                ans: widget.ansFaq,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: FixBottomButtonBarWidget(
                      title: 'ارسال لینک',
                      bottomButtonFunction: () => sendingPanel.open(),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),

      // ),
    );
  }
}
