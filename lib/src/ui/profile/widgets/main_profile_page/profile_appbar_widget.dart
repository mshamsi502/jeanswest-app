//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/qr_code_widget.dart';

class ProfileAppBarWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _ProfileAppBarWidgetState();
}

class _ProfileAppBarWidgetState extends State<ProfileAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      // color: Colors.red,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 32,
                // color: Colors.greenAccent,
              ),
              Container(
                height: 210,
                decoration: BoxDecoration(
                  // color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: new AssetImage(
                        'assets/images/png_images/profile/profile_appbar_background.png'),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 155,
            left: 0,
            right: 0,
            child: Divider(
              height: 0.5,
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: _screenSize.width,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  // color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new AssetImage(
                                        'assets/images/png_images/profile/user_profile.png'),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    user.perName,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            // color: Colors.red,
                            width: _screenSize.width - 166,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: 40,
                                    // color: Colors.redAccent,
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    // color: Colors.redAccent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: new AssetImage(
                                          'assets/images/png_images/global/jeanswest_logo.png'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40,
                                    // color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // color: Colors.red,
                            width: _screenSize.width - 166,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40,
                                    // color: Colors.redAccent,
                                  ),
                                ),
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.all(5),
                                  child: AvakatanButtonWidget(
                                    title: 'نمایش سطح عضویت',
                                    fontSize: 11,
                                    backgroundColor: MAIN_BLUE_COLOR,
                                    textColor: Colors.white,
                                    borderColor: MAIN_BLUE_COLOR,
                                    height: 38,
                                    width: 145,
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    height: 40,
                                    // color: Colors.redAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 40,
                          ),
                          QrCodeWidget(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'اگر کارت خود را فراموش کردید میتوانید از اینجا اسکن کنید',
                    style: TextStyle(
                      fontSize: 10,
                      color: MAIN_BLUE_COLOR,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
