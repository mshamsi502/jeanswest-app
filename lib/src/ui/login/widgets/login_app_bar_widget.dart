//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/login/svg_images/login_svg_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginAppBarWidget extends StatefulWidget {
  final Function(int, int) updateProp;
  final PanelController keyboardPanelController;
  final PanelController preTelCodePanelController;

  const LoginAppBarWidget({
    Key key,
    this.updateProp,
    this.keyboardPanelController,
    this.preTelCodePanelController,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginAppBarWidgetState();
}

class _LoginAppBarWidgetState extends State<LoginAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar
        Row(
          children: [
            GestureDetector(
              child: Container(
                height: 20,
                width: 20,
                child: context.locale.toString() == 'en_US'
                    ? GlobalSvgImages.leftIcon
                    : GlobalSvgImages.rightIcon,
              ),
              onTap: () {
                widget.keyboardPanelController.close();
                widget.preTelCodePanelController.close();
                widget.updateProp(4, 4);

                // Navigator.pop(context);
              },
            ),
          ],
        ),
        LoginSvgImages.jeanswestLogoIcon,
        // AppBar
      ],
    );
  }
}
