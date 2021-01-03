// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeanswest/src/constants/global/colors.dart';

class BranchSvgImages {
  BranchSvgImages._();

  //
  // -----------------------------------------------------
  //

  static Widget callIcon = SvgPicture.asset(
    'assets/images/svg_images/branch/call_icon.svg',
    color: MAIN_BLUE_COLOR,
    width: 15,
    height: 15,
  );

  static Widget directionIcon = SvgPicture.asset(
    'assets/images/svg_images/branch/direction_icon.svg',
    color: Colors.white,
    height: 20,
    width: 20,
  );

  static Widget distanceBranchIcon = SvgPicture.asset(
    'assets/images/svg_images/branch/distance_branch_icon.svg',
    color: MAIN_BLUE_COLOR,
    width: 35,
    height: 35,
  );

  static Widget myLocationIcon = SvgPicture.asset(
    'assets/images/svg_images/branch/my_location_icon.svg',
    color: MAIN_BLUE_COLOR,
    height: 15,
    width: 15,
  );

  static Widget flagIcon = SvgPicture.asset(
    'assets/images/svg_images/branch/flag_icon.svg',
    color: MAIN_BLUE_COLOR,
    height: 20,
    width: 20,
  );
}
