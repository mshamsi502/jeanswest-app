//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PackageSenderInfoWidget extends StatefulWidget {
  final Order order;
  final int totalCount;

  PackageSenderInfoWidget({
    Key key,
    this.order,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _PackageSenderInfoWidgetState();
}

class _PackageSenderInfoWidgetState extends State<PackageSenderInfoWidget> {
  String shamsiDay = '';

  @override
  void initState() {
    shamsiDay = shamsiDayOfWeek(
      int.parse('13${widget.order.recieveDate.yearOfDate}'),
      int.parse(widget.order.recieveDate.mouthOfDate),
      int.parse(widget.order.recieveDate.dayOfDate),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.5,
            blurRadius: 10,
            color: Colors.grey[200],
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'اطلاعات بسته ارسالی',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'نوع ارسال:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.order.sendMethod,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تاریخ ثبت سفارش:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.order.confirmDate.hourOfDate}:${widget.order.confirmDate.minuteOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: VerticalDivider(
                        color: Colors.grey,
                        // color: MAIN_BLUE_COLOR,
                        thickness: 0.00138 * _screenSize.width, //0.5,
                        width: 0.0138 * _screenSize.width, //5
                      ),
                    ),
                    Text(
                      '${widget.order.confirmDate.yearOfDate}/${widget.order.confirmDate.mouthOfDate}/${widget.order.confirmDate.dayOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تاریخ تحویل سفارش:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      shamsiDay,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      child: VerticalDivider(
                        color: Colors.grey,
                        // color: MAIN_BLUE_COLOR,
                        thickness: 0.00138 * _screenSize.width, //0.5,
                        width: 0.0138 * _screenSize.width, //5
                      ),
                    ),
                    Text(
                      '${widget.order.recieveDate.yearOfDate}/${widget.order.recieveDate.mouthOfDate}/${widget.order.recieveDate.dayOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'زمان تحویل سفارش:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'ساعت: ${widget.order.recieveDate.startHourOfDate} تا ${widget.order.recieveDate.endHourOfDate}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'وضعیت پرداخت:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.order.paymentPlan,
                  style: TextStyle(
                    color: GREEN_TEXT_COLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 0.5,
            color: Colors.grey,
            indent: 10,
            endIndent: 10,
          ),
          // SizedBox(height: 10),
          ListView.builder(
            itemCount: widget.order.products.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              //
              double tempDiscountedPrice = double.parse(
                  widget.order.products[index].discountedPrice.toString());
              double tempCountProduct =
                  double.parse((widget.order.countProducts[index]).toString());
              String totalPrice = toPriceStyle(int.parse(
                  (tempDiscountedPrice * tempCountProduct).toStringAsFixed(0)));
              //
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 120,
                          color: Colors.green,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.order.products[index].brand),
                              Container(
                                height: 40,
                                // color: Colors.red,
                                child: Expanded(
                                  child: Text(
                                    widget.order.products[index].name,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'رنگ: ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        widget.order.products[index].color,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ' (${widget.order.products[index].code})',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: VerticalDivider(
                                      color: Colors.grey,
                                      // color: MAIN_BLUE_COLOR,
                                      thickness:
                                          0.00138 * _screenSize.width, //0.5,
                                      width: 0.0138 * _screenSize.width, //5
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'سایز: ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        widget.order.products[index].size,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    'کد کالا: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.order.products[index].code,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: FB_BACKGROUND_COLOR,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'قیمت واحد: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    toPriceStyle(int.parse(widget.order
                                        .products[index].discountedPrice)),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    ' تومان',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                child: VerticalDivider(
                                  color: Colors.grey,
                                  // color: MAIN_BLUE_COLOR,
                                  thickness: 0.00138 * _screenSize.width, //0.5,
                                  width: 0.0138 * _screenSize.width, //5
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'تعداد: ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.order.countProducts[index]
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'قیمت نهایی: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    totalPrice,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    ' تومان',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
