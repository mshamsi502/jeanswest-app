// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

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
      // padding:
      //     EdgeInsets.symmetric(horizontal: 0.016 * _screenSize.height), //10),
      color: Colors.white,
      height: 0.078125 * _screenSize.height, //50,
      child: Row(
        children: [
          SizedBox(width: 0.008 * _screenSize.height //5
              ),
          GestureDetector(
            child: Container(
              height: 0.0625 * _screenSize.height, //40
              width: 0.0625 * _screenSize.height, //40
              padding: EdgeInsets.all(0.016 * _screenSize.height //10
                  ),
              child: context.locale.toString() == 'en_US'
                  ? GlobalSvgImages.leftIcon
                  : GlobalSvgImages.rightIcon,
            ),
            onTap: widget.onTap,
            // () {
            //   Navigator.pop(context);
            // },
          ),
          SizedBox(width: 0.016 * _screenSize.height //10
              ),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 0.042 * _screenSize.width, //15,
                  color: MAIN_BLUE_COLOR),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 0.016 * _screenSize.height //10
              ),
          GestureDetector(
                child: Container(
                  height: 0.138 * _screenSize.width, //50,
                  width: 0.138 * _screenSize.width, //50,
                  padding: EdgeInsets.all(
                    0.027 * _screenSize.width, //10,
                  ),
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
