// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

class AppBarWithCloseWidget extends StatefulWidget {
  final String title;
  final Function closeOnTap;

  const AppBarWithCloseWidget({
    Key key,
    this.title,
    this.closeOnTap,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AppBarWithCloseWidgetState();
}

class _AppBarWithCloseWidgetState extends State<AppBarWithCloseWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: 0.0625 * _screenSize.height, //40,
      padding:
          EdgeInsets.symmetric(horizontal: 0.016 * _screenSize.height), //10)
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 0.042 * _screenSize.width, //15,
                color: MAIN_BLUE_COLOR),
            overflow: TextOverflow.ellipsis,
          ),
          GestureDetector(
            child: Container(
              height: 0.0625 * _screenSize.height, //40,
              width: 0.0625 * _screenSize.height, //40,
              padding: EdgeInsets.all(0.0078 * _screenSize.height //5
                  ),
              child: GlobalSvgImages.closeIcon,
            ),
            onTap: () {
              widget.closeOnTap();
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
