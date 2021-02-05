//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginAppBarWidget extends StatefulWidget {
  final TextEditingController phoneTextEditingController;
  final Function(BuildContext) navigatorPop;

  const LoginAppBarWidget({
    Key key,
    this.phoneTextEditingController,
    this.navigatorPop,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginAppBarWidgetState();
}

class _LoginAppBarWidgetState extends State<LoginAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                child: Container(
                  height: 0.054 * _screenSize.width, //20
                  width: 0.054 * _screenSize.width, //20
                  child: context.locale.toString() == 'en_US'
                      ? GlobalSvgImages.leftIcon
                      : GlobalSvgImages.rightIcon,
                ),
                onTap: () {
                  widget.navigatorPop(context);
                  // Navigator.pop(context);
                  // widget.preTelCodePanelController.close();
                },
              ),
            ],
          ),

          Container(
            width: 0.5 * _screenSize.width, //180,
            height: 0.078125 * _screenSize.height, //50,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: new AssetImage(
                  'assets/images/png_images/global/jeanswest_logo.png',
                ),
              ),
            ),
          ),
          // LoginSvgImages.jeanswestLogoIcon,
        ],
      ),
    );
  }
}
