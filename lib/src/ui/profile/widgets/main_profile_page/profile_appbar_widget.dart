// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/qr_code_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/tab_bar_view_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/membership_level_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/jeanpoint_and_coupons_page.dart';

class ProfileAppBarWidget extends StatefulWidget {
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;

  const ProfileAppBarWidget({
    Key key,
    this.userLevel,
    this.nextLevel,
    this.moneyBuying,
  }) : super(key: key);
  State<StatefulWidget> createState() => _ProfileAppBarWidgetState();
}

class _ProfileAppBarWidgetState extends State<ProfileAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print('width : ${_screenSize.width}');
    print('height : ${_screenSize.height}');
    return Container(
      width: _screenSize.width,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 0.05 * _screenSize.height,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                height: 0.328 * _screenSize.height,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: new AssetImage(
                        'assets/images/png_images/profile/profile_appbar_background.png'),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Row(
                      children: [
                        Expanded(flex: 1, child: SizedBox()),
                        Expanded(
                          flex: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 15,
                                    child: SizedBox(),
                                  ),
                                  Container(
                                    height: 0.0625 * _screenSize.height,
                                    width: 0.33 * _screenSize.width,
                                    decoration: BoxDecoration(
                                      // color: Colors.redAccent,
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: new AssetImage(
                                            'assets/images/png_images/global/jeanswest_logo.png'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                              Container(
                                color: Colors.white,
                                padding: EdgeInsets.all(5),
                                child: AvakatanButtonWidget(
                                  title: 'نمایش سطح عضویت',
                                  fontSize: 0.03 * _screenSize.width,
                                  backgroundColor: MAIN_BLUE_COLOR,
                                  textColor: Colors.white,
                                  borderColor: MAIN_BLUE_COLOR,
                                  height: 0.059 * _screenSize.height,
                                  width: 0.4 * _screenSize.width,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TabBarViewPage(
                                        title: 'سطح عضویت',
                                        selectedTab: 0,
                                        tabTitles: [
                                          'سطح عضویت من',
                                          ' جین پوینت ها و بن ها',
                                        ],
                                        tabWidgets: [
                                          MembershipLevelPage(
                                            userLevel: widget.userLevel,
                                            nextLevel: widget.nextLevel,
                                            moneyBuying: widget.moneyBuying,
                                          ),
                                          JeanpointAndCouponsPage(),
                                        ],
                                        bottomButtonFunction: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(flex: 1, child: SizedBox()),
                        QrCodeWidget(),
                        Expanded(flex: 1, child: SizedBox()),
                      ],
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        Expanded(
                          flex: 50,
                          child: Divider(
                            height: 0.5,
                            thickness: 0.0008 * _screenSize.height,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                    Text(
                      'اگر کارت خود را فراموش کردید میتوانید از اینجا اسکن کنید',
                      style: TextStyle(
                        fontSize: 0.027 * _screenSize.width,
                        color: MAIN_BLUE_COLOR,
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox(height: 10)),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            // left: 0,
            right: 0,
            child: Container(
              width: _screenSize.width,
              height: 0.17 * _screenSize.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Container(
                    height: 0.17 * _screenSize.width,
                    width: 0.17 * _screenSize.width,
                    decoration: BoxDecoration(
                      // color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: new AssetImage(
                            'assets/images/png_images/profile/user_profile.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            user.perName,
                            style: TextStyle(
                                fontSize: 0.041 * _screenSize.width,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                  Expanded(flex: 10, child: SizedBox()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
