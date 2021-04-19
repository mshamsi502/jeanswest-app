//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';

import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingInfoWidget extends StatefulWidget {
  final UserOfflineOrderRes order;
  final int totalCount;

  ShoppingInfoWidget({
    Key key,
    this.order,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _ShoppingInfoWidgetState();
}

class _ShoppingInfoWidgetState extends State<ShoppingInfoWidget> {
  String shoppingShamsiDate = '';
  String paymentShamsiDate = '';

  @override
  void initState() {
    shoppingShamsiDate = shamsiDayOfWeek(
      int.parse(widget.order.shoppingDate.yearOfDate),
      int.parse(widget.order.shoppingDate.mouthOfDate),
      int.parse(widget.order.shoppingDate.dayOfDate),
    );
    paymentShamsiDate = shamsiDayOfWeek(
      int.parse(widget.order.paymentDate.yearOfDate),
      int.parse(widget.order.paymentDate.mouthOfDate),
      int.parse(widget.order.paymentDate.dayOfDate),
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
            spreadRadius: 0.00138 * _screenSize.width, //0.5,
            blurRadius: 0.027 * _screenSize.width, //10,
            color: Colors.grey[200],
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(
        vertical: 0.0078 * _screenSize.height, //5
        horizontal: 0.041 * _screenSize.width, //15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.016 * _screenSize.height, //10
          ),
          Text(
            'اطلاعات خرید',
            style: TextStyle(
              color: Colors.black,
              fontSize: 0.038 * _screenSize.width, //14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'شعبه خریداری شده:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  widget.order.longBranchName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تاریخ و زمان خرید:',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 0.038 * _screenSize.width, //14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.order.shoppingDate.hourOfDate}:${widget.order.shoppingDate.minuteOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 0.054 * _screenSize.width, //20
                      width: 0.054 * _screenSize.width, //20
                      child: VerticalDivider(
                        color: Colors.grey,
                        // color: MAIN_BLUE_COLOR,
                        thickness: 0.00138 * _screenSize.width, //0.5,
                        width: 0.0138 * _screenSize.width, //5
                      ),
                    ),
                    Text(
                      '${widget.order.shoppingDate.yearOfDate}/${widget.order.shoppingDate.mouthOfDate}/${widget.order.shoppingDate.dayOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 0.016 * _screenSize.height, //10
          ),
          Divider(
            thickness: 0.00138 * _screenSize.width, //0.5,
            color: Colors.grey,
            indent: 0.027 * _screenSize.width, //10,
            endIndent: 0.027 * _screenSize.width, //10,
          ),
          // SizedBox(height: 10),
          ListView.builder(
            itemCount: widget.order.products.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              //
              double tempDiscountedPrice = double.parse(
                  widget.order.products[index].discountedPrice.toString());
              double tempCountProduct =
                  double.parse((widget.order.countProducts[index]).toString());
              String totalPrice = toPriceStyle(int.parse(
                  (tempDiscountedPrice * tempCountProduct).toStringAsFixed(0)));
              //
              return Container(
                width: _screenSize.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 0.027 * _screenSize.width, //10,
                  vertical: 0.027 * _screenSize.width, //10,
                ),
                margin: EdgeInsets.symmetric(
                  vertical: 0.008 * _screenSize.height, //5
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 0.277 * _screenSize.width, //100,
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.0138 * _screenSize.width, //5
                          ),
                          height: 0.2027 * _screenSize.height, //120,
                          // color: Colors.green,
                          child: Image.network(
                              widget.order.products[index].assets),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.order.products[index].perBrand,
                                style: TextStyle(
                                  fontSize: 0.038 * _screenSize.width, //14,
                                ),),
                                  widget.order.returnedProduct[index]
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                0.0194 * _screenSize.width, //7,
                                            vertical: 0.001689 *
                                                _screenSize.height, //1,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              0.011 * _screenSize.width, //4,
                                            ),
                                            color:
                                                BACKGROUND_RED_LABEL_TEXT_COLOR,
                                          ),
                                          child: Text(
                                            'مرجوع شده',
                                            style: TextStyle(
                                              fontSize: 0.0333 *
                                                  _screenSize.width, //12,
                                              color: RED_LABEL_TEXT_COLOR,
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                              Container(
                                height: 0.0625 * _screenSize.height, //40
                                child: Text(
                                  widget.order.products[index].name,
                                  style: TextStyle(
                                    fontSize: 0.0333 * _screenSize.width, //12,
                                  ),
                                ),
                              ),
                              SizedBox(height: 0.0078 * _screenSize.height //5,
                                  ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'رنگ: ',
                                        style: TextStyle(
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        widget.order.products[index].color,
                                        style: TextStyle(
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ' (${widget.order.products[index].code})',
                                        style: TextStyle(
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 0.054 * _screenSize.width, //20
                                    width: 0.054 * _screenSize.width, //20
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
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        widget.order.products[index].size,
                                        style: TextStyle(
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 0.0078 * _screenSize.height //5,
                                  ),
                              Row(
                                children: [
                                  Text(
                                    'کد کالا: ',
                                    style: TextStyle(
                                      fontSize:
                                          0.0333 * _screenSize.width, //12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.order.products[index].code,
                                    style: TextStyle(
                                      fontSize:
                                          0.0333 * _screenSize.width, //12,
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
                    SizedBox(
                      height: 0.023 * _screenSize.height, //15
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.027 * _screenSize.width, //10,
                      ),
                      decoration: BoxDecoration(
                        color: FB_BACKGROUND_COLOR,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0.016 * _screenSize.height, //10
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'قیمت واحد: ',
                                    style: TextStyle(
                                      fontSize:
                                          0.0333 * _screenSize.width, //12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    toPriceStyle(int.parse(widget.order
                                        .products[index].discountedPrice)),
                                    style: TextStyle(
                                      fontSize: 0.038 * _screenSize.width, //14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    ' تومان',
                                    style: TextStyle(
                                      fontSize: 0.027 * _screenSize.width, //10,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 0.054 * _screenSize.width, //20
                                width: 0.054 * _screenSize.width, //20
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
                                      fontSize:
                                          0.0333 * _screenSize.width, //12,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    widget.order.countProducts[index]
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 0.038 * _screenSize.width, //14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 0.00138 * _screenSize.width, //0.5,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'قیمت نهایی: ',
                                style: TextStyle(
                                  fontSize: 0.0333 * _screenSize.width, //12,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    totalPrice,
                                    style: TextStyle(
                                      fontSize: 0.038 * _screenSize.width, //14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    ' تومان',
                                    style: TextStyle(
                                      fontSize: 0.027 * _screenSize.width, //10,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 0.016 * _screenSize.height, //10
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.016 * _screenSize.height, //10
                    ),
                    Divider(
                      thickness: 0.00138 * _screenSize.width, //0.5,
                      color: Colors.grey,
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
