//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/product/product.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_label_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class DetailOrderInfoWidget extends StatefulWidget {
  final Product product;
  final int count;
  final String state;

  DetailOrderInfoWidget({
    Key key,
    this.state,
    this.product,
    this.count,
  }) : super(key: key);

  State<StatefulWidget> createState() => _DetailOrderInfoWidgetState();
}

class _DetailOrderInfoWidgetState extends State<DetailOrderInfoWidget> {
  ScrollController scrollController = new ScrollController();
  String offPercent;
  bool hasOff;
  @override
  void initState() {
    offPercent = ((double.parse(widget.product.orgPrice) -
                double.parse(widget.product.discountedPrice)) /
            double.parse(widget.product.orgPrice) *
            100)
        .toStringAsFixed(0);
    hasOff = double.parse(offPercent) > 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      width: _screenSize.width,
      child: Column(
        children: [
          Container(
            // color: Colors.greenAccent,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 90,
                  width: 90,
                  // decoration: BoxDecoration(
                  //   // color: Colors.red,
                  //   image: DecorationImage(
                  //     image: new AssetImage(widget.product.assets),
                  //   ),
                  // ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: _screenSize.width - 120,
                      // color: Colors.blueAccent,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Colors.redAccent,
                              child: Text(
                                widget.product.name,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: widget.product.colorCode,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'رنگ : ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.product.color,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(
                            Icons.architecture_outlined,
                            size: 16,
                            color: MAIN_BLUE_COLOR,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'سایز : ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.product.size,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Icon(
                            Icons.label_outline,
                            size: 16,
                            color: MAIN_BLUE_COLOR,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          ' برند : ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.product.brand,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                width: 90,
                // color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: SizedBox()),
                        hasOff
                            ? AvakatanLabelWidget(
                                text: '$offPercent %',
                                backgroundColor: MAIN_BLUE_COLOR,
                                textColor: Colors.white,
                                textSize: 11,
                              )
                            : Container(),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Column(
                        children: [
                          SizedBox(height: 5),
                          Container(
                            alignment: Alignment.center,
                            // color: Colors.red,
                            height: 15,
                            width: 25,
                            child: Text(
                              'تعداد',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.count.toString(),
                            style: TextStyle(
                              color: MAIN_BLUE_COLOR,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: Colors.blue,
                            height: 15,
                          ),
                        ],
                      ),
                      Container(
                        width: 20,
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.blue,
                              height: 15,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'x',
                              style: TextStyle(
                                color: MAIN_BLUE_COLOR,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.blue,
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.red,
                              height: 15,
                              child: Text(
                                'قیمت واحد',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              toPriceStyle(
                                  int.parse(widget.product.discountedPrice)),
                              style: TextStyle(
                                color: MAIN_BLUE_COLOR,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.orange,
                              height: 15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    toPriceStyle(
                                        int.parse(widget.product.orgPrice)),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'تومان',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 7,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 3),
                          ],
                        ),
                      ),
                      Container(
                        width: 20,
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.blue,
                              height: 15,
                            ),
                            SizedBox(height: 6),
                            Text(
                              '=',
                              style: TextStyle(
                                color: MAIN_BLUE_COLOR,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.blue,
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.red,
                              height: 15,
                              child: Text(
                                'مجموع',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  toPriceStyle(int.parse(
                                          widget.product.discountedPrice) *
                                      widget.count),
                                  style: TextStyle(
                                    color: MAIN_BLUE_COLOR,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'تومان',
                                  style: TextStyle(
                                    color: MAIN_BLUE_COLOR,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              // color: Colors.blue,
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
