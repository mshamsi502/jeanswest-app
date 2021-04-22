//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/coupon/coupon.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';

class CopounDetailPanelWidget extends StatefulWidget {
  final Coupon coupon;
  final Function() closePanel;

  const CopounDetailPanelWidget({
    Key key,
    this.coupon,
    this.closePanel,
  }) : super(key: key);

  State<StatefulWidget> createState() => _CopounDetailPanelWidgetState();
}

class _CopounDetailPanelWidgetState extends State<CopounDetailPanelWidget> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.027 * _screenSize.width, //10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            0.03 * _screenSize.width, //11
          ),
          topRight: Radius.circular(
            0.03 * _screenSize.width, //11
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.016 * _screenSize.height //10
              ),
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.coupon.perName,
                  style: TextStyle(
                    fontSize: 0.0444 * _screenSize.width, //16,
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(
                    0.0138 * _screenSize.width, //5
                  ),
                  child: Icon(
                    Icons.close,
                    size: 0.069 * _screenSize.width, //25,
                    color: Colors.black,
                  ),
                ),
                onTap: () => widget.closePanel(),
              ),
            ],
          ),
          SizedBox(
            height: 0.023 * _screenSize.height, //15
          ),
          Container(
            height: 170,
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  ListView.builder(
                    controller: scrollController,
                    itemCount: widget.coupon.description.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 10),
                          Container(
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MAIN_BLUE_COLOR,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: Text(
                            widget.coupon.description[index],
                            style: TextStyle(fontSize: 12),
                          )),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Colors.red,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                          '${toPriceStyle(widget.coupon.price)} تومان بن خرید برای سبد خرید های بالای ${toPriceStyle(widget.coupon.minShopping)} تومان',
                          style: TextStyle(fontSize: 14),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer_rounded,
                          color: Colors.green,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: Text(
                          'مهلت استفاده تا: ${widget.coupon.dayOfEndDate}-${widget.coupon.monthOfEndDate}-${widget.coupon.yearOfEndDate}',
                          style: TextStyle(fontSize: 14),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          AvakatanButtonWidget(
            backgroundColor: MAIN_BLUE_COLOR,
            textColor: Colors.white,
            borderColor: Colors.transparent,
            title: 'بریم خرید',
            width: _screenSize.width -
                (0.166 * _screenSize.width //60,
                ),
            height: 0.0625 * _screenSize.height, //40
            onTap: () {
              // widget.confirmDate(false, _dayValue, _monthValue, _yearValue);
            },
            radius: 0.008 * _screenSize.height, //5
            fontSize: 0.038 * _screenSize.width, //14,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
