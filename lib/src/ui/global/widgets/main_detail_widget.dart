// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';

class MainDetailWidget extends StatefulWidget {
  final int count;
  final List<String> titles;
  final TextStyle titleStyle;
  final List<String> values;
  final TextStyle valueStyle;

  const MainDetailWidget({
    Key key,
    this.count,
    this.titles,
    this.values,
    this.titleStyle,
    this.valueStyle,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MainDetailWidgetState();
}

class _MainDetailWidgetState extends State<MainDetailWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: 0.093 * _screenSize.height, //60,
      width: _screenSize.width,
      padding: EdgeInsets.all(0.0138 * _screenSize.width //5,

          ),
      margin: EdgeInsets.symmetric(
        horizontal: 0.041 * _screenSize.width, //15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.00625 * _screenSize.height, //4,
        ),
        color: LIGHT_BLUE_SKY_COLOR,
      ),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 0.008 * _screenSize.height, //5
                horizontal: 0.0138 * _screenSize.width, //5
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.titles[0],
                    textAlign: TextAlign.center,
                    style: widget.titleStyle,
                  ),
                  Expanded(
                    child: Text(
                      widget.values[0],
                      overflow: TextOverflow.ellipsis,
                      style: widget.valueStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          widget.titles.length > 1
              ? Expanded(
                  flex: widget.count - 1,
                  child: ListView.builder(
                      itemCount: widget.count - 1,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 0.277 * _screenSize.width, //100,
                          child: Row(
                            children: [
                              Container(
                                height: 0.1093 * _screenSize.height, //70,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  // color: MAIN_BLUE_COLOR,
                                  thickness: 0.00138 * _screenSize.width, //0.5,
                                  indent: 0.023 * _screenSize.height, //15
                                  width: 0.0138 * _screenSize.width, //5
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 0.008 * _screenSize.height, //5
                                    horizontal: 0.0138 * _screenSize.width, //5
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        widget.titles[index + 1],
                                        textAlign: TextAlign.center,
                                        style: widget.titleStyle,
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget.values[index + 1],
                                          overflow: TextOverflow.ellipsis,
                                          style: widget.valueStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              : Container(),
        ],
      ),
    );
  }
}
