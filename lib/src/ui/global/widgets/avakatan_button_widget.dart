// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AvakatanButtonWidget extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final bool hasShadow;

  final String title;
  final double height;
  final double width;
  final Widget icon;
  final Function onTap;
  //
  final double radius;
  final double fontSize;

  const AvakatanButtonWidget({
    Key key,
    this.backgroundColor,
    this.textColor,
    this.title,
    this.height = 35,
    this.icon,
    this.width = 35,
    this.radius,
    this.fontSize,
    this.onTap,
    this.borderColor,
    this.hasShadow,
  }) : super(key: key);

  State<StatefulWidget> createState() => _AvakatanButtonWidgetState();
}

class _AvakatanButtonWidgetState extends State<AvakatanButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          boxShadow: <BoxShadow>[
            widget.hasShadow != null && widget.hasShadow
                ? BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 3,
                    color: widget.borderColor ?? Colors.grey[200],
                  )
                : BoxShadow(),
          ],
          border: Border.all(
            color: widget.borderColor ?? Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon ?? Container(),
            widget.title == null || widget.title == ''
                ? Container()
                : SizedBox(
                    width: 5,
                  ),
            widget.title == null || widget.title == ''
                ? Container()
                : Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.textColor, fontSize: widget.fontSize),
                  ),
          ],
        ),
      ),
      onTap: () => widget.onTap(),
    );
  }
}
