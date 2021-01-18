// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ! ****************************************************************************

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class InviteFrindePage extends StatefulWidget {
  final String userId;
  final int receivedGift;
  final int someOfInvited;
  final int someOfInstallFromInvited;
  final int someOfShoppingFromInvited;

  const InviteFrindePage({
    Key key,
    this.userId,
    this.receivedGift,
    this.someOfInvited,
    this.someOfInstallFromInvited,
    this.someOfShoppingFromInvited,
  }) : super(key: key);
  @override
  _InviteFrindePageState createState() => _InviteFrindePageState();
}

class _InviteFrindePageState extends State<InviteFrindePage> {
  bool currentLevelWidgetAnimation = true;
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              color: Color(0x88f2f2f2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            child: Text(
                              'جایزه های دریافتی',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(toPriceStyle(widget.receivedGift)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: VerticalDivider(
                      color: Colors.grey,
                      // color: MAIN_BLUE_COLOR,
                      thickness: 0.5,
                      indent: 15,
                      width: 5,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            child: Text(
                              'دوستان دعوت شده',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.someOfInvited.toString(),
                            style: TextStyle(
                              color: Color(0xFF32BE93),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: VerticalDivider(
                      color: Colors.grey,
                      // color: MAIN_BLUE_COLOR,
                      thickness: 0.5,
                      indent: 15,
                      width: 5,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 30,
                            child: Text(
                              'دوستانی که اپلیکشن را نصب کرده اند',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.someOfInstallFromInvited.toString()),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: VerticalDivider(
                      color: Colors.grey,
                      // color: MAIN_BLUE_COLOR,
                      thickness: 0.5,
                      indent: 15,
                      width: 5,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                            child: Text(
                              'دوستانی که از ما خرید کرده اند',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.someOfShoppingFromInvited.toString()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(
                      'assets/images/png_images/profile/friends_banner.png'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'شما میتونین با دعوت دوستانتون به اپلیکشن جین وست هم خودتون و هم دوستتون جوایز نقدی دریافت کنین',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: MAIN_BLUE_COLOR,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 7,
                ),
                Text(
                  'حالا مراحلی که باید تا جایزه گرفتن طی کنی',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MAIN_BLUE_COLOR,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    // color: Colors.greenAccent,
                    image: DecorationImage(
                      image: new AssetImage(
                          'assets/images/png_images/profile/delivery_motor.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: DottedBorder(
                color: MAIN_BLUE_COLOR,
                strokeWidth: 1,
                dashPattern: const <double>[10, 7],
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xffECA707),
                            ),
                            width: 15,
                            height: 15,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'لینکو واس دوستت ارسال کن',
                              style: TextStyle(
                                color: MAIN_BLUE_COLOR,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xffECA707),
                            ),
                            width: 15,
                            height: 15,
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'دوستتو تو اولین خریدش از جین وست همراهی کن',
                              style: TextStyle(
                                color: MAIN_BLUE_COLOR,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xffECA707),
                            ),
                            width: 15,
                            height: 15,
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'بعد از پایان اولین خرید دوستت جایزه جذاب ما برای تو ارسال میشه',
                              style: TextStyle(
                                color: MAIN_BLUE_COLOR,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileSvgImages.starIcon,
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'به همین سادگی!',
                            style: TextStyle(
                              color: MAIN_BLUE_COLOR,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 38,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
