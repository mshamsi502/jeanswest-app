//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/profile/gender/gender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SelectGenderWidget extends StatefulWidget {
  final String title;
  final Gender initGender;
  final Function(Gender) changeSelectedGender;

  State<StatefulWidget> createState() => _SelectGenderWidgetState();
  const SelectGenderWidget({
    Key key,
    this.title,
    this.changeSelectedGender,
    this.initGender,
  }) : super(key: key);
}

class _SelectGenderWidgetState extends State<SelectGenderWidget> {
  int _value;

  @override
  void initState() {
    if (widget.initGender != null)
      print('1111111 : ${widget.initGender.perName}');
    if (widget.initGender == male)
      _value = 0;
    else if (widget.initGender == female)
      _value = 1;
    else if (widget.initGender == other) _value = 2;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.initGender == male && _value != 0) {
      _value = 0;
    } else if (widget.initGender == female && _value != 1) {
      _value = 1;
    } else if (widget.initGender == other && _value != 2) {
      _value = 2;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
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
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xfff2f2f2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      activeColor: MAIN_BLUE_COLOR,
                      value: 0,
                      groupValue: _value,
                      onChanged: (int value) {
                        setState(() {
                          _value = value;
                        });
                        widget.changeSelectedGender(male);
                      }),
                  Text(
                    male.perName,
                    style: TextStyle(color: MAIN_BLUE_COLOR, fontSize: 12),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      activeColor: MAIN_BLUE_COLOR,
                      value: 1,
                      groupValue: _value,
                      onChanged: (int value) {
                        setState(() {
                          _value = value;
                        });
                        widget.changeSelectedGender(female);
                      }),
                  Text(
                    female.perName,
                    style: TextStyle(color: MAIN_BLUE_COLOR, fontSize: 12),
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                      activeColor: MAIN_BLUE_COLOR,
                      value: 2,
                      groupValue: _value,
                      onChanged: (int value) {
                        setState(() {
                          _value = value;
                        });
                        widget.changeSelectedGender(other);
                      }),
                  Text(
                    other.perName,
                    style: TextStyle(color: MAIN_BLUE_COLOR, fontSize: 12),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
