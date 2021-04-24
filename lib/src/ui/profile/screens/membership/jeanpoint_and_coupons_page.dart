// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ! ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/points_and_coupons/copoun_detail_panel_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/points_and_coupons/coupons_info_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class JeanpointAndCouponsPage extends StatefulWidget {
  @override
  _JeanpointAndCouponsPageState createState() =>
      _JeanpointAndCouponsPageState();
}

class _JeanpointAndCouponsPageState extends State<JeanpointAndCouponsPage> {
  bool currentLevelWidgetAnimation = true;
  ScrollController _scrollController = new ScrollController();
  PanelController panelController = new PanelController();
  int selectedCopoun = 0;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: _screenSize.width,
      height: _screenSize.height,
      child: SlidingUpPanel(
        maxHeight: 300,
        minHeight: 0,
        backdropEnabled: true,
        controller: panelController,
        panel: CopounDetailPanelWidget(
          coupon: userJeanpointBons[selectedCopoun],
          closePanel: () => panelController.close(),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: 0.0078 * _screenSize.height, //5,
                color: F7_BACKGROUND_COLOR,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: MAIN_ORANGE_COLOR,
                  ),
                  child: Text('مجموع بن های شما: ${userJeanpointBons.length}'),
                ),
              ),
              Stack(
                children: [
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
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffffffff),
                          Color(0xffffffff),
                          Color(0x88ffffff),
                          Color(0x66ffffff),
                          Color(0x11ffffff),
                          Color(0x11ffffff),
                          Color(0x00ffffff),
                          Color(0x00ffffff),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'جهت استفاده بن ها پس از افزودن کالا به سبد خرید در قسمت انتخاب پوینت ها و بن ها اقدام کنید.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.0023 * _screenSize.height, //1.5,
                color: MAIN_BLUE_COLOR,
                height: 0.0023 * _screenSize.height, //1.5,
              ),
              SizedBox(height: 0.016 * _screenSize.height //10
                  ),
              // Container(
              //   // height: 300,
              //   child:
              // Expanded(
              //   child:
              CouponsInfoWidget(
                coupons: userJeanpointBons,
                scrollController: _scrollController,
                openPanel: (int index) {
                  setState(() {
                    selectedCopoun = index;
                  });
                  panelController.open();
                },
              ),
              // ),
              // ),
              SizedBox(
                // height: 0.023 * _screenSize.height, //15
                height: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
