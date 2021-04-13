//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

// import 'package:jeanswest/src/constants/constants.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/ui/profile/widgets/order_list/order_main_info_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecOneOrderDetailWidget extends StatefulWidget {
  final Order order;
  final String state;
  final int totalCount;

  SecOneOrderDetailWidget({
    Key key,
    this.order,
    this.state,
    this.totalCount,
  }) : super(key: key);

  State<StatefulWidget> createState() => _SecOneOrderDetailWidgetState();
}

class _SecOneOrderDetailWidgetState extends State<SecOneOrderDetailWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'کد سفارش',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.order.code,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'تحویل گیرنده',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.order.receiverName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          OrderMainInfoWidget(
            backgroungColor: FB_BACKGROUND_COLOR,
            radius: 4,
            firstTitle: 'تاریخ ثبت سفارش',
            firstValue:
                '${widget.order.confirmDate.yearOfDate}/${widget.order.confirmDate.mouthOfDate}/${widget.order.confirmDate.dayOfDate}',
            secTitle: 'قیمت پرداخت شده',
            secValue: toPriceStyle(int.parse(widget.order.payablePrice)),
            // countProducts: widget.order.countProducts,
            thirdTitle: 'تعداد کالا',
            thirdValue: widget.totalCount.toString(),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'آدرس ارسالی',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.order.address.address,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'شماره تماس',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.order.phoneNumber,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'زمان تحویل',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${widget.order.recieveDate.perExplain} بازه ${widget.order.recieveDate.startHourOfDate} - ${widget.order.recieveDate.endHourOfDate}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'هزینه ارسال',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.order == null ||
                              checkFreeSend(widget.order.sendPrice)
                          ? 'رایگان'
                          : toPriceStyle(int.parse(widget.order.sendPrice)),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'کد پیگیری',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.content_copy_outlined,
                            size: 15,
                            color: MAIN_BLUE_COLOR,
                          ),
                          onTap: () {
                            Clipboard.setData(
                                ClipboardData(text: widget.order.trackingCode));
                            showSnackBarError(
                                'کد پیگیری در کلیپبورد کپی شد.', context);
                            //
                          },
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.order.trackingCode,
                          style: TextStyle(
                            color: MAIN_BLUE_COLOR,
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اطلاعات پرداخت',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'نحوه پرداخت',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.order.paymentPlan,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'کد پیگیری پرداخت',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.order.paymentTrackingCode,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'تاریخ و زمان پرداخت',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${widget.order.paymentDate.yearOfDate}/${widget.order.paymentDate.mouthOfDate}/${widget.order.paymentDate.dayOfDate} - ${widget.order.paymentDate.hourOfDate}:${widget.order.paymentDate.minuteOfDate}',
                      textDirection: ltrTextDirection,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
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
    );
  }

  showSnackBarError(String msg, BuildContext context) {
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: GestureDetector(
          // ignore: deprecated_member_use
          onTap: () => Scaffold.of(context).hideCurrentSnackBar(),
          child: Row(
            children: [
              Expanded(child: SizedBox()),
              Container(
                alignment: Alignment.center,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: EdgeInsets.only(bottom: 65),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  msg,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'IRANSans', fontSize: 12),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        duration: Duration(milliseconds: 3000),
      ),
    );
  }
}
