//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeOrderWidget extends StatefulWidget {
  final String orderCode;

  QRCodeOrderWidget({
    Key key,
    this.orderCode,
  }) : super(key: key);

  State<StatefulWidget> createState() => _QRCodeOrderWidgetState();
}

class _QRCodeOrderWidgetState extends State<QRCodeOrderWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: 0.83333 * _screenSize.width, //300,
      height: 0.625 * _screenSize.height, //370,
      child: Column(
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  GestureDetector(
                    child: Container(
                      // color: Colors.red,
                      padding: EdgeInsets.all(
                        0.027 * _screenSize.width, //10,
                      ),
                      child: Icon(
                        Icons.close,
                        size: 0.05 * _screenSize.width, //18,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.046 * _screenSize.height, //30
                ),
                child: Center(
                  child: Container(
                    height: 0.4 * _screenSize.height, //250,
                    width: 0.4 * _screenSize.height, //250,
                    margin: EdgeInsets.symmetric(
                      vertical: 0.041 * _screenSize.width, //15,
                    ),
                    padding: EdgeInsets.only(
                      top: 0.046 * _screenSize.height, //30
                      bottom: 0.054 * _screenSize.width, //20
                      right: 0.054 * _screenSize.width, //20
                      left: 0.054 * _screenSize.width, //20
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey[200]),
                      borderRadius: BorderRadius.circular(
                        0.00555 * _screenSize.width, //2,
                      ),
                    ),
                    child: QrImage(
                      data: 'jeanswest.ir/orderCode/${widget.orderCode}',
                      version: QrVersions.auto,
                      size: 0.416 * _screenSize.width, //  150,
                      gapless: true,
                      embeddedImage: AssetImage(
                          'assets/images/png_images/global/jeanswest_icon_black.png'),
                      embeddedImageEmitsError: true,
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(
                          0.111 * _screenSize.width, //40,
                          0.111 * _screenSize.width, //40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.046 * _screenSize.height, //30
                ),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 0.3055 * _screenSize.width, //110,
                    height: 0.05743 * _screenSize.height, //34
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blueGrey[200]),
                      borderRadius: BorderRadius.circular(
                        0.00555 * _screenSize.width, //2,
                      ),
                    ),
                    child: Text(
                      'کد سفارش',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 0.047 * _screenSize.width, //17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Container(
                      alignment: Alignment.center,
                      width: 0.4166 * _screenSize.width, //150,
                      height: 0.05743 * _screenSize.height, //34
                      decoration: BoxDecoration(
                        color: MAIN_BLUE_COLOR,
                        borderRadius: BorderRadius.circular(
                          0.00555 * _screenSize.width, //2,
                        ),
                      ),
                      child: Text(
                        widget.orderCode,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 0.054 * _screenSize.width, //20
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 0.016 * _screenSize.height, //10
          ),
          Text(
            'جهت تعویض کالا در فروشگاه این بارکد را به فروشنده نشان دهید',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 0.038 * _screenSize.width, //14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
