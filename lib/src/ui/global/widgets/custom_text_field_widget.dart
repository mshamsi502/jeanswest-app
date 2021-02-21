// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final Color titleColor;
  final int lines;
  final String initText;
  final Color textColor;
  final Color hintTextColor;
  final bool isEnable;
  final MediaQueryData mediaQuery;

  const CustomTextFieldWidget({
    Key key,
    this.textEditingController,
    this.title,
    this.initText,
    this.lines,
    this.mediaQuery,
    this.titleColor = MAIN_BLUE_COLOR,
    this.isEnable = true,
    this.hintTextColor = Colors.grey,
    this.textColor = Colors.black,
  }) : super(key: key);
  State<StatefulWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  double heightTextField;
  double heightTitle;
  @override
  void initState() {
    if (widget.lines != null)
      heightTextField = 0.03125 *
          widget.mediaQuery.size.height // 20
          *
          widget.lines.toInt();
    else
      heightTextField = 0.03125 * widget.mediaQuery.size.height; // 20;
    heightTitle = 0.093 * widget.mediaQuery.size.height; // 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.027 * widget.mediaQuery.size.width, //10,
      ),
      height: heightTextField + heightTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: heightTitle - 0.054 * widget.mediaQuery.size.height, //30
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 0.0388 * widget.mediaQuery.size.width, // 14,
                color: widget.titleColor,
              ),
            ),
          ),
          SizedBox(
            height: 0.0078 * widget.mediaQuery.size.height, // 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(
                  0.0078 * widget.mediaQuery.size.height, // 5,
                ),
              ),
              child: TextField(
                enabled: widget.isEnable,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 0.0388 * widget.mediaQuery.size.width, // 14,
                ),
                maxLines: widget.lines,
                controller: widget.textEditingController,
                showCursor: true,
                decoration: InputDecoration(
                  hintText: widget.initText ?? '',
                  hintStyle: TextStyle(color: widget.hintTextColor),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0.015 * widget.mediaQuery.size.height, // 10,
                    horizontal: 0.055 * widget.mediaQuery.size.width, // 20,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
