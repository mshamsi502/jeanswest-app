// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-10  ,  11:05 AM
// ! ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
// import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/models/profile/user/user-copouns-info.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/points_and_coupons/copoun_detail_panel_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/membership/points_and_coupons/coupons_info_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class JeanpointAndCouponsPage extends StatefulWidget {
  final List<UserCouponsInfo> userJeanpointBons;

  const JeanpointAndCouponsPage({Key key, this.userJeanpointBons = const []})
      : super(key: key);
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
        maxHeight: 0.5166 * _screenSize.height, //310,
        minHeight: 0,
        backdropEnabled: true,
        controller: panelController,
        color: Colors.transparent,
        panel: widget.userJeanpointBons != null &&
                widget.userJeanpointBons.length > 0
            ? CopounDetailPanelWidget(
                coupon: widget.userJeanpointBons[selectedCopoun],
                closePanel: () => panelController.close(),
              )
            : SizedBox(),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Container(
                height: 0.0078 * _screenSize.height, //5,
                color: F7_BACKGROUND_COLOR,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 0.023 * _screenSize.height, //15
                ),
                child: Container(
                  height: 0.0625 * _screenSize.height, //40
                  padding: EdgeInsets.symmetric(
                    vertical: 0.011824 * _screenSize.height, //7
                    horizontal: 0.041 * _screenSize.width, //15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      0.0138 * _screenSize.width, //5,
                    ),
                    color: MAIN_ORANGE_COLOR,
                  ),
                  child: Text(
                    widget.userJeanpointBons != null &&
                            widget.userJeanpointBons.length > 0
                        ? 'مجموع بن ها: ${widget.userJeanpointBons.length}'
                        : 'مجموع بن ها: 0',
                    style: TextStyle(
                      fontSize: 0.0444 * _screenSize.width, //16,
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 0.3547 * _screenSize.height, //210,
                    //0.3125 * _screenSize.height, //200
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter,
                        image: new AssetImage(
                            'assets/images/png_images/profile/coupons.png'),
                      ),
                    ),
                  ),
                  Container(
                    height: 0.28 * _screenSize.height, //180,
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.083 * _screenSize.width, //30
                    ),
                    child: Text(
                      'جهت استفاده بن ها پس از افزودن کالا به سبد خرید در قسمت انتخاب پوینت ها و بن ها اقدام کنید.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 0.038 * _screenSize.width, //14,
                      ),
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
                coupons: widget.userJeanpointBons,
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
                height: 0.172 * _screenSize.height, //110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
