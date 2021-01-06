// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/test_data/texts.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/info_card_widget/info_card_widget.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            child: Stack(
              children: [
                Container(
                  height:
                      _screenSize.height - 0.03125 * _screenSize.height, //20,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 0.03125 * _screenSize.height, //20,
                        ),
                        Container(
                          height: 0.36 * _screenSize.height, //230,
                          margin: EdgeInsets.all(
                            0.016 * _screenSize.height, // 10
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: new AssetImage(
                                  'assets/images/png_images/profile/more/family_trust.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.015 * _screenSize.height, //10,
                        ),
                        InfoCardWidget(
                          text: [
                            medLoremIpsum,
                          ],
                          imagePAth:
                              'assets/images/png_images/profile/more/shopping.png',
                          customDirection: rtlTextDirection,
                          icon: [
                            Icon(
                              Icons.adb_sharp,
                              size: 0.041 * _screenSize.width, //15,
                            ),
                            Icon(
                              Icons.five_g,
                              size: 0.041 * _screenSize.width, //15,
                            ),
                          ],
                        ),
                        SizedBox(height: 0.0078 * _screenSize.height //5,
                            ),
                        InfoCardWidget(
                          text: [medLoremIpsum, shortLoremIpsum2],
                          imagePAth:
                              'assets/images/png_images/profile/more/jeanswest_shop.png',
                          customDirection: ltrTextDirection,
                        ),
                        SizedBox(height: 0.0078 * _screenSize.height //5,
                            ),
                        InfoCardWidget(
                          text: [shortLoremIpsum1, shortLoremIpsum2],
                          imagePAth:
                              'assets/images/png_images/profile/more/shopping.png',
                          customDirection: rtlTextDirection,
                          icon: [
                            Icon(
                              Icons.five_g,
                              size: 0.041 * _screenSize.width, //15,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.023 * _screenSize.height, //15,
                        ),
                      ],
                    ),
                  ),
                ),
                AppBarWithCloseWidget(
                  title: 'درباره ما',
                  closeOnTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
