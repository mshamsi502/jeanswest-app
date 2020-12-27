//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

class ProfileAppBarWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _ProfileAppBarWidgetState();
}

class _ProfileAppBarWidgetState extends State<ProfileAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      height: 300,
      // color: Colors.red,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 30,
                color: Colors.greenAccent,
              ),
              Container(
                height: 190,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
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
            top: 0,
            child: Container(
              width: _screenSize.width,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                color: Colors.grey,
                              ),
                              Text(
                                user.perName,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Expanded(
                              //   child:
                              Container(
                                width: 100,
                                height: 40,
                                color: Colors.redAccent,
                              ),
                              // ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  // color: Colors.redAccent,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: new AssetImage(
                                        'assets/images/png_images/global/jeanswest_logo.png'),
                                  ),
                                ),
                              ),
                              Container(
                                width: 20,
                                height: 40,
                                color: Colors.redAccent,
                              ),
                            ],
                          ),
                          Container(
                            width: 200,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    // width: 20,
                                    height: 40,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                AvakatanButtonWidget(
                                  title: 'نمایش سطح عضویت',
                                  fontSize: 11,
                                  backgroundColor: MAIN_BLUE_COLOR,
                                  textColor: Colors.white,
                                  height: 40,
                                  width: 145,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    // width: 100,
                                    height: 40,
                                    color: Colors.redAccent,
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
                          Container(
                            height: 80,
                            width: 80,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'اگر کارت خود را فراموش کردید میتوانید از اینجا اسکن کنید',
                    style: TextStyle(
                      fontSize: 10,
                      color: MAIN_BLUE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
