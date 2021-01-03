// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AvakatanLabelWidget extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color textFont;
  final double textSize;

  const AvakatanLabelWidget(
      {Key key,
      this.text,
      this.backgroundColor,
      this.textColor,
      this.textFont,
      this.textSize})
      : super(key: key);

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
          color: widget.backgroundColor),
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.textColor,
          fontFamily: 'IRANSansLight',
          fontSize: widget.textSize ?? 8,
        ),
      ),
    );
  }
}
