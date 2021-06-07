// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';

class SendMessageBarWidget extends StatefulWidget {
  final Function(String) sendText;
  final String hintText;
  final bool isEnable;
  final String disableText;

  const SendMessageBarWidget({
    Key key,
    this.sendText,
    this.hintText,
    this.isEnable,
    this.disableText,
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
      padding: EdgeInsets.symmetric(
        horizontal: 0.027 * _screenSize.width, //10,
        vertical: 0.0046 * _screenSize.height, //3,
      ),
      color: Colors.white,
      height: 0.093 * _screenSize.height, //60,
      width: _screenSize.width,
      child: Container(
        margin: EdgeInsets.all(
          0.013 * _screenSize.width, //5
        ),
        padding: EdgeInsets.only(right: 15, left: 5),
        height: 0.0625 * _screenSize.height, //40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            0.019 * _screenSize.width, //7
          ),
          color: F7_BACKGROUND_COLOR,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabled: widget.isEnable,
                  // contentPadding:
                  // EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  hintText:
                      widget.isEnable ? widget.hintText : widget.disableText,
                  hintStyle: TextStyle(
                      fontFamily: 'IRANSansLight',
                      fontSize: 0.038 * _screenSize.width, //14,
                      color: Colors.grey[700]),
                ),
              ),
            ),
            SizedBox(
              width: 0.027 * _screenSize.width, //10,
            ),
            GestureDetector(
              child: Container(
                  height: 0.0625 * _screenSize.height, //40,
                  width: 0.0625 * _screenSize.height, //40,
                  padding: EdgeInsets.all(
                    0.019 * _screenSize.width, //7
                  ),
                  child: widget.isEnable
                      ? ProfileSvgImages.blueSendToLeftIcon
                      //  ProfileSvgImages.blueSendToRightIcon
                      : ProfileSvgImages.greySendToLeftIcon
                  // : ProfileSvgImages.greySendToRightIcon,
                  ),
              onTap: () {
                if (widget.isEnable) {
                  widget.sendText(textEditingController.text);
                  textEditingController.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
