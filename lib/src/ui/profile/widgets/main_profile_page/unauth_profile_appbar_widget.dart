// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/login/screens/login_page.dart';

class UnauthProfileAppBarWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _UnauthProfileAppBarWidgetState();
}

class _UnauthProfileAppBarWidgetState extends State<UnauthProfileAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 0.55 * _screenSize.width,
      // height: 0.3125 * _screenSize.height,
      width: _screenSize.width,
      margin: EdgeInsets.only(
        top: 0.05468 * _screenSize.height, //35,
        left: 0.041 * _screenSize.width, //15,
        right: 0.041 * _screenSize.width, //15,
      ),
      padding: EdgeInsets.all(
        0.0138 * _screenSize.width, //5
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.022 * _screenSize.width //8,

              ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                spreadRadius: 0.00015625 * _screenSize.height, //0.1,
                blurRadius: 0.022 * _screenSize.width //8,
                )
          ]),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: BLUE_SKY_FADE_COLOR,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.022 * _screenSize.width //8,
                            ),
                        topRight: Radius.circular(0.022 * _screenSize.width //8,
                            ),
                      )),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  // padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text(
                    "برای عضویت در باشگاه مشتریان جین وست اینجا کلیک کنید",
                    style: TextStyle(
                      fontSize: 0.0333 * _screenSize.width, //12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: BLUE_SKY_FADE_COLOR,
                      borderRadius: BorderRadius.only(
                        bottomLeft:
                            Radius.circular(0.022 * _screenSize.width //8,
                                ),
                        bottomRight:
                            Radius.circular(0.022 * _screenSize.width //8,
                                ),
                      )),
                ),
              ),
            ],
          ),
          Column(children: [
            Expanded(
              flex: 6,
              child: Container(
                // color: Colors.red,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Expanded(
                      child: Container(
                        height: 0.078125 * _screenSize.height, //50,
                        // width: 0.4166 * _screenSize.width, //150,
                        decoration: BoxDecoration(
                          // color: Colors.redAccent,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: new AssetImage(
                                'assets/images/png_images/global/jeanswest_logo.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                    // color: Colors.green,
                    child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SvgPicture.asset(
                        "assets/images/svg_images/profile/profileHeader/membership_card_header.svg",
                        color: FADE_BLUE_01_COLOR,
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox())
                  ],
                ))),
            Expanded(flex: 2, child: Container()),
            Expanded(
                flex: 7,
                child: Container(
                    width: _screenSize.width,
                    margin: EdgeInsets.only(
                      top: 0.0125 * _screenSize.height, //8,
                      bottom: 0.028 * _screenSize.height, //18,
                      left: 0.054 * _screenSize.width, //20
                      right: 0.054 * _screenSize.width, //20
                    ),
                    decoration: BoxDecoration(
                      color: MAIN_BLUE_COLOR,
                      borderRadius: BorderRadius.circular(
                        0.011 * _screenSize.width, //4,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text("ورود به جین وست",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 0.0444 * _screenSize.width, //16
                          fontWeight: FontWeight.w500,
                        )))),
          ]),
          Column(
            children: [
              Expanded(flex: 4, child: SizedBox()),
              Expanded(
                flex: 6,
                child: GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                    ),
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              screenSize: _screenSize,
                              navigatorPop: (BuildContext context) =>
                                  Navigator.pop(context),
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
