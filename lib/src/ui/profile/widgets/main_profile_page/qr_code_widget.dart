// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeWidget extends StatefulWidget {
  State<StatefulWidget> createState() => _QrCodeWidgetState();
}

class _QrCodeWidgetState extends State<QrCodeWidget> {
  Uint8List bytes = Uint8List(0);

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(
        0.0083 * _screenSize.width, //3,
      ),
      child: Container(
        height: 0.23310 * _screenSize.height, //  138,
        width: 0.23310 * _screenSize.height, //  138,
        // color: Colors.grey,
        child: QrImage(
          data: 'jeanswest.ir/user/${user.phoneNumber}',
          version: QrVersions.auto,
          padding: EdgeInsets.all(0),
          size: 0.416 * _screenSize.width, //  150,
          gapless: true,
          embeddedImage: AssetImage(
              'assets/images/png_images/global/jeanswest_icon_black.png'),
          embeddedImageEmitsError: true,
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(
              0.083 * _screenSize.width, //30

              0.083 * _screenSize.width, //30
            ), // 30 ,30
          ),
        ),
      ),
    );
  }
}
