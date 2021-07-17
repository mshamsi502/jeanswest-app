//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/dropDown/custom_dropdown_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditInfoWidget extends StatefulWidget {
  final String text;
  final List<String> titeKeys;
  final List<TextEditingController> editingControllers;
  final List<bool> selectedIsEditable;
  final List<bool> selectedIsDropDown;
  final List<String> dropDownOptions;
  final bool isSelectDate;
  final Function() openSelectDatePanel;

  const EditInfoWidget({
    Key key,
    this.text,
    this.titeKeys,
    this.editingControllers,
    this.selectedIsEditable,
    this.selectedIsDropDown,
    this.dropDownOptions,
    this.isSelectDate,
    this.openSelectDatePanel,
  }) : super(key: key);
  State<StatefulWidget> createState() => _EditInfoWidgetState();
}

class _EditInfoWidgetState extends State<EditInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.027 * _screenSize.width, //10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 0.0444 * _screenSize.width, //16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            ListView.builder(
              itemCount: widget.titeKeys.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 0.031 * _screenSize.height, //20,
                    ),
                    widget.selectedIsDropDown[index]
                        ? CustomDropdownButtonWidget(
                            title: widget.titeKeys[index],
                            hintTitle: widget.editingControllers[index].text,
                            titleColor: Colors.black,
                            options: widget.dropDownOptions,
                            mediaQuery: MediaQuery.of(context),
                            selected: (String _selectedOption, _) {
                              widget.editingControllers[index].text =
                                  _selectedOption;
                            })
                        : GestureDetector(
                            child: CustomTextFieldWidget(
                              title: widget.titeKeys[index],
                              isEnable: widget.selectedIsEditable[index],
                              textEditingController:
                                  widget.editingControllers[index],
                              mediaQuery: MediaQuery.of(context),
                              width: MediaQuery.of(context).size.width,
                              titleColor: Colors.black,
                              textColor: Colors.black,
                              // lines: 1,
                            ),
                            onTap: () {
                              if (widget.isSelectDate)
                                widget.openSelectDatePanel();
                            },
                          ),
                  ],
                );
              },
            ),
          ],
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}
