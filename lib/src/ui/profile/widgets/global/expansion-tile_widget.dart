//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:jeanswest/src/constants/global/colors.dart'; // im

class ExpansionTileWidget extends StatefulWidget {
  final String title;
  final List<String> que;
  final List<String> ans;

  const ExpansionTileWidget({
    Key key,
    this.que,
    this.ans,
    this.title,
  }) : super(key: key);
  State<StatefulWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.027 * _screenSize.width //10
          ),
      child: Column(
        children: [
          widget.title != null
              ? Container(
                  padding: EdgeInsets.only(
                    bottom: 0.015 * _screenSize.height, //10,
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 0.0444 * _screenSize.width, //16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : SizedBox(),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.que.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  ConfigurableExpansionTile(
                    headerExpanded: Expanded(
                      child: Row(
                        children: [
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Icon(
                              Icons.help,
                              color: MAIN_BLUE_COLOR,
                              size: 0.06111 * _screenSize.width, //22,
                            ),
                          ),
                          SizedBox(
                            width: 0.027 * _screenSize.width, //10,
                          ),
                          Expanded(
                            child: Text(
                              widget.que[index],
                              style: TextStyle(
                                  fontSize: 0.036 * _screenSize.width // 13
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    header: Expanded(
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 0.047 * _screenSize.width, //17,
                                height: 0.047 * _screenSize.width, //17,
                                margin: EdgeInsets.all(
                                    (0.0083 * _screenSize.width //3,
                                    )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    0.138 * _screenSize.width, //50,
                                  ),
                                  color: MAIN_BLUE_COLOR,
                                ),
                              ),
                              Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(math.pi),
                                child: Icon(
                                  Icons.help,
                                  color: BLUE_SKY_COLOR,
                                  size: 0.06111 * _screenSize.width, //22,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0.027 * _screenSize.width, //10,
                          ),
                          Expanded(
                            child: Text(
                              widget.que[index],
                              style: TextStyle(
                                  fontSize: 0.036 * _screenSize.width // 13
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    animatedWidgetFollowingHeader: Icon(
                      Icons.chevron_right,
                      color: Colors.grey[600],
                      size: 0.039 * _screenSize.height, //25,
                    ),
                    headerAnimationTween: Tween<double>(begin: 0, end: 0),
                    animatedWidgetTween: Tween<double>(begin: 0, end: -0.5),
                    children: <Widget>[
                      SizedBox(
                        height: 0.0078 * _screenSize.height, //5
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 0.018 * _screenSize.height //12
                            ),
                        alignment: Alignment.centerRight,
                        child: Text(
                          widget.ans[index],
                          style: TextStyle(
                            fontSize: 0.0333 * _screenSize.width, //12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 0.015 * _screenSize.height //10
                          ),
                    ],
                  ),
                  SizedBox(
                    height: 0.0078 * _screenSize.height, //5
                  ),
                  Divider(
                    endIndent: 5,
                    thickness: 0.0016 * _screenSize.height, //1
                  ),
                  SizedBox(
                    height: 0.0078 * _screenSize.height, //5
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
