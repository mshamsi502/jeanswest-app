// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/test_data/texts.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/info_card_widget/info_card_widget.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  List<List<String>> texts;
  List<String> assets;
  @override
  void initState() {
    texts = [
      [medLoremIpsum],
      [medLoremIpsum, shortLoremIpsum2],
      [shortLoremIpsum1, shortLoremIpsum2],
    ];
    assets = [
      'assets/images/png_images/profile/more/shopping-three.png',
      'assets/images/png_images/profile/more/shopping-two.png',
      'assets/images/png_images/profile/more/shopping-three.png',
    ];
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
                          height: 0.0625 * _screenSize.height, //40
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 0.36 * _screenSize.height, //230,
                              margin: EdgeInsets.all(
                                0.0138 * _screenSize.width, //5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  0.0194 * _screenSize.width, //7,
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: new AssetImage(
                                    'assets/images/png_images/profile/more/in-store.png',
                                    // 'assets/images/png_images/profile/more/family_trust.png',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.016 * _screenSize.height, //10
                              left: 0.034 * _screenSize.width, //12,
                              right: 0.034 * _screenSize.width, //12,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0.027 * _screenSize.width, //10,
                                    vertical: 0.0078 * _screenSize.height //5,
                                    ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    0.011 * _screenSize.width, //4,
                                  ),
                                  color: FADE_BLUE_00_COLOR,
                                ),
                                child: Text(
                                  'کوچک ترین تغییرات در سبک لباس و استایل، تغییرات بزرگی را در سبک زندگی ایجاد خواهد کرد',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 0.038 * _screenSize.width, //14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 0.015 * _screenSize.height, //10,
                        ),
                        ListView.builder(
                          itemCount: 3,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                InfoCardWidget(
                                  text: texts[index],
                                  imagePAth: assets[index],
                                  customDirection: rtlTextDirection,
                                  icon: [],
                                  screenSize: _screenSize,
                                  isEven: index.isEven,
                                ),
                                SizedBox(
                                    height: 0.0078 * _screenSize.height //5,
                                    ),
                              ],
                            );
                          },
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
