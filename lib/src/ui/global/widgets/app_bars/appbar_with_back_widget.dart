// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWithBackWidget extends StatefulWidget {
  final String title;
  final double height;
  final Widget option;
  final Function() onTapBack;

  const AppBarWithBackWidget({
    Key key,
    this.title,
    this.option = const SizedBox(),
    @required this.onTapBack,
    this.height = 0.078125, //50,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AppBarWithBackWidgetState();
}

class _AppBarWithBackWidgetState extends State<AppBarWithBackWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      height: widget.height * _screenSize.height,
      width: _screenSize.width,
      child: Row(
        children: [
          Container(
            color: Colors.transparent,
            child: GestureDetector(
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      width: 0.027 * _screenSize.width, //10,
                      height: 0.111 * _screenSize.width, //40,
                    ),
                    Container(
                      height: 0.111 * _screenSize.width, //40,
                      width: 0.111 * _screenSize.width, //40,
                      padding: EdgeInsets.all(0.022 * _screenSize.width //8,

                          ),
                      child: SvgPicture.asset(
                        'assets/images/svg_images/global/new/fi-rr-angle-right.svg',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: widget.onTapBack,
            ),
          ),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                // fontWeight: FontWeight.w600,
                fontSize: 0.05 * _screenSize.width, //18,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 0.016 * _screenSize.height //10
              ),
          widget.option ?? Container(),
          SizedBox(
            width: 0.054 * _screenSize.width, //20
          ),
        ],
      ),
    );
  }
}
