// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';

import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';

class UserLocationButtonWidget extends StatefulWidget {
  // final Branch selectedBranch;
  final double lat;
  final double lng;
  final Function(CameraPosition) changeCameraPosition;

  const UserLocationButtonWidget({
    Key key,
    // this.selectedBranch,
    @required this.changeCameraPosition,
    @required this.lat,
    @required this.lng,
  }) : super(key: key);

  State<StatefulWidget> createState() => _UserLocationButtonWidgetState();
}

class _UserLocationButtonWidgetState extends State<UserLocationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BranchSvgImages.flagIcon,
      onTap: () {
        createAddressFiled(widget.lat, widget.lng);

        widget.changeCameraPosition(
            CameraPosition(target: LatLng(widget.lat, widget.lng), zoom: 16));
      },
    );
  }
}
