//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';

import 'package:jeanswest/src/constants/global/constValues/colors.dart';

import 'package:flutter/material.dart';
import 'package:jeanswest/src/models/profile/user/user-copouns-info.dart';

class CouponsInfoWidget extends StatefulWidget {
  final List<UserCouponsInfo> coupons;
  final ScrollController scrollController;
  final Function(int) openPanel;

  CouponsInfoWidget({
    Key key,
    this.coupons = const [],
    this.scrollController,
    this.openPanel,
  }) : super(key: key);

  State<StatefulWidget> createState() => _CouponsInfoWidgetState();
}

class _CouponsInfoWidgetState extends State<CouponsInfoWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return
        // Container(
        //   height: 300,
        //   child:

        ListView.builder(
      controller: widget.scrollController,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.coupons.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        String usingDate = "مدت اعتبار ";
        usingDate = (widget.coupons[index].startDate == null)
            ? usingDate
            : (usingDate +
                "از ${widget.coupons[index].startYearShamsi}/${widget.coupons[index].startMonthShamsi ?? ""}/${widget.coupons[index].startDayShamsi ?? ""} ");
        usingDate = (widget.coupons[index].expirationDate == null)
            ? usingDate
            : (usingDate +
                "تا ${widget.coupons[index].endYearShamsi}/${widget.coupons[index].endMonthShamsi ?? ""}/${widget.coupons[index].endDayShamsi ?? ""}");

        return Container(
          width: _screenSize.width,
          // height: 75,
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  width: _screenSize.width,
                  padding: EdgeInsets.symmetric(
                      horizontal: 0.054 * _screenSize.width, //20
                      vertical: 0.0078 * _screenSize.height //5,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 0.05 * _screenSize.width, //18,
                                      height: 0.05 * _screenSize.width, //18,
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? MAIN_GOLD_COLOR
                                              : Colors.blueGrey[200],
                                          borderRadius: BorderRadius.circular(
                                            0.138 * _screenSize.width, //50,
                                          )),
                                    ),
                                    Icon(
                                      Icons.stars,
                                      size: 0.054 * _screenSize.width, //20
                                      color: index.isEven
                                          ? Colors.amberAccent[100]
                                          : BLUE_SKY_COLOR,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 0.027 * _screenSize.width, //10,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.coupons[index].promotionPoint.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 0.038 * _screenSize.width, //14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.011824 * _screenSize.height, //7,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 0.083 * _screenSize.width, //30
                                ),
                                Text(
                                  usingDate,
                                  style: TextStyle(
                                    fontSize: 0.0333 * _screenSize.width, //12,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.info_outline,
                        size: 0.054 * _screenSize.width, //20
                      ),
                    ],
                  ),
                ),
                onTap: () => widget.openPanel(index),
              ),
              SizedBox(height: 0.0078 * _screenSize.height //5,
                  ),
              index == widget.coupons.length - 1
                  ? SizedBox()
                  : Divider(
                      thickness: 0.5,
                      height: 1,
                    ),
              SizedBox(
                  height: index == widget.coupons.length - 1
                      ? 0
                      : 0.0078 * _screenSize.height //5,
                  ),
            ],
          ),
        );
      },
      // ),
    );
  }
}
