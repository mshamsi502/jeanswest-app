//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/test_data/texts.dart';

class QuestionsWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: questionStrings.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            expandedAlignment: Alignment.centerRight,
            title: Text(
              questionStrings[index],
              style: TextStyle(fontSize: 13),
            ),
            children: <Widget>[
              Text(
                answerStrings[index],
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
