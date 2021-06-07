// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/qr_code_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/tab_bar_view_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/membership_level_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/jeanpoint_and_coupons_page.dart';

class AuthProfileAppBarWidget extends StatefulWidget {
  final String userLevelName;
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;

  const AuthProfileAppBarWidget({
    Key key,
    this.userLevel,
    this.nextLevel,
    this.moneyBuying,
    this.userLevelName,
  }) : super(key: key);
  State<StatefulWidget> createState() => _AuthProfileAppBarWidgetState();
}

class _AuthProfileAppBarWidgetState extends State<AuthProfileAppBarWidget> {
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
                // padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(
                    horizontal: 0.022 * _screenSize.width //8,
                    ),
                height: 0.37162 * _screenSize.height, //220,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(
                    0.054 * _screenSize.width, //20
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 0.00277 * _screenSize.width, //1,
                      blurRadius: 0.0138 * _screenSize.width, //5,
                      color: Colors.grey[200],
                    )
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/png_images/profile/auth_profile_appbar_background.png'),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0.119932 * _screenSize.height, //71,
                      left: 0,
                      right: 0,
                      child: Divider(
                        height: 0.00416 * _screenSize.width, //1.5,
                        thickness: 0.00416 * _screenSize.width, //1.5,
                        color: MAIN_BLUE_COLOR,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 0.023 * _screenSize.height, //15
                        ),
                        Container(
                          height: 0.261824 * _screenSize.height, //155
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 0.027 * _screenSize.width, //10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 0.093 * _screenSize.height, //60,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 20,
                                          child: SizedBox(),
                                        ),
                                        Container(
                                          height:
                                              0.075 * _screenSize.height, //45,
                                          width: 0.33333 *
                                              _screenSize.width, //120,
                                          decoration: BoxDecoration(
                                            // color: Colors.redAccent,
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: AssetImage(
                                                  'assets/images/png_images/global/jeanswest_logo.png'),
                                            ),
                                          ),
                                        ),
                                        // ),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            0.0138 * _screenSize.width, //5,
                                      ),
                                      child: AvakatanButtonWidget(
                                        title: 'نمایش سطح عضویت',
                                        fontSize:
                                            0.038 * _screenSize.width, //14,
                                        backgroundColor: MAIN_BLUE_COLOR,
                                        textColor: Colors.white,
                                        borderColor: MAIN_BLUE_COLOR,
                                        height: 0.059 * _screenSize.height,
                                        width:
                                            0.402777 * _screenSize.width, //145,
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TabBarViewPage(
                                              title: 'سطح عضویت',
                                              selectedTab: 0,
                                              tabTitles: [
                                                'سطح عضویت من',
                                                ' جین پوینت ها و بن ها',
                                              ],
                                              tabWidgets: [
                                                MembershipLevelPage(
                                                  userLevelName:
                                                      widget.userLevelName,
                                                  userLevel: widget.userLevel,
                                                  nextLevel: widget.nextLevel,
                                                  moneyBuying:
                                                      widget.moneyBuying,
                                                ),
                                                JeanpointAndCouponsPage(
                                                  userJeanpointBons:
                                                      userJeanpointBons,
                                                ),
                                              ],
                                              bottomButtonFunction: () {},
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 0.0078 * _screenSize.height //5,
                                        ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 0.027 * _screenSize.width, //10,
                              ),
                              QrCodeWidget(),
                              SizedBox(
                                width: 0.027 * _screenSize.width, //10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.0078 * _screenSize.height //5,
                            ),
                        Text(
                          'اگر کارت خود را فراموش کردید میتوانید از اینجا اسکن کنید',
                          style: TextStyle(
                            fontSize: 0.0333 * _screenSize.width, //12,
                          ),
                        ),
                        SizedBox(height: 0.0078 * _screenSize.height //5,
                            ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0.027 * _screenSize.width, //10,
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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        0.027 * _screenSize.width, //10,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0.00277 * _screenSize.width, //1,
                          blurRadius: 0.0083 * _screenSize.width, //3,
                          color: Colors.grey[200],
                          offset: Offset(
                            0,
                            0.0083 * _screenSize.width, //3,
                          ),
                        )
                      ],
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: new AssetImage(
                          user.gender == null
                              ? 'assets/images/png_images/global/userProfile/user-unknown.png'
                              : user.gender == 1
                                  ? 'assets/images/png_images/global/userProfile/user-male.png'
                                  : user.gender == 2
                                      ? 'assets/images/png_images/global/userProfile/user-female.png'
                                      : 'assets/images/png_images/global/userProfile/user-unknown.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.027 * _screenSize.width, //10,
                  ),
                  Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${user.firstName} ${user.lastName} ",
                            style: TextStyle(
                                fontSize: 0.041 * _screenSize.width,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(flex: 3, child: SizedBox()),
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
