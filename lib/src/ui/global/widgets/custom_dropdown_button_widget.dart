//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

class CustomDropdownButtonWidget extends StatefulWidget {
  final String title;
  final Size screenSize;
  final List<String> options;
  final Function(String) selected;

  const CustomDropdownButtonWidget({
    Key key,
    this.title,
    this.options,
    this.screenSize,
    this.selected,
  }) : super(key: key);
  State<StatefulWidget> createState() => _CustomDropdownButtonWidgetState();
}

class _CustomDropdownButtonWidgetState
    extends State<CustomDropdownButtonWidget> {
  double heightTextField;
  double heightTitle;
  String dropdownValue;
  List<DropdownMenuItem<String>> _dropdownMenuItems;
  @override
  void initState() {
    heightTextField = 20;
    heightTitle = 60;
    _dropdownMenuItems =
        buildDropdownMenuItems(widget.options, widget.screenSize);
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
            height: heightTitle - 35,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: MAIN_BLUE_COLOR,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: widget.screenSize.width,
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              // color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: DropdownButton(
                      value: dropdownValue,
                      hint: Text(
                        "انتخاب دپارتمان ...",
                        style: TextStyle(
                          fontFamily: 'IRANSans',
                        ),
                      ),
                      underline: Container(),
                      icon: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GlobalSvgImages.svgArrowBottom,
                          ],
                        ),
                      ),
                      iconSize: 15,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          widget.selected(dropdownValue);
                        });
                      },
                      // onChanged: null,
                      items: _dropdownMenuItems,
                      // items: null,
                    ),
                  ),
                ),
                // GlobalSvgImages.svgArrowBottom,
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> buildDropdownMenuItems(
      List<String> options, Size _screenSize) {
    List<DropdownMenuItem<String>> items = new List<DropdownMenuItem<String>>();
    for (String string in options) {
      items.add(DropdownMenuItem(
        value: string,
        child: Container(
          width: _screenSize.width - 130,
          child: Row(
            children: [
              Expanded(
                  child: Text(
                string,
                style: TextStyle(
                  fontFamily: 'IRANSans',
                ),
              )),
            ],
          ),
        ),
      ));
    }
    return items;
  }
}
