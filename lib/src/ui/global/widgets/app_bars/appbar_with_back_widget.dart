//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

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
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: 20,
              width: 20,
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
          Text(
            widget.title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: MAIN_BLUE_COLOR),
          ),
          Expanded(child: SizedBox()),
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
