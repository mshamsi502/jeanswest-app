// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class FiltersButtonWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final int someNumber;
  final IconData arrow;
  final bool isSelected;
  final bool haveSomeActive;
  final Function() clear;

  const FiltersButtonWidget({
    Key key,
    this.icon,
    this.title,
    this.arrow,
    this.isSelected = false,
    this.haveSomeActive = false,
    this.someNumber = 0,
    this.clear,
  }) : super(key: key);
  @override
  _FiltersButtonWidgetState createState() => _FiltersButtonWidgetState();
}

class _FiltersButtonWidgetState extends State<FiltersButtonWidget> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    // var _screenSize = MediaQuery.of(context).size;
    return Container(
      // height: 40,
      decoration: BoxDecoration(
          // color: Colors.blue,
          color: widget.isSelected || widget.haveSomeActive
              ? LIGHT_BLUE_SKY_COLOR
              : Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: widget.isSelected || widget.haveSomeActive
                ? RESOLUTION_BLUE_COLOR
                : Colors.transparent,
          ),
          boxShadow: [
            widget.isSelected || widget.haveSomeActive
                ? BoxShadow()
                : BoxShadow(
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: GREY_FADE_SELECTED_COLOR,
                  )
          ]),

      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      child: Row(
        children: [
          widget.icon == null
              ? SizedBox()
              : Icon(
                  widget.icon,
                  size: 20,
                  color: widget.isSelected || widget.haveSomeActive
                      ? RESOLUTION_BLUE_COLOR
                      : Colors.black,
                ),
          SizedBox(width: 3),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 14,
              color: widget.isSelected || widget.haveSomeActive
                  ? RESOLUTION_BLUE_COLOR
                  : Colors.black,
            ),
          ),
          widget.haveSomeActive
              ? Text(
                  widget.someNumber == 0
                      ? ""
                      : " (${widget.someNumber.toString()})",
                  style: TextStyle(
                    fontSize: 14,
                    color: widget.isSelected || widget.haveSomeActive
                        ? RESOLUTION_BLUE_COLOR
                        : Colors.black,
                  ),
                )
              : SizedBox(),
          widget.haveSomeActive
              ? Row(
                  children: [
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => widget.clear(),
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.blue,
                            color: LIGHT_BLUE_SKY_COLOR,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: RESOLUTION_BLUE_COLOR,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: GREY_FADE_SELECTED_COLOR,
                              )
                            ]),
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: RESOLUTION_BLUE_COLOR,
                        ),
                      ),
                    ),
                  ],
                )
              : widget.arrow == null
                  ? SizedBox()
                  : Icon(
                      widget.arrow,
                      size: 20,
                      color: widget.isSelected || widget.haveSomeActive
                          ? RESOLUTION_BLUE_COLOR
                          : Colors.black,
                    ),
        ],
      ),
    );
  }
}
