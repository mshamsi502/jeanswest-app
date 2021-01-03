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

  const AppBarWithBackWidget({
    Key key,
    this.title,
    this.option,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AppBarWithBackWidgetState();
}

class _AppBarWithBackWidgetState extends State<AppBarWithBackWidget> {
  double heightBar = 40;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      height: heightBar,
      child: Row(
        children: [
          SizedBox(width: 5),
          GestureDetector(
            child: Container(
              height: heightBar,
              width: heightBar,
              padding: EdgeInsets.all(10),
              child: context.locale.toString() == 'en_US'
                  ? GlobalSvgImages.leftIcon
                  : GlobalSvgImages.rightIcon,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: MAIN_BLUE_COLOR),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
                child: Container(
                  width: 25,
                  height: 25,
                  child: widget.option,
                ),
                onTap: () {},
              ) ??
              Container(),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
