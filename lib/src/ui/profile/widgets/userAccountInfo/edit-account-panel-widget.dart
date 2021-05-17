//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/global/widgets/select_date_panel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAccountInfo/edit-info-widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

import 'package:jeanswest/src/constants/global/colors.dart';

class EditAccountPanelWidget extends StatefulWidget {
  final List<dynamic> userData;
  final int selectedUserData;
  final Function() closePanel;
  final Function(
    String,
    String,
    String,
    int,
    String,
    String,
    String,
  ) confirmChanges;

  const EditAccountPanelWidget({
    Key key,
    this.selectedUserData,
    this.closePanel,
    this.confirmChanges,
    this.userData,
  }) : super(key: key);
  State<StatefulWidget> createState() => _EditAccountPanelWidgetState();
}

class _EditAccountPanelWidgetState extends State<EditAccountPanelWidget> {
  PanelController selectDatePanelController;
  int tempselectedUserData;
  //
  TextEditingController firstNameEditingController =
      new TextEditingController();
  TextEditingController lastNameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController genderEditingController = new TextEditingController();
  bool selectedGender;

  TextEditingController yearOfBirthEditingController =
      new TextEditingController();

  TextEditingController monthOfBirthEditingController =
      new TextEditingController();

  TextEditingController dayOfBirthEditingController =
      new TextEditingController();

  TextEditingController dateOfBirthEditingController =
      new TextEditingController();

  //
  String selectedText;
  List<String> selectedTiteKeys;
  List<String> selectedDropDownOptions;
  List<bool> selectedIsEditable;
  List<bool> selectedIsDropDown;
  bool isSelectDate;

  List<TextEditingController> selectedEditingControllers;
  //
  @override
  void initState() {
    selectDatePanelController = PanelController();
    tempselectedUserData = widget.selectedUserData;
    isSelectDate = false;
    //
    firstNameEditingController.text = widget.userData[0][1] as String;
    lastNameEditingController.text = widget.userData[1][1] as String;
    emailEditingController.text = widget.userData[3][1] as String;
    selectedGender = widget.userData[4][1] as bool;
    genderEditingController.text = selectedGender == null
        ? 'انتخاب کنید ...'
        : selectedGender
            ? "مرد"
            : "زن";

    yearOfBirthEditingController.text =
        widget.userData[5][1]['yearOfBirth'] as String;
    monthOfBirthEditingController.text =
        widget.userData[5][1]['monthOfBirth'] as String;
    dayOfBirthEditingController.text =
        widget.userData[5][1]['dayOfBirth'] as String;
    dateOfBirthEditingController.text =
        '${yearOfBirthEditingController.text}-${monthOfBirthEditingController.text}-${dayOfBirthEditingController.text}';

    //
    editedSelectedOption();

    super.initState();
  }

  void editedSelectedOption() {
    setState(() {
      switch (widget.selectedUserData) {
        case 0:
          {
            selectedText = 'نام و نام خانوادگی خود را وارد کنید :';
            selectedTiteKeys = [widget.userData[0][0], widget.userData[1][0]];
            selectedEditingControllers = [
              firstNameEditingController,
              lastNameEditingController
            ];
            selectedIsDropDown = [false, false];
            selectedIsEditable = [true, true];
            selectedDropDownOptions = [];
            isSelectDate = false;
          }
          break;

        case 2:
          {
            selectedText = 'ایمیل خود را وارد کنید :';
            selectedTiteKeys = [widget.userData[3][0]];
            selectedEditingControllers = [
              emailEditingController,
            ];
            selectedIsDropDown = [false];
            selectedIsEditable = [true];
            selectedDropDownOptions = [];
            isSelectDate = false;
          }
          break;
        case 3:
          {
            selectedText = 'جنسیت خود را انتخاب کنید :';
            selectedTiteKeys = [widget.userData[4][0]];
            selectedEditingControllers = [genderEditingController];
            selectedIsDropDown = [true];
            selectedIsEditable = [false];
            selectedDropDownOptions = ['زن', 'مرد'];
            isSelectDate = false;
          }
          break;
        case 4:
          {
            selectedText = 'تاریخ تولد خود را وارد کنید :';
            selectedTiteKeys = [widget.userData[5][0]];
            selectedEditingControllers = [dateOfBirthEditingController];

            selectedIsDropDown = [false];
            selectedIsEditable = [false];
            selectedDropDownOptions = [];
            isSelectDate = true;
          }
          break;
      }
    });
  }

  confirmBirthDate() {}

  @override
  Widget build(BuildContext context) {
    if (widget.selectedUserData != tempselectedUserData)
      setState(() {
        selectDatePanelController.close();
        editedSelectedOption();
        tempselectedUserData = widget.selectedUserData;
      });
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height,
      width: _screenSize.width,
      color: Colors.white,
      child: SlidingUpPanel(
        color: Colors.transparent,
        controller: selectDatePanelController,
        minHeight: 0,
        maxHeight: 0.6081 * _screenSize.height, //360,
        panel: SelectDatePanelWidget(
          title: 'انتخاب تاریخ تولد',
          dayValue: dayOfBirthEditingController.text,
          monthValue: monthOfBirthEditingController.text,
          yearValue: yearOfBirthEditingController.text,
          confirmDate: (bool _isResrt, String _dayOfBirth, String _monthOfBirth,
              String _yearOfBirth) {
            setState(() {
              dayOfBirthEditingController.text = _dayOfBirth;
              monthOfBirthEditingController.text = _monthOfBirth;
              yearOfBirthEditingController.text = _yearOfBirth;
            });
            dateOfBirthEditingController.text =
                '${yearOfBirthEditingController.text}-${monthOfBirthEditingController.text}-${dayOfBirthEditingController.text}';
            editedSelectedOption();
            selectDatePanelController.close();
          },
          closePanel: () => selectDatePanelController.close(),
        ),
        body: Column(
          children: [
            AppBarWithCloseWidget(
              title: '',
              closeOnTap: () => widget.closePanel(),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.027 * _screenSize.width, //10,
              ),
              height: _screenSize.height -
                  (0.2364 * _screenSize.height //140,
                  ),
              color: Colors.white,
              child: EditInfoWidget(
                text: selectedText,
                titeKeys: selectedTiteKeys,
                selectedIsDropDown: selectedIsDropDown,
                selectedIsEditable: selectedIsEditable,
                dropDownOptions: selectedDropDownOptions,
                editingControllers: selectedEditingControllers,
                isSelectDate: isSelectDate,
                openSelectDatePanel: () => selectDatePanelController.open(),
              ),
            ),
            AvakatanButtonWidget(
              backgroundColor: MAIN_BLUE_COLOR,
              textColor: Colors.white,
              borderColor: Colors.transparent,
              title: 'تایید اطلاعات',
              height: 0.0625 * _screenSize.height, //40
              width: _screenSize.width -
                  (0.111 * _screenSize.width //40,
                  ),
              onTap: () {
                widget.confirmChanges(
                  firstNameEditingController.text,
                  lastNameEditingController.text,
                  emailEditingController.text,
                  int.parse(genderEditingController.text),
                  dayOfBirthEditingController.text,
                  monthOfBirthEditingController.text,
                  yearOfBirthEditingController.text,
                );
                widget.closePanel();
              },
              radius: 0.0138 * _screenSize.width, //5
              fontSize: 0.038 * _screenSize.width, //14,
            ),
          ],
        ),
      ),
    );
  }
}
