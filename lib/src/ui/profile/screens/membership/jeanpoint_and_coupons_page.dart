// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ! ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/points_and_coupons/coupons_info_widget.dart';
import 'package:jeanswest/src/constants/test_data/coupons.dart';

class JeanpointAndCouponsPage extends StatefulWidget {
  @override
  _JeanpointAndCouponsPageState createState() =>
      _JeanpointAndCouponsPageState();
}

class _JeanpointAndCouponsPageState extends State<JeanpointAndCouponsPage> {
  bool currentLevelWidgetAnimation = true;
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: _screenSize.width,
      height: _screenSize.height,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              height: 0.0078 * _screenSize.height, //5,
              color: F7_BACKGROUND_COLOR,
            ),
            Container(
              height: 0.3125 * _screenSize.height, //200
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage(
                      'assets/images/png_images/profile/coupons.png'),
                ),
              ),
            ),
            Divider(
              thickness: 0.0023 * _screenSize.height, //1.5,
              color: MAIN_BLUE_COLOR,
              height: 0.0023 * _screenSize.height, //1.5,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 0.041 * _screenSize.width, //15,
              ),
              padding: EdgeInsets.all(0.0138 * _screenSize.width //5,
                  ),
              // height: 20,
              decoration: BoxDecoration(
                  color: YELLOW_SKIN_COLOR,
                  borderRadius: BorderRadius.circular(
                    0.00555 * _screenSize.width, //2,
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 0.069 * _screenSize.width, //25,
                    padding: EdgeInsets.only(
                      top: 0.0078 * _screenSize.height, //5,
                    ),
                    child: Container(
                      height: 0.0138 * _screenSize.width, //5,
                      width: 0.0138 * _screenSize.width, //5,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(
                          0.138 * _screenSize.width, //50,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'جهت استفاده بن ها پس از افزودن کالا به سبد خرید در قسمت انتخاب پوینت ها و بن ها اقدام کنید.',
                      style: TextStyle(fontSize: 0.023 * _screenSize.width //9,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.016 * _screenSize.height //10
                ),
            CouponsInfoWidget(
              coupons: myCoupons,
              scrollController: _scrollController,
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
