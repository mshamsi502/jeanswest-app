// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmptyOrderListWidget extends StatefulWidget {
  const EmptyOrderListWidget({
    Key key,
  }) : super(key: key);
  @override
  _EmptyOrderListWidgetState createState() => _EmptyOrderListWidgetState();
}

class _EmptyOrderListWidgetState extends State<EmptyOrderListWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(
        0.054 * _screenSize.width, //20
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 0.27 * _screenSize.width, //100,
            width: 0.27 * _screenSize.width, //100,
            child: GlobalSvgImages.emptyBox,
          ),
          SizedBox(
            height: 0.031 * _screenSize.height, //20,
          ),
          Text(
            'سفارش فعالی در این بخش موجود نیست',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 0.0444 * _screenSize.width, //16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 0.234 * _screenSize.height, //150,
          ),
        ],
      ),
    );
  }
}
