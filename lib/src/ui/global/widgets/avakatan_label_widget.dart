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
    // ignore: unused_local_variable
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        vertical: 0.001689 * _screenSize.height, //1,
        horizontal: 0.0194 * _screenSize.width, //7,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            0.1027 * _screenSize.width, //37,
          ),
          border: Border.all(
            color: widget.borderColor,
            width: 0.00277 * _screenSize.width, //1,
          ),
          color: widget.backgroundColor),
      child: Row(
        children: [
          SizedBox(
              width: widget.text.length < 4
                  ? ((4 - widget.text.length) *
                          (0.0083 * _screenSize.width //3,
                          ))
                      .toDouble()
                  : 0),
          widget.icon ?? SizedBox(),
          SizedBox(
              width: widget.icon != null
                  ? 0.0138 * _screenSize.width //5
                  : 0),
          Column(
            children: [
              SizedBox(
                height: 0.003125 * _screenSize.height, //2,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: widget.textColor,
                    fontWeight: widget.fontWeight,
                    fontFamily: 'IRANSansLight',
                    fontSize: widget.textSize ?? 0.022 * _screenSize.width //8,
                    ),
              ),
            ],
          ),
          SizedBox(
              width: widget.text.length < 4
                  ? ((4 - widget.text.length) *
                          (0.0083 * _screenSize.width //3,
                          ))
                      .toDouble()
                  : 0),
        ],
      ),
    );
  }
}
