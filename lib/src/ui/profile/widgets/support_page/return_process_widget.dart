// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';

class ReturnProcessWidget extends StatefulWidget {
  final String assetHeader;
  final List<Widget> children;

  const ReturnProcessWidget({
    Key key,
    this.assetHeader,
    this.children,
  }) : super(key: key);

  @override
  _ReturnProcessWidgetState createState() => _ReturnProcessWidgetState();
}

class _ReturnProcessWidgetState extends State<ReturnProcessWidget> {
  ScrollController scrollController;
  @override
  void initState() {
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: 0.25 * _screenSize.height, //160,
              margin: EdgeInsets.all(
                0.016 * _screenSize.height, // 10
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: new AssetImage(widget.assetHeader),
                ),
              ),
            ),
            Divider(
              thickness: 0.5,
              color: MAIN_BLUE_COLOR,
              height: 2,
            ),
            SizedBox(
              height: 0.015 * _screenSize.height, //10,
            ),
            ListView.builder(
              itemCount: widget.children.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    widget.children[index],
                    SizedBox(height: 0.0078 * _screenSize.height //5,
                        ),
                  ],
                );
              },
            ),
            Row(
              children: [
                SizedBox(
                  width: 0.027 * _screenSize.width, //10,
                ),
                Icon(
                  Icons.phone,
                  color: MAIN_BLUE_COLOR,
                  size: 0.041 * _screenSize.width, //15,
                ),
                SizedBox(width: 0.0138 * _screenSize.width //5,
                    ),
                Text(
                  '02191070544',
                  style: TextStyle(
                    fontSize: 0.033 * _screenSize.width, //12,
                    color: MAIN_BLUE_COLOR,
                  ),
                )
              ],
            ),
            SizedBox(height: 0.0078 * _screenSize.height //5,
                ),
            Row(
              children: [
                SizedBox(
                  width: 0.027 * _screenSize.width, //10,
                ),
                Icon(
                  Icons.email_outlined,
                  color: MAIN_BLUE_COLOR,
                  size: 0.041 * _screenSize.width, //15,
                ),
                SizedBox(width: 0.0138 * _screenSize.width //5,
                    ),
                Text(
                  'info@banimode.com',
                  style: TextStyle(
                    fontSize: 0.033 * _screenSize.width, //12,
                    color: MAIN_BLUE_COLOR,
                  ),
                )
              ],
            ),
            SizedBox(height: 0.0078 * _screenSize.height //5,
                ),
            Row(
              children: [
                SizedBox(
                  width: 0.027 * _screenSize.width, //10,
                ),
                Icon(
                  Icons.apartment_outlined,
                  color: Colors.black,
                  size: 0.041 * _screenSize.width, //15,
                ),
                SizedBox(width: 0.0138 * _screenSize.width //5,
                    ),
                Text(
                  '1475614566',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                )
              ],
            ),
            SizedBox(
              height: 0.023 * _screenSize.height, //15,
            ),
          ],
        ),
      ),
    );
  }
}
