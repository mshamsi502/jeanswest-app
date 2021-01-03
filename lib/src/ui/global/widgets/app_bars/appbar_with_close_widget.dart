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
  double heightBar = 40;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: heightBar,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: MAIN_BLUE_COLOR),
          ),
          GestureDetector(
            child: Container(
              height: heightBar,
              width: heightBar,
              padding: EdgeInsets.all(5),
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
