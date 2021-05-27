// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/api_response/globalRes/contactUs/contact-us-data.dart';

class ContactUsWidget extends StatefulWidget {
  final String headerAsset;
  final ContactUsData contactUs;

  const ContactUsWidget({
    Key key,
    this.headerAsset,
    this.contactUs,
  }) : super(key: key);
  State<StatefulWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  GoogleMapController mapController;

  onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      // margin: EdgeInsets.symmetric(
      //   horizontal: 0.054 * _screenSize.width, //20
      // ),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 0.3125 * _screenSize.height, //200

              width: _screenSize.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage(widget.headerAsset),
                ),
              ),
            ),
            Divider(
              thickness: 0.001689 * _screenSize.height, //1,
              height: 0.00138 * _screenSize.height, //0.5,
              color: MAIN_BLUE_COLOR,
            ),
            SizedBox(
              height: 0.031 * _screenSize.height, //20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.054 * _screenSize.width, //20
              ),
              child: DottedBorder(
                dashPattern: [
                  0.027 * _screenSize.width, //10,
                  0.022 * _screenSize.width, //8,
                ],
                color: MAIN_BLUE_COLOR,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.023 * _screenSize.height, //15
                    //  horizontal: 15
                  ),
                  width: _screenSize.width,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0.031 * _screenSize.height, //20,
                        right: 0,
                        left: 0,
                        child: Row(
                          children: [
                            Container(
                              height: 0.3125 * _screenSize.height, //200
                              width: _screenSize.width -
                                  (0.25 * _screenSize.width //90,
                                  ),
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: new AssetImage(
                                    'assets/images/png_images/profile/more/contact-us.png',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 0.583333 * _screenSize.width, //210,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.027 * _screenSize.width, //10,
                              vertical: 0.0078 * _screenSize.height, //5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                0.011 * _screenSize.width, //4,
                              ),
                              color: BLUE_SKY_FADE_COLOR,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  widget.contactUs.addresses,
                                  style: TextStyle(
                                    fontSize: 0.0444 * _screenSize.width, //16,
                                    color: MAIN_BLUE_COLOR,
                                  ),
                                ),
                                SizedBox(
                                  width: 0.0138 * _screenSize.width, //5,
                                ),
                                Icon(
                                  Icons.sms_outlined,
                                  size: 0.054 * _screenSize.width, //20
                                  color: MAIN_BLUE_COLOR,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.031 * _screenSize.height, //20,
                          ),
                          Container(
                            width: 0.38888 * _screenSize.width, //140,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.027 * _screenSize.width, //10,
                              vertical: 0.0078 * _screenSize.height, //5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                0.011 * _screenSize.width, //4,
                              ),
                              color: BLUE_SKY_FADE_COLOR,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  widget.contactUs.phone,
                                  style: TextStyle(
                                    fontSize: 0.0444 * _screenSize.width, //16,
                                    color: MAIN_BLUE_COLOR,
                                  ),
                                ),
                                SizedBox(
                                  width: 0.0138 * _screenSize.width, //5,
                                ),
                                Icon(
                                  Icons.phone_outlined,
                                  size: 0.054 * _screenSize.width, //20
                                  color: MAIN_BLUE_COLOR,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.031 * _screenSize.height, //20,
                          ),
                          Container(
                            width: 0.38888 * _screenSize.width, //140,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.027 * _screenSize.width, //10,
                              vertical: 0.0078 * _screenSize.height, //5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                0.011 * _screenSize.width, //4,
                              ),
                              color: WHITE_SMOKE_COLOR,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  widget.contactUs.fax,
                                  style: TextStyle(
                                    fontSize: 0.0444 * _screenSize.width, //16,
                                  ),
                                ),
                                SizedBox(
                                  width: 0.0138 * _screenSize.width, //5,
                                ),
                                Icon(
                                  Icons.apartment,
                                  size: 0.054 * _screenSize.width, //20
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.261824 * _screenSize.height, //155
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: 0.027 * _screenSize.width, //10,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 0.033 * _screenSize.width, //12
                                  width: 0.033 * _screenSize.width, //12
                                  child: GlobalSvgImages.greyTimeIcon,
                                ),
                                SizedBox(
                                  width: 0.014 * _screenSize.width, //5
                                ),
                                Text(
                                  'میزبان صدای گرمتان هستیم... 7 روز هفته 24 ساعته',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:
                                          0.0333 * _screenSize.width, //12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0.016 * _screenSize.height, //10
                        right: 0,
                        left: 0,
                        child: Container(
                          width: _screenSize.width,
                          color: Colors.red,
                          // child:
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.039 * _screenSize.height, //25,
            ),
          ],
        ),
      ),
    );
  }
}
