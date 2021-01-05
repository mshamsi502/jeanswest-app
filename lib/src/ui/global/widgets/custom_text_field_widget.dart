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
  final int lines;
  final String initText;
  final Size screenSize;

  const CustomTextFieldWidget({
    Key key,
    this.textEditingController,
    this.title,
    this.initText,
    this.lines,
    this.screenSize,
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
          widget.screenSize.height // 20
          *
          widget.lines.toInt();
    else
      heightTextField = 0.03125 * widget.screenSize.height; // 20;
    heightTitle = 0.093 * widget.screenSize.height; // 60;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightTextField + heightTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: heightTitle - 0.054 * widget.screenSize.height, //30
            width: widget.screenSize.width -
                (0.19 * widget.screenSize.width), //70,
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 0.0388 * widget.screenSize.width, // 14,
                color: MAIN_BLUE_COLOR,
              ),
            ),
          ),
          SizedBox(
            height: 0.0078 * widget.screenSize.height, // 5,
          ),
          Expanded(
            child: Container(
              width: widget.screenSize.width -
                  0.19 * widget.screenSize.width, //70,
              decoration: BoxDecoration(
                color: Color(0xfff2f2f2),
                borderRadius: BorderRadius.circular(
                  0.0078 * widget.screenSize.height, // 5,
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                  fontSize: 0.0388 * widget.screenSize.width, // 14,
                ),
                maxLines: widget.lines,
                controller: widget.textEditingController,
                showCursor: true,
                decoration: InputDecoration(
                  hintText: widget.initText ?? '',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 0.015 * widget.screenSize.height, // 10,
                    horizontal: 0.055 * widget.screenSize.width, // 20,
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
