// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intent/action.dart' as android_action;
import 'package:intent/extra.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';


class ShareLocationButtonWidget extends StatefulWidget {
  // final Branch selectedBranch;
  final String depName;
  final String depAddress;
  final double lat;
  final double lng;

  const ShareLocationButtonWidget(
      {Key key,
      // @required this.selectedBranch,
      @required this.depName,
      @required this.depAddress,
      @required this.lat,
      @required this.lng})
      : super(key: key);

  State<StatefulWidget> createState() => _ShareLocationButtonWidgetState();
}

class _ShareLocationButtonWidgetState extends State<ShareLocationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GlobalSvgImages.shareIcon,
      onTap: () async {
        if (Platform.isAndroid) {
          android_intent.Intent()
            ..setAction(android_action.Action.ACTION_SEND)
            ..setType("*/location")
            ..putExtra(Extra.EXTRA_TEXT, '''
فروشگاه جین وست
شعبه: ${widget.depName}
آدرس: ${widget.depAddress}
 * * * * * * * * * * * * * * * * * * * * *
جهت مشاهده لوکیشن در نقشه بر روی لینک زیر کلیک کنید:
https://www.google.com/maps/search/?api=1&query=${widget.lat},${widget.lng}
''')
            ..startActivity(createChooser: true).catchError((e) => print(e));
        } else if (Platform.isIOS) {
          // IOS Intent to Map Apps
          //   "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"
          Uri.parse(
              'comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit');
        } else {
          // Other OS Intent to Map Apps
        }
      },
    );
  }
}
