//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AvakatanButtonWidget extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

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
    this.height,
    this.icon,
    this.width,
    this.radius,
    this.fontSize,
    this.onTap,
    this.borderColor,
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
          color: widget.backgroundColor,
          border: Border.all(
            color: widget.borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon != null
                ? widget.icon
                // ? Icon(
                //     widget.icon,
                //     color: widget.textColor,
                //     size: 16,
                //   )
                : Container(),
            widget.title != ''
                ? SizedBox(
                    width: 5,
                  )
                : Container(),
            widget.title != ''
                ? Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.textColor, fontSize: widget.fontSize),
                  )
                : Container(),
          ],
        ),
      ),
      onTap: () => widget.onTap(),
    );
  }
}
