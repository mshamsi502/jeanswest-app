//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class InfoWidget extends StatefulWidget {
  final List<dynamic> userData;
  final int selectedOption;
  final Function(int) changeSelectedOptions;

  const InfoWidget({
    Key key,
    this.changeSelectedOptions,
    this.selectedOption,
    this.userData,
  }) : super(key: key);
  State<StatefulWidget> createState() => _InfoWidgetState();
}

class _InfoWidgetState extends State<InfoWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.054 * _screenSize.width, //20
      ),
      child: ListView.builder(
        itemCount: widget.userData[widget.userData.length - 1],
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.008 * _screenSize.height, //5
                ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index == 0
                                ? '${widget.userData[0][0]} و ${widget.userData[1][0]}'
                                : widget.userData[index + 1][0] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 0.034 * _screenSize.width, //12,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 0.008 * _screenSize.height, //5,
                          ),
                          Text(
                            index == 0
                                ? '${widget.userData[0][1]} ${widget.userData[1][1]}'
                                : index == 3
                                    ? (widget.userData[4][1] as int) == 1
                                        ? "مرد"
                                        : "زن"
                                    : index == 4
                                        ? '${widget.userData[5][1]['yearOfBirth']}-${widget.userData[5][1]['monthOfBirth']}-${widget.userData[5][1]['dayOfBirth']}'
                                        : widget.userData[index + 1][1],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 0.038 * _screenSize.width, //14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 0.07 * _screenSize.height, //45,
                        color: Colors.transparent,
                      ),
                    ),
                    widget.userData[index + 1][2] as bool
                        ? SizedBox()
                        : Container(
                            padding: EdgeInsets.only(
                              top: 0.016 * _screenSize.height, //10
                              bottom: 0.016 * _screenSize.height, //10

                              right: 0.027 * _screenSize.width, //10,
                            ),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 0.069 * _screenSize.width, //25,
                              color: Colors.grey,
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 0.016 * _screenSize.height //10
                    ),
                Divider(
                  thickness: 0.00138 * _screenSize.width, //0.5,
                  height: 0.003125 * _screenSize.height, //2,
                ),
                SizedBox(
                  height: 0.008 * _screenSize.height, //5
                ),
              ],
            ),
            onTap: () {
              if (index != 1) {
                widget.changeSelectedOptions(index);
              }
            },
          );
        },
      ),
    );
  }
}
