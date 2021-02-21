//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************
import 'package:jeanswest/src/constants/global/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/models/profile/gender/gender.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';

import 'package:jeanswest/src/ui/profile/widgets/global/account_info/select_date_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/select_date_panel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:jeanswest/src/ui/global/widgets/custom_dropdown_button_widget.dart';

import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'account_info/custom_text_field_widget.dart';

class EditInfoWidget extends StatefulWidget {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final Gender gender;
  final String phoneNumber;
  final String dayOfBirth;
  final String monthOfBirth;
  final String yearOfBirth;
  final bool isNew;
  final Function() closePanel;
  final Function(
    String,
    String,
    String,
    String,
    Gender,
    String,
    String,
    String,
  ) confirmInfo;

  const EditInfoWidget({
    Key key,
    this.closePanel,
    this.confirmInfo,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phoneNumber,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
    this.isNew,
  }) : super(key: key);
  State<StatefulWidget> createState() => _EditInfoWidgetState();
}

class _EditInfoWidgetState extends State<EditInfoWidget> {
  PanelController selectDateController = new PanelController();
  TextEditingController firstNameEditingController =
      new TextEditingController();
  TextEditingController lastNameEditingController = new TextEditingController();
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController phoneNumberEditingController =
      new TextEditingController();
  ScrollController scrollController = new ScrollController();
  Gender selectedGender;
  String dayOfBirth;
  String monthOfBirth;
  String yearOfBirth;
  bool isOpeningPanel;
  //
  String selectedGend;
  List<String> genders = new List<String>();

