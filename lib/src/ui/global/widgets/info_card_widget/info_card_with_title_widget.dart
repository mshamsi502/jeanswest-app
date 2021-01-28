// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constants.dart';

class InfoCardWithTitleWidget extends StatefulWidget {
  final Widget cover;
  final String title;
  final List<String> text;
  final List<TextStyle> textStyle;
  final List<Widget> icon;
  final TextDirection customDirection;

  InfoCardWithTitleWidget({
    Key key,
    this.text,
    this.customDirection,
    this.icon,
    this.title,
    this.cover,
    this.textStyle,
  }) : super(key: key);

  State<StatefulWidget> createState() => _InfoCardWithTitleWidgetState();
}

class _InfoCardWithTitleWidgetState extends State<InfoCardWithTitleWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(
        0.027 * _screenSize.width, //10,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 0.027 * _screenSize.width, //10,
        vertical: 0.008 * _screenSize.height, //5
      ),
      // height: boxHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: -(0.022 * _screenSize.width //8,
                ),
            blurRadius: 0.036 * _screenSize.width, //13,
            offset: Offset(
              0,
              0.0083 * _screenSize.width, //3,
            ), // changes position of shadow
          ),
        ],
      ),
      child: Directionality(
        textDirection: widget.customDirection,
        // textDirection: ltrTextDirection,
        // textDirection: rtlTextDirection,
        child: Column(
          children: [
            SizedBox(
              height: 0.016 * _screenSize.height, //10
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.cover,
                SizedBox(
                  width: 0.027 * _screenSize.width, //10,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 0.036 * _screenSize.width, //13,
                      fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  textDirection: rtlTextDirection,
                ),
              ],
            ),
            SizedBox(
              height: 0.016 * _screenSize.height, //10
            ),
            ListView.builder(
              itemCount: widget.text.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 0.008 * _screenSize.height, //5
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.icon == null ||
                              index >= widget.icon.length ||
                              widget.icon[index] == null
                          ? Container()
                          : Row(
                              children: [
                                widget.icon[index],
                                SizedBox(width: 0.0138 * _screenSize.width //5,
                                    ),
                              ],
                            ),
                      Expanded(
                        child: Text(
                          widget.text[index],
                          style: widget.textStyle[index] == null
                              ? TextStyle(
                                  fontSize: 0.027 * _screenSize.width, //10,
                                )
                              : widget.textStyle[index],
                          textDirection: rtlTextDirection,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
