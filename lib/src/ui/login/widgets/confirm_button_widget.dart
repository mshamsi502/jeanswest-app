//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

class ConfirmButtonWidget extends StatefulWidget {
  final bool check;
  final bool isInputPhoneStep;
  final Function(bool) changeInputPhoneStep;
  final bool hasError;
  final Function(bool) changeHasError;
  final Function() checkCorrectPhone;
  final Function() checkCorrectCode;
  final Function() closePreTelCodePanelController;
  final Function() startDownTimer;
  final Function(int) changeSelectedCodeChar;
  final Function(String, BuildContext) showSnackBarError;

  const ConfirmButtonWidget({
    Key key,
    this.check,
    this.isInputPhoneStep,
    this.changeInputPhoneStep,
    this.hasError,
    this.changeHasError,
    this.checkCorrectPhone,
    this.checkCorrectCode,
    this.closePreTelCodePanelController,
    this.startDownTimer,
    this.changeSelectedCodeChar,
    this.showSnackBarError,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ConfirmButtonWidgetState();
}

class _ConfirmButtonWidgetState extends State<ConfirmButtonWidget> {
  bool _check;
  bool darftCheck;
  checkInput(BuildContext context) {
    print('checking you phone number ...');
    List response = widget.isInputPhoneStep
        ? widget.checkCorrectPhone()
        : widget.checkCorrectCode();
    _check = response[0];
    String _msg = response[1];
    if (widget.isInputPhoneStep) {
      if (_check) {
        widget.changeHasError(false);
        widget.closePreTelCodePanelController();
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
        widget.changeInputPhoneStep(false);
        widget.startDownTimer();
      } else {
        widget.changeHasError(true);
        widget.showSnackBarError(_msg, context);
      }
    } else {
      if (_check) {
        widget.changeHasError(false);
        widget.closePreTelCodePanelController();
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild.unfocus();
        }
        //
        print('Code Is OK...');
      } else {
        widget.changeHasError(true);
        widget.showSnackBarError(_msg, context);
        widget.changeSelectedCodeChar(0);
      }
    }
  }

  @override
  void initState() {
    _check = widget.check;
    darftCheck = widget.check;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (darftCheck != widget.check) {
      darftCheck = widget.check;
      _check = widget.check;
    }
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 0.054 * _screenSize.width, //20
      ),
      child: AvakatanButtonWidget(
          backgroundColor: widget.check ? MAIN_BLUE_COLOR : F7_BACKGROUND_COLOR,
          textColor: widget.check ? Colors.white : Colors.grey,
          borderColor: widget.check ? MAIN_BLUE_COLOR : Colors.grey[100],
          hasShadow: false,
          title: widget.isInputPhoneStep ? 'ارسال کد تایید' : 'ورود',
          height: 0.07 * _screenSize.height, //45,
          width: _screenSize.width,
          fontSize: 0.05 * _screenSize.width, //18,
          radius: 0.011 * _screenSize.width, //4,
          onTap: () {
            print('_isInputPhoneStep : false');
            widget.check ? checkInput(context) : print('Doing Nothing :)');
          }),
    );
  }
}
