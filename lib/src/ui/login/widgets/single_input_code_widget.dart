//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class SingleInputCodeWidget extends StatefulWidget {
  // final FocusNode focusNode;
  final List<FocusNode> focusNode;
  final int selectedChar;
  final String inputCode;
  final bool hasError;
  final int ordinal;
  final Function(int) updateSelectedChar;
  final Function(int, String) updateChar;

  const SingleInputCodeWidget({
    Key key,
    this.selectedChar,
    this.inputCode,
    this.hasError,
    this.updateSelectedChar,
    this.ordinal,
    this.focusNode,
    this.updateChar,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SingleInputCodeWidgetState();
}

class _SingleInputCodeWidgetState extends State<SingleInputCodeWidget> {
  int selected;
  TextEditingController _textEditingController = new TextEditingController();
  @override
  void initState() {
    selected = widget.selectedChar;
    _textEditingController.addListener(() {
      _textEditingController.text == '' || _textEditingController.text == null
          ? print('is empty ----')
          : print('is not empty ----');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        widget.updateSelectedChar(widget.ordinal);
        FocusScope.of(context).requestFocus();
      },
      child: Container(
        width: 0.138 * _screenSize.width, //50,
        height: 0.138 * _screenSize.width, //50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: widget.hasError ? Color(0x15ff1717) : Color(0xfff2f2f2),
          border: Border.all(
            color: widget.selectedChar == widget.ordinal
                ? MAIN_BLUE_COLOR
                : widget.hasError
                    ? RED_ERROR_COLOR
                    : Colors.transparent,
          ),
        ),
        child: Center(
          child: widget.selectedChar == widget.ordinal
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    textDirection: ltrTextDirection,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      // ignore: deprecated_member_use
                      WhitelistingTextInputFormatter(RegExp(r'(^[0-9]{1}$)')),
                    ],
                    onChanged: (String value) {
                      if (value == '' ||
                          value == ' ' ||
                          value == '-' ||
                          value == ',' ||
                          value == '.') {
                        print('isFFFEmpty');
                      } else {
                        // if (value.isEmpty)
                        if (value.length <= 0 ||
                            value == null ||
                            value.isEmpty ||
                            value.startsWith('.'))
                          print('isEmpty');
                        else {
                          print('isNOOTEmpty');
                          print('value is $value');
                        }
                        setState(() {
                          selected = widget.selectedChar;
                        });
                        _textEditingController.clear();
                        widget.updateChar(selected, value);
                        setState(() {
                          if (selected >= 4)
                            selected = 0;
                          else
                            selected++;
                        });
                        widget.focusNode[selected].requestFocus();
                        widget.updateSelectedChar(selected);
                      }
                    },
                    autofocus: widget.ordinal == 0,
                    style: TextStyle(
                      fontSize: 0.047 * _screenSize.width, //17,
                    ),
                    maxLines: 1,
                    controller: _textEditingController,
                    showCursor: true,
                    focusNode: widget.focusNode[widget.ordinal],
                    // focusNode: node,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 0.047 * _screenSize.width, //17,
                        // color: MAIN_BLUE_COLOR,
                      ),
                      hintText: widget.inputCode[widget.ordinal],
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0.015 * _screenSize.height, // 10,
                        horizontal: 0.055 * _screenSize.width, // 20,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                )
              // // //
              : Text(
                  widget.inputCode[widget.ordinal],
                  style: TextStyle(
                      fontSize: 0.0611 * _screenSize.width,
                      color: MAIN_BLUE_COLOR),
                ),
          // //
        ),
      ),
    );
  }
}
