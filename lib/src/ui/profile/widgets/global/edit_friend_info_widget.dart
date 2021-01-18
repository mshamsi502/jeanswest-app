//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************
import 'package:jeanswest/src/models/user/gender.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';

import 'package:jeanswest/src/ui/profile/widgets/global/account_info/select_date_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/select_date_panel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'account_info/custom_text_field_widget.dart';

class EditFriendInfoWidget extends StatefulWidget {
  final String title;
  final String name;
  final String dayOfBirth;
  final String monthOfBirth;
  final String yearOfBirth;
  final bool isNew;
  // final Function() closePanel;
  final Function(
    String,
    String,
    String,
    String,
  ) confirmInfo;

  const EditFriendInfoWidget({
    Key key,
    // this.closePanel,
    this.confirmInfo,
    this.title,
    this.name,
    this.dayOfBirth,
    this.monthOfBirth,
    this.yearOfBirth,
    this.isNew,
  }) : super(key: key);
  State<StatefulWidget> createState() => _EditFriendInfoWidgetState();
}

class _EditFriendInfoWidgetState extends State<EditFriendInfoWidget> {
  PanelController selectDateController = new PanelController();
  TextEditingController nameEditingController = new TextEditingController();

  Gender selectedGender;
  String dayOfBirth;
  String monthOfBirth;
  String yearOfBirth;
  bool isOpeningPanel;

  @override
  void initState() {
    isOpeningPanel = false;
    setState(() {
      nameEditingController.text = widget.name ?? '';
      dayOfBirth = widget.dayOfBirth ?? '29';
      monthOfBirth = widget.monthOfBirth ?? '01';
      yearOfBirth = widget.yearOfBirth ?? '1374';
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      setState(() {
        nameEditingController.text = widget.name ?? '';
        dayOfBirth = widget.dayOfBirth ?? '29';
        monthOfBirth = widget.monthOfBirth ?? '01';
        yearOfBirth = widget.yearOfBirth ?? '1374';
        isOpeningPanel = false;
        print('widget.isNew (3 in Build) : ${widget.isNew}');
        print('isOpeningPanel (3 in Build) : $isOpeningPanel');
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarWithCloseWidget(
                        title: widget.title,
                        closeOnTap: () => Navigator.pop(context),
                      ),
                      SizedBox(height: 20),
                      CustomTextFieldWidget(
                        title: 'نام و نام خانوادگی *',
                        textEditingController: nameEditingController,
                        initText: widget.name ?? 'محمد شمسی',
                      ),
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
                        height: 5,
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
                                widget.confirmInfo(
                                  nameEditingController.text,
                                  dayOfBirth,
                                  monthOfBirth,
                                  yearOfBirth,
                                );
                                Navigator.pop(context);
                                // widget.closePanel();
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
