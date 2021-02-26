// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:jeanswest/src/constants/global/colors.dart';

class AvakatanLabelWidget extends StatefulWidget {
  final String text;
  final Widget icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color textFont;
  final double textSize;
  final FontWeight fontWeight;

  const AvakatanLabelWidget({
    Key key,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.textFont,
    this.textSize,
    this.borderColor = MAIN_BLUE_COLOR,
    this.fontWeight = FontWeight.w400,
    this.icon,
  }) : super(key: key);

  State<StatefulWidget> createState() => _AvakatanLabelWidgetState();
}

class _AvakatanLabelWidgetState extends State<AvakatanLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(37),
          border: Border.all(
            color: widget.borderColor,
          ),
          color: widget.backgroundColor),
      child: Row(
        children: [
          SizedBox(
              width: widget.text.length < 4
                  ? ((4 - widget.text.length) * 3).toDouble()
                  : 0),
          widget.icon ?? SizedBox(),
          SizedBox(width: widget.icon != null ? 5 : 0),
          Column(
            children: [
              SizedBox(height: 2),
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.textColor,
                  fontWeight: widget.fontWeight,
                  fontFamily: 'IRANSansLight',
                  fontSize: widget.textSize ?? 8,
                ),
              ),
              // SizedBox(height: 1),
            ],
          ),
          SizedBox(
              width: widget.text.length < 4
                  ? ((4 - widget.text.length) * 3).toDouble()
                  : 0),
        ],
      ),
    );
  }
}
