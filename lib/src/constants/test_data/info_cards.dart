// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/test_data/texts.dart';
import 'package:jeanswest/src/ui/global/widgets/info_card_widget/info_card_with_title_widget.dart';

List<Widget> buildOnlineReturnProcessChildren(Size _screenSize) {
  List<Widget> onlineReturnProcessChildren = new List<Widget>();
  onlineReturnProcessChildren.add(InfoCardWithTitleWidget(
    title: '7 روز ضمانت بازگشت کالا',
    text: [medLoremIpsum, shortLoremIpsum2],
    cover: Container(
      height: 0.138 * _screenSize.width, //50,
      width: 0.138 * _screenSize.width, //50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.22 * _screenSize.width, //80,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage(
            'assets/images/png_images/profile/more/delivery_icon.png',
          ),
        ),
      ),
    ),
    customDirection: rtlTextDirection,
    // icon: [
    //   Icon(Icons.adb_sharp),
    // ],
    textStyle: [
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
    ],
  ));
  onlineReturnProcessChildren.add(InfoCardWithTitleWidget(
    title: '7 روز ضمانت بازگشت کالا',
    text: [longLoremIpsum, shortLoremIpsum1],
    cover: Container(
      height: 0.138 * _screenSize.width, //50,
      width: 0.138 * _screenSize.width, //50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.22 * _screenSize.width, //80,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage(
            'assets/images/png_images/profile/more/delivery_icon.png',
          ),
        ),
      ),
    ),
    customDirection: rtlTextDirection,
    icon: [
      Icon(
        Icons.edit,
        size: 0.041 * _screenSize.width, //15,
      ),
    ],
    textStyle: [
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
    ],
  ));
  onlineReturnProcessChildren.add(InfoCardWithTitleWidget(
    title: '7 روز ضمانت بازگشت کالا',
    text: [longLoremIpsum, medLoremIpsum],
    cover: Container(
      height: 0.138 * _screenSize.width, //50,
      width: 0.138 * _screenSize.width, //50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.22 * _screenSize.width, //80,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage(
            'assets/images/png_images/profile/more/delivery_icon.png',
          ),
        ),
      ),
    ),
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
    textStyle: [
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
    ],
  ));

  return onlineReturnProcessChildren;
}

List<Widget> buildOfflineReturnProcessChildren(Size _screenSize) {
  List<Widget> offlineReturnProcessChildren = new List<Widget>();
  offlineReturnProcessChildren.add(InfoCardWithTitleWidget(
    title: '7 روز ضمانت بازگشت کالا',
    text: [medLoremIpsum, shortLoremIpsum2],
    cover: Container(
      height: 0.138 * _screenSize.width, //50,
      width: 0.138 * _screenSize.width, //50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.22 * _screenSize.width, //80,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage(
            'assets/images/png_images/profile/more/delivery_icon.png',
          ),
        ),
      ),
    ),
    customDirection: rtlTextDirection,
    // icon: [
    //   Icon(Icons.adb_sharp),
    // ],
    textStyle: [
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
    ],
  ));
  offlineReturnProcessChildren.add(InfoCardWithTitleWidget(
    title: '7 روز ضمانت بازگشت کالا',
    text: [longLoremIpsum, shortLoremIpsum1],
    cover: Container(
      height: 0.138 * _screenSize.width, //50,
      width: 0.138 * _screenSize.width, //50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.22 * _screenSize.width, //80,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage(
            'assets/images/png_images/profile/more/delivery_icon.png',
          ),
        ),
      ),
    ),
    customDirection: rtlTextDirection,
    icon: [
      Icon(
        Icons.edit,
        size: 0.041 * _screenSize.width, //15,
      ),
    ],
    textStyle: [
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
    ],
  ));
  offlineReturnProcessChildren.add(InfoCardWithTitleWidget(
    title: '7 روز ضمانت بازگشت کالا',
    text: [longLoremIpsum, medLoremIpsum],
    cover: Container(
      height: 0.138 * _screenSize.width, //50,
      width: 0.138 * _screenSize.width, //50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.22 * _screenSize.width, //80,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: new AssetImage(
            'assets/images/png_images/profile/more/delivery_icon.png',
          ),
        ),
      ),
    ),
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
    textStyle: [
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
      TextStyle(
        fontSize: 0.027 * _screenSize.width, //10,
      ),
    ],
  ));

  return offlineReturnProcessChildren;
}
