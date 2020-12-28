//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';

class SendMessageBarWidget extends StatefulWidget {
  final Function(String) sendText;

  const SendMessageBarWidget({
    Key key,
    this.sendText,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SendMessageBarWidgetState();
}

class _SendMessageBarWidgetState extends State<SendMessageBarWidget> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      color: Colors.white,
      // color: Colors.red,
      height: 60,
      width: _screenSize.width,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 5),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: F7_BACKGROUND_COLOR,
        ),
        child: Row(
          children: [
            GestureDetector(
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(7),
                // color: Colors.grey,
                child: context.locale.toString() == 'en_US'
                    ? ProfileSvgImages.sendToLeftIcon
                    : ProfileSvgImages.sendToRightIcon,
              ),
              onTap: () {
                widget.sendText(textEditingController.text);
                textEditingController.clear();
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'پیام خود را وراد کنید',
                  hintStyle:
                      TextStyle(fontFamily: 'IRANSansLight', fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
