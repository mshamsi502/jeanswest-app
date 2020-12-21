// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-12  ,  06:49 PM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GlobalSvgImages {
  GlobalSvgImages._();

  //
  // -----------------------------------------------------
  //

  static Widget rightIcon = SvgPicture.asset(
    'assets/images/svg_images/global/back_icon.svg',
    color: Color(0xff2c3d73),
    width: 20,
    height: 20,
  );

  static Widget leftIcon = RotatedBox(
    quarterTurns: -2,
    child: SvgPicture.asset(
      'assets/images/svg_images/global/back_icon.svg',
      color: Color(0xff2c3d73),
      width: 20,
      height: 20,
    ),
  );

  static Widget closeIcon = SvgPicture.asset(
    'assets/images/svg_images/global/close_icon.svg',
    color: Color(0xff2c3d73),
    width: 20,
    height: 20,
  );

  static Widget clearTextFieldIcon = SvgPicture.asset(
    'assets/images/svg_images/global/clear_text_field_icon.svg',
    color: Color(0xff2c3d73),
    width: 15,
    height: 15,
  );

  static Widget shareIcon = SvgPicture.asset(
    'assets/images/svg_images/global/share_icon.svg',
    color: Color(0xff2c3d73),
    height: 20,
    width: 20,
  );

  static Widget searchIcon = SvgPicture.asset(
    'assets/images/svg_images/global/search_icon.svg',
    color: Color(0xff2c3d73),
    width: 20,
    height: 20,
  );

  static Widget svgArrowTop = SvgPicture.asset(
    "assets/images/svg_images/global/arrow_top_icon.svg",
    height: 10,
    color: Colors.grey[700],
  );
  static Widget editIconForLeft = SvgPicture.asset(
    'assets/images/svg_images/global/edit_icon.svg',
    color: Color(0xff2c3d73),
    // height: 20,
    // width: 20,
  );
  static Widget editIconForRight = RotatedBox(
    quarterTurns: -3,
    child: SvgPicture.asset(
      'assets/images/svg_images/global/edit_icon.svg',
      color: Color(0xff2c3d73),
      // height: 20,
      // width: 20,
    ),
  );

  //
  // -----------------------------------------------------
  //

  static Widget greenTickIcon = SvgPicture.asset(
    'assets/images/svg_images/global/green_tick.svg',
  );
  static Widget greyTickIcon = SvgPicture.asset(
    'assets/images/svg_images/global/grey_tick.svg',
  );

  static Widget blueTimeIcon = SvgPicture.asset(
    'assets/images/svg_images/global/time_icon.svg',
    color: Color(0xff2c3d73),
    height: 15,
    width: 15,
  );

  static Widget redTimeIcon = SvgPicture.asset(
    'assets/images/svg_images/global/time_icon.svg',
    color: Color(0xffFF1717),
    height: 15,
    width: 15,
  );
  static Widget greyTimeIcon = SvgPicture.asset(
    'assets/images/svg_images/global/time_icon.svg',
    color: Colors.grey,
    height: 12,
    width: 12,
  );
}
