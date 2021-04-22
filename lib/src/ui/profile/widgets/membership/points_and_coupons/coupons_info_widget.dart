//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:jeanswest/src/models/coupon/coupon.dart';
import 'package:jeanswest/src/constants/global/colors.dart';

import 'package:flutter/material.dart';

class CouponsInfoWidget extends StatefulWidget {
  final List<Coupon> coupons;
  final ScrollController scrollController;
  final Function(int) openPanel;

  CouponsInfoWidget({
    Key key,
    this.coupons,
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
        return Container(
          width: _screenSize.width,
          // height: 75,
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  width: _screenSize.width,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                                      width: 18,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? MAIN_GOLD_COLOR
                                              : Colors.blueGrey[200],
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    Icon(
                                      Icons.stars,
                                      size: 20,
                                      color: index.isEven
                                          ? Colors.amberAccent[100]
                                          : BLUE_SKY_COLOR,
                                    ),
                                  ],
                                ),
                                // Container(
                                //   width: 20,
                                //   height: 20,
                                //   padding: EdgeInsets.all(1),
                                //   decoration: BoxDecoration(
                                //       color: index.isEven
                                //           ? MAIN_GOLD_COLOR
                                //           : Colors.blueGrey[200],
                                //       borderRadius:
                                //           BorderRadius.circular(50)),
                                //   child: Icon(
                                //     Icons.stars,
                                //     size: 20,
                                //     color: index.isEven
                                //         ? Colors.amberAccent[100]
                                //         : BLUE_SKY_COLOR,
                                //   ),
                                // ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    widget.coupons[index].perName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 7),
                            Row(
                              children: [
                                SizedBox(width: 30),
                                Text(
                                  // '',
                                  'مدت اعتبار از تاریخ ${widget.coupons[index].yearOfStartDate}/${widget.coupons[index].monthOfStartDate}/${widget.coupons[index].dayOfStartDate} تا ${widget.coupons[index].yearOfEndDate}/${widget.coupons[index].monthOfEndDate}/${widget.coupons[index].dayOfEndDate}',
                                  style: TextStyle(
                                    fontSize: 12,
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
                        size: 20,
                      ),
                    ],
                  ),
                ),
                onTap: () => widget.openPanel(index),
              ),
              SizedBox(height: 5),
              index == widget.coupons.length - 1
                  ? SizedBox()
                  : Divider(
                      thickness: 0.5,
                      height: 1,
                    ),
              SizedBox(height: index == widget.coupons.length - 1 ? 0 : 5),
            ],
          ),
        );
      },
      // ),
    );
  }
}
