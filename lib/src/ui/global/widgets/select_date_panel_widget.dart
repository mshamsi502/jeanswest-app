//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDatePanelWidget extends StatefulWidget {
  final Function(bool, String, String, String) confirmDate;
  // final Function closePanel;
  final String dayValue;
  final String monthValue;
  final String yearValue;
  // final bool isReset;
  // final bool isConfirming;

  const SelectDatePanelWidget({
    Key key,
    this.confirmDate,
    // this.closePanel,
    this.dayValue,
    this.monthValue,
    this.yearValue,
    // this.isReset,
    // this.isConfirming,
  }) : super(key: key);

  State<StatefulWidget> createState() => _SelectDatePanelWidgetState();
}

class _SelectDatePanelWidgetState extends State<SelectDatePanelWidget> {
  ScrollController yearScrollController;
  ScrollController monthScrollController;
  ScrollController dayScrollController;
  List<String> month = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];
  String _dayValue;
  String _monthValue;
  String _yearValue;
  int someDayOfMonth = 31;

  GlobalKey yearKey;

  @override
  void initState() {
    _dayValue = widget.dayValue;
    _monthValue = widget.monthValue;
    _yearValue = widget.yearValue;
    //
    yearScrollController = new FixedExtentScrollController(
        initialItem: int.parse(_yearValue.substring(2)));
    monthScrollController = new FixedExtentScrollController(
        initialItem: int.parse(_monthValue) - 1);
    dayScrollController =
        new FixedExtentScrollController(initialItem: int.parse(_dayValue) - 1);
    //

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            height: 0.5 * _screenSize.height, //320,
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.039 * _screenSize.height, //25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 0.027 * _screenSize.width, //10,
                        ),
                        Expanded(
                          child: Container(
                            height: 0.3125 * _screenSize.height, //200
                            // color: Colors.amberAccent,
                            alignment: Alignment.bottomCenter,
                            child: CupertinoPicker(
                              offAxisFraction: 0.0,
                              diameterRatio: 0.27 * _screenSize.width, //100,
                              squeeze: 1,
                              itemExtent: 0.111 * _screenSize.width, //40,
                              scrollController: dayScrollController,
                              // selectionOverlay: Container(
                              //   height: 40,
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     color: Colors.transparent,
                              //     border: Border.symmetric(
                              //       horizontal: BorderSide(
                              //         width: 2,
                              //         color: Color(0x882c3d73),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              children: [
                                for (var i = 0; i < someDayOfMonth; i++)
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            0.0125 * _screenSize.height, //8,
                                      ),
                                      Text(
                                        (i + 1).toString().length == 1
                                            ? '0${(i + 1).toString()}'
                                            : (i + 1).toString(),
                                        style: TextStyle(
                                          fontSize:
                                              0.0444 * _screenSize.width, //16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'IRANSans',
                                          color: MAIN_BLUE_COLOR,
                                        ),
                                      ),
                                      Container(
                                        height: 0.008 * _screenSize.height, //5
                                      ),
                                    ],
                                  )
                              ],
                              onSelectedItemChanged: (int value) {
                                setState(() {
                                  _dayValue = (value + 1).toString().length == 1
                                      ? '0${(value + 1).toString()}'
                                      : (value + 1).toString();
                                });
                                print('day is : $_dayValue');
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.027 * _screenSize.width, //10,
                        ),
                        Expanded(
                          child: Container(
                            height: 0.3125 * _screenSize.height, //200
                            // color: Colors.amberAccent,
                            alignment: Alignment.bottomCenter,
                            child: CupertinoPicker(
                              offAxisFraction: 0.0,
                              diameterRatio: 0.27 * _screenSize.width, //100,
                              squeeze: 1,
                              itemExtent: 0.111 * _screenSize.width, //40,
                              scrollController: monthScrollController,
                              // selectionOverlay: Container(
                              //   height: 40,
                              //   alignment: Alignment.center,
                              //   decoration: BoxDecoration(
                              //     color: Colors.transparent,
                              //     border: Border.symmetric(
                              //       horizontal: BorderSide(
                              //         width: 2,
                              //         color: Color(0x882c3d73),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              children: [
                                for (var i = 0; i < month.length; i++)
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            0.0125 * _screenSize.height, //8,
                                      ),
                                      Text(
                                        month[i],
                                        style: TextStyle(
                                          fontSize:
                                              0.0444 * _screenSize.width, //16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'IRANSans',
                                          color: MAIN_BLUE_COLOR,
                                        ),
                                      ),
                                      Container(
                                        height: 0.008 * _screenSize.height, //5
                                      ),
                                    ],
                                  )
                              ],
                              onSelectedItemChanged: (int value) {
                                setState(
                                  () {
                                    _monthValue =
                                        (value + 1).toString().length == 1
                                            ? '0${(value + 1).toString()}'
                                            : (value + 1).toString();
                                    if (value >= 0 && value <= 5)
                                      someDayOfMonth = 31;
                                    else
                                      someDayOfMonth = 30;
                                  },
                                );
                                print('month is : $_monthValue');
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.027 * _screenSize.width, //10,
                        ),
                        Expanded(
                          child: Container(
                            height: 0.3125 * _screenSize.height, //200
                            alignment: Alignment.bottomCenter,
                            child: CupertinoPicker(
                              offAxisFraction: 0.0,
                              diameterRatio: 0.27 * _screenSize.width, //100,
                              squeeze: 1,
                              itemExtent: 0.111 * _screenSize.width, //40,
                              scrollController: yearScrollController,
                              // selectionOverlay: Column(
                              //   children: [
                              //     Container(
                              //       height: 40,
                              //       alignment: Alignment.center,
                              //       decoration: BoxDecoration(
                              //         color: Colors.transparent,
                              //         border: Border.symmetric(
                              //           horizontal: BorderSide(
                              //             width: 2,
                              //             color: Color(0x882c3d73),
                              //           ),
                              //         ),
                              //       ),
                              //     ),
                              // Container(
                              //   color: Colors.white,
                              //   height: 10,
                              // ),
                              // ],
                              // ),
                              children: [
                                for (var i = 1300; i < 1401; i++)
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            0.0125 * _screenSize.height, //8,
                                      ),
                                      Text(
                                        i.toString(),
                                        style: TextStyle(
                                          fontSize:
                                              0.0444 * _screenSize.width, //16,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'IRANSans',
                                          color: MAIN_BLUE_COLOR,
                                        ),
                                      ),
                                      // ),
                                      Container(
                                        height: 0.008 * _screenSize.height, //5
                                      ),
                                    ],
                                  )
                              ],
                              onSelectedItemChanged: (int value) {
                                setState(() {
                                  _yearValue = (1300 + value).toString();
                                  print('years is : $_yearValue');
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0.027 * _screenSize.width, //10,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0.016 * _screenSize.height, //10
                  //  0.03125 * _screenSize.height, //20
                  right: 0.069 * _screenSize.width, //25,
                  left: 0.069 * _screenSize.width, //25,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(
                      vertical: 0.03125 * _screenSize.height, //20
                      horizontal: 0.027 * _screenSize.width, //10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: AvakatanButtonWidget(
                            backgroundColor: MAIN_BLUE_COLOR,
                            textColor: Colors.white,
                            borderColor: Colors.transparent,
                            title: 'انجام شد',
                            height: 0.0625 * _screenSize.height, //40
                            onTap: () {
                              // widget.closePanel();
                              widget.confirmDate(
                                  false, _dayValue, _monthValue, _yearValue);

                              print('widget.year : ${widget.yearValue}');
                              print('_year : $_yearValue');
                              // _dayValue = widget.dayValue;
                              // _monthValue = widget.monthValue;
                              // _yearValue = widget.yearValue;
                            },
                            radius: 0.008 * _screenSize.height, //5
                            fontSize: 0.038 * _screenSize.width, //14,
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
    );
  }
}
