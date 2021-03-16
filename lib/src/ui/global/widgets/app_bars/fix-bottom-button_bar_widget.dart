// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

class FixBottomButtonBarWidget extends StatefulWidget {
  final String title;
  final Function() bottomButtonFunction;

  const FixBottomButtonBarWidget({
    Key key,
    this.bottomButtonFunction,
    this.title,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FixBottomButtonBarWidgetState();
}

class _FixBottomButtonBarWidgetState extends State<FixBottomButtonBarWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      height: 0.12162 * _screenSize.height, //72
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 0.0083 * _screenSize.width, //3,
            spreadRadius: 0.00555 * _screenSize.width, //2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.054 * _screenSize.width, //20
          vertical: 0.0287 * _screenSize.height, //17
        ),
        child: AvakatanButtonWidget(
          backgroundColor: MAIN_BLUE_COLOR,
          textColor: Colors.white,
          title: widget.title,
          radius: 0.0138 * _screenSize.width, //5,
          fontSize: 0.041 * _screenSize.width, //15,
          borderColor: MAIN_BLUE_COLOR,
          onTap: () => widget.bottomButtonFunction(),
        ),
      ),
    );
  }
}
