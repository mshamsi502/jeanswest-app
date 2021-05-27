// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;
import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';

class DirectionButtonWidget extends StatefulWidget {
  final String lat;
  final String lng;
  final String depName;

  const DirectionButtonWidget({Key key, this.lat, this.lng, this.depName})
      : super(key: key);

  State<StatefulWidget> createState() => _DirectionButtonWidgetState();
}

class _DirectionButtonWidgetState extends State<DirectionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 0.06081 * _screenSize.height, //36,
        width: _screenSize.width * 0.5,
        decoration: BoxDecoration(
          color: MAIN_BLUE_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(
            0.0138 * _screenSize.width, //5
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BranchSvgImages.directionIcon,
            SizedBox(
              width: 0.0194 * _screenSize.width, //7,
            ),
            Text(
              "branch_screen.direction".tr(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 0.038 * _screenSize.width, //14,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        if (Platform.isAndroid) {
          android_intent.Intent()
            ..setAction(android_action.Action.ACTION_VIEW)
            ..setData(
              Uri.parse(
                createCoordinatesUrl(double.parse(widget.lat),
                    double.parse(widget.lng), widget.depName),
              ),
            )
            ..startActivity().catchError((e) => print(e));
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
