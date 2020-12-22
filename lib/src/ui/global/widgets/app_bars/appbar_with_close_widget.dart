//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 40,
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
              height: 30,
              width: 30,
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
