//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:avakatan_profile/src/constants/constants.dart';
import 'package:avakatan_profile/src/models/country/country.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginBodyWidget extends StatefulWidget {
  final PanelController keyboardPanelController;
  final bool keyboardIsOpen;
  final PanelController preTelCodePanelController;
  final String inputPhone;
  final bool hasError;
  final Country selectedCountry;

  const LoginBodyWidget({
    Key key,
    this.keyboardPanelController,
    this.keyboardIsOpen,
    this.preTelCodePanelController,
    this.inputPhone,
    this.hasError,
    this.selectedCountry,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  String hintPhone = '9125432778';

  @override
  void initState() {
    super.initState();
    openInitKeyboard();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "login_screen.enter_your_phone_number".tr(),
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          height: 60,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.hasError ? Color(0x15ff1717) : Color(0xfff2f2f2),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: widget.hasError ? Colors.red : Color(0xfff2f2f2),
            ),
          ),
          child: Directionality(
            textDirection: rtlTextDirection,
            child: Row(
              children: [
                // GestureDetector(
                //   child: Container(
                //     padding: EdgeInsets.all(7),
                //     height: 30,
                //     width: 30,
                //     child:
                //         GlobalSvgImages.clearTextFieldIcon,
                //   ),
                //   onTap: () {
                //     setState(() {
                //       inputPhone = '';
                //     });
                //   },
                // ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.inputPhone == '' ? hintPhone : widget.inputPhone,
                        style: TextStyle(
                          fontSize: 18,
                          color: widget.inputPhone == ''
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        widget.preTelCodePanelController.close();
                        widget.keyboardPanelController.open();
                      });
                    },
                  ),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                      children: [
                        Directionality(
                            textDirection: ltrTextDirection,
                            child: Text(
                              widget.selectedCountry.dialCode,
                              style: TextStyle(
                                fontSize: 18,
                                color: MAIN_BLUE_COLOR,
                              ),
                            )),
                        Icon(
                          Icons.phone,
                          color: MAIN_BLUE_COLOR,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      widget.keyboardPanelController.close();
                      widget.preTelCodePanelController.open();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          height:
              // keyboardPanelController.isPanelOpen ? 150 : 0,
              widget.keyboardIsOpen ? 250 : 0,
        ),
      ],
    );
  }

  void openInitKeyboard() async {
    if (mounted)
      setState(() {
        widget.keyboardPanelController.close();
      });
    await Future.delayed(Duration(milliseconds: 500));
    if (mounted)
      setState(() {
        widget.keyboardPanelController.open();
      });
  }
}
