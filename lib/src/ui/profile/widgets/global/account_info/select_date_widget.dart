//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SelectDateWidget extends StatefulWidget {
  final Function openPanel;
  final String title;
  final String dayOfBirth;
  final String monthOfBirth;
  final String yearOfBirth;

  const SelectDateWidget({
    Key key,
    this.title,
    this.openPanel,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
  }) : super(key: key);
  State<StatefulWidget> createState() => _SelectDateWidgetState();
}

class _SelectDateWidgetState extends State<SelectDateWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.054 * _screenSize.width, //20
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 0.038 * _screenSize.width, //14,
            color: MAIN_BLUE_COLOR,
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.054 * _screenSize.width, //20
                ),
                alignment: Alignment.centerRight,
                height: 0.078125 * _screenSize.height, //50,
                margin: EdgeInsets.symmetric(
                  horizontal: 0.027 * _screenSize.width, //10,
                ),
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius:
                      BorderRadius.circular(0.0138 * _screenSize.width //5,

                          ),
                ),
                child: Text(
                  '${widget.yearOfBirth}/${widget.monthOfBirth}/${widget.dayOfBirth}',
                  style: TextStyle(
                    fontSize: 0.038 * _screenSize.width, //14,
                  ),
                ),
              ),
              onTap: () => widget.openPanel(),
            ),
          ),
        ],
      ),
    ]);
  }
}