  @override
  void initState() {
    isOpeningPanel = false;
    genders.add(female.perName);
    genders.add(male.perName);
    genders.add(other.perName);
    // setState(() {
    //   firstNameEditingController.text = widget.firstName ?? '';
    //   lastNameEditingController.text = widget.lastName ?? '';
    //   emailEditingController.text = widget.email ?? '';
    //   phoneNumberEditingController.text = widget.phoneNumber ?? '';
    //   dayOfBirth = widget.dayOfBirth ?? '29';
    //   monthOfBirth = widget.monthOfBirth ?? '01';
    //   yearOfBirth = widget.yearOfBirth ?? '1374';
    //   selectedGender = widget.gender ?? male;
    // });
    setState(() {
      firstNameEditingController.text = user.firstName ?? '';
      lastNameEditingController.text = user.lastName ?? '';
      emailEditingController.text = user.email ?? '';
      phoneNumberEditingController.text = user.phoneNumber ?? '';
      dayOfBirth = user.dayOfBirth ?? '29';
      monthOfBirth = user.monthOfBirth ?? '01';
      yearOfBirth = user.yearOfBirth ?? '1374';
      selectedGender = user.gender ?? male;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print('widget.isNew (1 in Build) : ${widget.isNew}');
    print('isOpeningPanel (1 in Build) : $isOpeningPanel');
    if (widget.isNew) {
      setState(() {
        isOpeningPanel = widget.isNew;
        print('widget.isNew (2 in Build) : ${widget.isNew}');
        print('isOpeningPanel (2 in Build) : $isOpeningPanel');
      });
    }

    if (isOpeningPanel) {
      // setState(() {
      //   firstNameEditingController.text = widget.firstName ?? '';
      //   emailEditingController.text = widget.email ?? '';
      //   phoneNumberEditingController.text = widget.phoneNumber ?? '';
      //   dayOfBirth = widget.dayOfBirth ?? '29';
      //   monthOfBirth = widget.monthOfBirth ?? '01';
      //   yearOfBirth = widget.yearOfBirth ?? '1374';
      //   selectedGender = widget.gender ?? male;
      //   isOpeningPanel = false;
      //   print('widget.isNew (3 in Build) : ${widget.isNew}');
      //   print('isOpeningPanel (3 in Build) : $isOpeningPanel');
      //   print('---------------------------------------------');
      //   print('()()()()( selectedGender.perName : ${selectedGender.perName}');
      //   print('()()()()( widget.gender.perName : ${widget.gender.perName}');
      //   print('---------------------------------------------');
      // });
      setState(() {
        firstNameEditingController.text = user.firstName ?? '';
        emailEditingController.text = user.email ?? '';
        phoneNumberEditingController.text = user.phoneNumber ?? '';
        dayOfBirth = user.dayOfBirth ?? '29';
        monthOfBirth = user.monthOfBirth ?? '01';
        yearOfBirth = user.yearOfBirth ?? '1374';
        selectedGender = user.gender ?? male;
        isOpeningPanel = false;
        print('widget.isNew (3 in Build) : ${widget.isNew}');
        print('isOpeningPanel (3 in Build) : $isOpeningPanel');
        print('---------------------------------------------');
        print('()()()()( selectedGender.perName : ${selectedGender.perName}');
        print('()()()()( widget.gender.perName : ${widget.gender.perName}');
        print('---------------------------------------------');
      });
    }
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: SlidingUpPanel(
            controller: selectDateController,
            minHeight: 0,
            maxHeight: 320,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            panel: SelectDatePanelWidget(
              confirmDate: confirmDate,
              dayValue: dayOfBirth,
              monthValue: monthOfBirth,
              yearValue: yearOfBirth,
            ),
            body: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      AppBarWithCloseWidget(
                        title: widget.title,
                        closeOnTap: () => widget.closePanel(),
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: _screenSize.height - 140,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              CustomTextFieldWidget(
                                title: 'نام',
                                isEnable: true,
                                textEditingController:
                                    firstNameEditingController,
                                // initText: widget.firstName ?? 'کاربر',
                                initText: user.firstName ?? 'کاربر',
                              ),
                              SizedBox(height: 20),
                              CustomTextFieldWidget(
                                title: 'نام خانوادگی',
                                isEnable: true,
                                textEditingController:
                                    lastNameEditingController,
                                // initText: widget.firstName ?? 'جدید',
                                initText: user.firstName ?? 'جدید',
                              ),
                              SizedBox(height: 20),
                              CustomTextFieldWidget(
                                title: 'ایمیل',
                                isEnable: true,
                                textEditingController: emailEditingController,
                                initText:
                                    // widget.email ?? 'mshamsi502@gmail.com',
                                    user.email ?? 'mshamsi502@gmail.com',
                              ),
                              SizedBox(height: 20),
                              CustomTextFieldWidget(
                                title: 'شماره تماس',
                                isEnable: false,
                                textEditingController:
                                    phoneNumberEditingController,
                                // initText: widget.phoneNumber ?? '9176509634',
                                initText: user.phoneNumber ?? '9176509634',
                              ),
                              // SizedBox(height: 20),
                              // SelectGenderWidget(
                              //   title: 'جنسیت *',

                              //   // initGender: widget.gender,
                              //   initGender: selectedGender,
                              //   changeSelectedGender: changeSelectedBranch,
                              // ),
                              SizedBox(height: 20),
                              CustomDropdownButtonWidget(
                                  title: 'جنسیت',
                                  titleColor: MAIN_BLUE_COLOR,
                                  hintTitle:
                                      user.gender.perName ?? "انتخاب جنسیت ...",
                                  options: genders,
                                  mediaQuery: MediaQuery.of(context),
                                  selected: (String _selectedGender) =>
                                      setState(() {
                                        selectedGender = (_selectedGender ==
                                                    female.perName ||
                                                _selectedGender ==
                                                    female.engName)
                                            ? female
                                            : (_selectedGender ==
                                                        male.perName ||
                                                    _selectedGender ==
                                                        male.engName)
                                                ? male
                                                : other;
                                      })),
                              SizedBox(height: 20),
                              SelectDateWidget(
                                title: 'تاریخ تولد',
                                yearOfBirth: yearOfBirth,
                                monthOfBirth: monthOfBirth,
                                dayOfBirth: dayOfBirth,
                                openPanel: () {
                                  selectDateController.open();
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 25,
                    left: 25,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: AvakatanButtonWidget(
                              backgroundColor: MAIN_BLUE_COLOR,
                              textColor: Colors.white,
                              borderColor: Colors.transparent,
                              title: 'تایید اطلاعات',
                              height: 40,
                              onTap: () {
                                // ! send to server
                                widget.confirmInfo(
                                  firstNameEditingController.text,
                                  lastNameEditingController.text,
                                  emailEditingController.text,
                                  phoneNumberEditingController.text,
                                  selectedGender,
                                  dayOfBirth,
                                  monthOfBirth,
                                  yearOfBirth,
                                );
                                widget.closePanel();
                              },
                              radius: 5,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  changeSelectedBranch(Gender gender) {
    setState(() {
      selectedGender = gender;
      print(selectedGender.perName);
    });
  }

  confirmDate(bool _isReset, String _dayOfBirth, String _monthOfBirth,
      String _yearOfBirth) {
    print('selected date is : $_yearOfBirth / $_monthOfBirth /  $_dayOfBirth');
    setState(() {
      dayOfBirth = _dayOfBirth;
      monthOfBirth = _monthOfBirth;
      yearOfBirth = _yearOfBirth;
    });
    selectDateController.close();
  }
}
