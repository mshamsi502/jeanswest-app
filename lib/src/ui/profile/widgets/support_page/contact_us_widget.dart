// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

class ContactUsWidget extends StatefulWidget {
  final String headerAsset;

  const ContactUsWidget({Key key, this.headerAsset}) : super(key: key);
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
      margin: EdgeInsets.symmetric(
        horizontal: 0.054 * _screenSize.width, //20
      ),
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
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 0.03125 * _screenSize.height, //20
                horizontal: 0.027 * _screenSize.width, //10
              ),
              decoration: BoxDecoration(
                color: F2_BACKGROUND_COLOR,
                borderRadius: BorderRadius.circular(
                  0.023 * _screenSize.height, //15
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 0.027 * _screenSize.width, //10
                      ),
                      Text(
                        '02191070544',
                        style: TextStyle(
                            fontSize: 0.033 * _screenSize.width, //12
                            color: MAIN_BLUE_COLOR),
                      ),
                      SizedBox(
                        width: 0.014 * _screenSize.width, //5
                      ),
                      Icon(
                        Icons.phone,
                        color: MAIN_BLUE_COLOR,
                        size: 0.023 * _screenSize.height, //15
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.015 * _screenSize.height, //10
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 0.027 * _screenSize.width, //10
                      ),
                      Text(
                        'info@banimode.com',
                        style: TextStyle(
                            fontSize: 0.033 * _screenSize.width, //12,
                            color: MAIN_BLUE_COLOR),
                      ),
                      SizedBox(
                        width: 0.014 * _screenSize.width, //5
                      ),
                      Icon(
                        Icons.email_outlined,
                        color: MAIN_BLUE_COLOR,
                        size: 0.023 * _screenSize.height, //15
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.015 * _screenSize.height, //10
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 0.027 * _screenSize.width, //10
                      ),
                      Text(
                        '1475614566',
                        style: TextStyle(
                            fontSize: 0.033 * _screenSize.width, //12,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 0.014 * _screenSize.width, //5
                      ),
                      Icon(
                        Icons.apartment_outlined,
                        color: Colors.black,
                        size: 0.023 * _screenSize.height, //15
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.031 * _screenSize.height, //20,
            ),
            Container(
              height: 0.28 * _screenSize.height, //180,
              width: _screenSize.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage(
                      'assets/images/png_images/profile/more/contact_us.png'),
                ),
              ),
            ),
            Divider(
              height: 0.00138 * _screenSize.height, //0.5,
              thickness: 0.00138 * _screenSize.height, //0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 0.015 * _screenSize.height, //10
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.033 * _screenSize.width, //12
                  width: 0.033 * _screenSize.width, //12
                  child: GlobalSvgImages.greyTimeIcon,
                ),
                SizedBox(
                  width: 0.014 * _screenSize.width, //5
                ),
                Expanded(
                  child: Text(
                    'میزبان صدای گرمتان هستیم... 7 روز هفته 24 ساعته',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 0.027 * _screenSize.width, //10
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
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
