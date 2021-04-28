// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppBarWithBackWidget extends StatefulWidget {
  final String title;
  final Widget option;
  final Function() onTap;

  const AppBarWithBackWidget({
    Key key,
    this.title,
    this.option,
    @required this.onTap,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AppBarWithBackWidgetState();
}

class _AppBarWithBackWidgetState extends State<AppBarWithBackWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: 0.078125 * _screenSize.height, //50,
      width: _screenSize.width,
      child: Row(
        children: [
          Container(
            color: Colors.transparent,
            child: GestureDetector(
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      width: 0.027 * _screenSize.width, //10,
                      height: 0.111 * _screenSize.width, //40,
                    ),
                    Container(
                      height: 0.111 * _screenSize.width, //40,
                      width: 0.111 * _screenSize.width, //40,
                      // padding: EdgeInsets.all(0.016 * _screenSize.height //10
                      //     ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black87,
                        size: 0.069 * _screenSize.width, //25,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: widget.onTap,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                // fontWeight: FontWeight.w600,
                fontSize: 0.05 * _screenSize.width, //18,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 0.016 * _screenSize.height //10
              ),
          GestureDetector(
                child: Container(
                  height: 0.138 * _screenSize.width, //50,
                  width: 0.138 * _screenSize.width, //50,
                  // padding: EdgeInsets.all(
                  //   0.027 * _screenSize.width, //10,
                  // ),
                  child: widget.option,
                ),
                onTap: () {},
              ) ??
              Container(),
          SizedBox(width: 0.016 * _screenSize.height //10
              ),
        ],
      ),
    );
  }
}
