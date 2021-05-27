// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class InviteTableWidget extends StatefulWidget {
  final int receivedGift;
  final int someOfInstallFromInvited;
  final int someOfShoppingFromInvited;

  const InviteTableWidget({
    Key key,
    this.receivedGift,
    this.someOfInstallFromInvited,
    this.someOfShoppingFromInvited,
  }) : super(key: key);

  @override
  _InviteTableWidgetState createState() => _InviteTableWidgetState();
}

class _InviteTableWidgetState extends State<InviteTableWidget> {
  bool currentLevelWidgetAnimation = true;
  PanelController editingPanel = PanelController();
  int selectedFriend;
  bool isNew;
  @override
  void initState() {
    selectedFriend = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(
        0.0138 * _screenSize.width, //5
      ),
      color: Color(0x88f2f2f2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.008 * _screenSize.height, //5
                horizontal: 0.0138 * _screenSize.width, //5
              ),
              child: Column(
                children: [
                  Container(
                    height: 0.05468 * _screenSize.height, //35,
                    child: Text(
                      'جایزه های دریافتی من',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 0.027 * _screenSize.width, //10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.008 * _screenSize.height, //5
                  ),
                  Text(
                    toPriceStyle(widget.receivedGift),
                    style: TextStyle(
                      fontSize: 0.038 * _screenSize.width, //14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 0.1093 * _screenSize.height, //70,
            child: VerticalDivider(
              color: Colors.grey,
              // color: MAIN_BLUE_COLOR,
              thickness: 0.00138 * _screenSize.width, //0.5,
              indent: 0.041 * _screenSize.width, //15,
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
                children: [
                  SizedBox(
                    height: 0.05468 * _screenSize.height, //35,
                    child: Text(
                      'دوستانی که از ما خرید کرده اند',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 0.027 * _screenSize.width, //10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.008 * _screenSize.height, //5
                  ),
                  Text(
                    widget.someOfShoppingFromInvited.toString(),
                    style: TextStyle(
                      fontSize: 0.038 * _screenSize.width, //14,
                      color: GREEN_TEXT_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 0.1093 * _screenSize.height, //70,
            child: VerticalDivider(
              color: Colors.grey,
              // color: MAIN_BLUE_COLOR,
              thickness: 0.00138 * _screenSize.width, //0.5,
              indent: 0.041 * _screenSize.width, //15,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 0.05468 * _screenSize.height, //35,
                    child: Text(
                      'دوستانی که اپلیکشن را نصب کرده اند',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 0.027 * _screenSize.width, //10,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.008 * _screenSize.height, //5
                  ),
                  Text(
                    widget.someOfInstallFromInvited.toString(),
                    style: TextStyle(
                      fontSize: 0.038 * _screenSize.width, //14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
