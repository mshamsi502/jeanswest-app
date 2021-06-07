// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ****************************************************************************

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DottedBoxInviteHelpWidget extends StatefulWidget {
  @override
  _DottedBoxInviteHelpWidgetState createState() =>
      _DottedBoxInviteHelpWidgetState();
}

class _DottedBoxInviteHelpWidgetState extends State<DottedBoxInviteHelpWidget> {
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
    return Padding(
      padding: EdgeInsets.all(
        0.027 * _screenSize.width, //10,
      ),
      child: DottedBorder(
        color: MAIN_BLUE_COLOR,
        strokeWidth: 0.00277 * _screenSize.width, //1,
        dashPattern: <double>[
          0.027 * _screenSize.width, //10,
          0.0194 * _screenSize.width, //7,
        ],
        child: Padding(
          padding: EdgeInsets.all(
            0.027 * _screenSize.width, //10,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 0.00555 * _screenSize.width, //2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        0.138 * _screenSize.width, //50,
                      ),
                      color: MAIN_ORANGE_COLOR,
                    ),
                    width: 0.05 * _screenSize.width, //18,
                    height: 0.05 * _screenSize.width, //18,
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 0.03 * _screenSize.width, //11
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.027 * _screenSize.width, //10,
                  ),
                  Expanded(
                    child: Text(
                      'لینکو واس دوستت ارسال کن',
                      style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 0.034 * _screenSize.width, //12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.016 * _screenSize.height //10
                  ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 0.00555 * _screenSize.width, //2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        0.138 * _screenSize.width, //50,
                      ),
                      color: MAIN_ORANGE_COLOR,
                    ),
                    width: 0.05 * _screenSize.width, //18,
                    height: 0.05 * _screenSize.width, //18,
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 0.03 * _screenSize.width, //11
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.027 * _screenSize.width, //10,
                  ),
                  Expanded(
                    child: Text(
                      'دوستتو تو اولین خریدش از جین وست همراهی کن',
                      style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 0.034 * _screenSize.width, //12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.016 * _screenSize.height //10
                  ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      top: 0.00555 * _screenSize.width, //2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        0.138 * _screenSize.width, //50,
                      ),
                      color: MAIN_ORANGE_COLOR,
                    ),
                    width: 0.05 * _screenSize.width, //18,
                    height: 0.05 * _screenSize.width, //18,
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 0.03 * _screenSize.width, //11
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 0.027 * _screenSize.width, //10,
                  ),
                  Expanded(
                    child: Text(
                      'بعد از پایان اولین خرید دوستت جایزه جذاب ما برای تو ارسال میشه',
                      style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 0.034 * _screenSize.width, //12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.016 * _screenSize.height //10
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 0.083 * _screenSize.width, //30
                    width: 0.083 * _screenSize.width, //30
                    child: ProfileSvgImages.starIcon,
                  ),
                  SizedBox(
                    width: 0.027 * _screenSize.width, //10,
                  ),
                  Text(
                    'به همین سادگی!',
                    style: TextStyle(
                      color: MAIN_BLUE_COLOR,
                      fontSize: 0.038 * _screenSize.width, //14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 0.0138 * _screenSize.width, //5
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
