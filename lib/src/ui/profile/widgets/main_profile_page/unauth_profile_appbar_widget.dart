// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/login/screens/login_page.dart';

class UnauthProfileAppBarWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _UnauthProfileAppBarWidgetState();
}

class _UnauthProfileAppBarWidgetState extends State<UnauthProfileAppBarWidget> {
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
                        'assets/images/png_images/profile/unauth_profile_appbar_background.png'),
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
                                  onTap: () => 
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                      builder: (context) => 
                                    ),
                                  ),
                                ),
                              ),
                            
                    Expanded(flex: 2, child: SizedBox(height: 10)),
                  ],
                ),
              ),
            ],
          ),
          ],
      ),
    );
  }
}
