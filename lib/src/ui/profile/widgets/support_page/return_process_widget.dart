// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';

class ReturnProcessWidget extends StatefulWidget {
  final String assetHeader;
  final List<Widget> children;
  final List<String> texts;

  const ReturnProcessWidget({
    Key key,
    this.assetHeader,
    this.children,
    this.texts,
  }) : super(key: key);

  @override
  _ReturnProcessWidgetState createState() => _ReturnProcessWidgetState();
}

class _ReturnProcessWidgetState extends State<ReturnProcessWidget> {
  ScrollController scrollController;
  @override
  void initState() {
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            SizedBox(
              height: 0.015 * _screenSize.height, //10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: 0.027 * _screenSize.width, //10,
                    ),
                    child: Text(
                      'مشتری گرامی ضمن سپاس از حسن انتخاب شما، شرایط و ضوابط تعویض و مرجوع اجناس خریداری شده در شعب جین وست به شرح زیر می باشد:',
                      style: TextStyle(
                        fontSize: 0.038 * _screenSize.width, //14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 0.25 * _screenSize.height, //160,
                  width: 0.4166 * _screenSize.width, //150,
                  margin: EdgeInsets.all(
                    0.016 * _screenSize.height, // 10
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: new AssetImage(widget.assetHeader),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.015 * _screenSize.height, //10,
            ),
            ListView.builder(
              itemCount: widget.texts.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 0.0194 * _screenSize.width, //7,
                          height: 0.0194 * _screenSize.width, //7,
                          margin: EdgeInsets.only(
                            top: 0.016 * _screenSize.height, //10
                            right: 0.027 * _screenSize.width, //10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              0.138 * _screenSize.width, //50,
                            ),
                            color: MAIN_GOLD_COLOR,
                          ),
                        ),
                        SizedBox(
                          width: 0.027 * _screenSize.width, //10,
                        ),
                        Expanded(
                          child: Text(
                            widget.texts[index],
                            style: TextStyle(
                              fontSize: 0.038 * _screenSize.width, //14,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 0.031 * _screenSize.height, //20,
                    ),
                  ],
                );
              },
            ),
            Container(
              color: BLUE_SKY_FADE_COLOR,
              margin: EdgeInsets.symmetric(
                horizontal: 0.027 * _screenSize.width, //10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 0.054 * _screenSize.width, //20
                vertical: 0.016 * _screenSize.height, //10
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'تماس با پشتیبانی:',
                    textDirection: rtlTextDirection,
                    style: TextStyle(
                      fontSize: 0.038 * _screenSize.width, //14,
                      // color: MAIN_BLUE_COLOR,
                    ),
                  ),
                  SizedBox(
                    width: 0.027 * _screenSize.width, //10,
                  ),
                  Row(
                    children: [
                      Text(
                        '02191070544',
                        style: TextStyle(
                          fontSize: 0.0444 * _screenSize.width, //16,
                          color: MAIN_BLUE_COLOR,
                        ),
                      ),
                      SizedBox(width: 0.0138 * _screenSize.width //5,
                          ),
                      Icon(
                        Icons.phone_outlined,
                        color: MAIN_BLUE_COLOR,
                        size: 0.069 * _screenSize.width, //25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.023 * _screenSize.height, //15
            ),
          ],
        ),
      ),
    );
  }
}
