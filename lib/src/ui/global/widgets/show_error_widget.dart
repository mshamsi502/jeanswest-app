//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    5th October - 05/10/2020     _     13:45:38
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

// ignore: must_be_immutable
class ShowErrorWidget extends StatefulWidget {
  final String errorMsg;
  final String tryAgainText;
  final Function() function;

  const ShowErrorWidget({
    Key key,
    this.errorMsg,
    this.tryAgainText,
    this.function,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShowErrorWidgetState();
}

class ShowErrorWidgetState extends State<ShowErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.errorMsg),
          SizedBox(height: 30),
          AvakatanButtonWidget(
            title: widget.tryAgainText,
            backgroundColor: MAIN_BLUE_COLOR,
            textColor: Colors.white,
            borderColor: MAIN_BLUE_COLOR,
            height: 30,
            width: 120,
            icon: Icon(
              Icons.refresh_outlined,
              color: Colors.white,
            ),
            radius: 4,
            fontSize: 15,
            onTap: () {
              widget.function();
            },
          ),
        ],
      ),
      // ),
    );
  }
}
