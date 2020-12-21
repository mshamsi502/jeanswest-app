// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-12  ,  06:49 PM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarSvgImages {
  BottomNavigationBarSvgImages._();

  //
  // -----------------------------------------------------
  //

  static Widget disableHomeIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/home_icon.svg',
    color: Colors.grey,
    width: 20,
    height: 20,
  );
  static Widget enableHomeIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/home_icon.svg',
    color: Color(0xff2c3d73),
    width: 23,
    height: 23,
  );

  static Widget disableBranchIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/branch_icon.svg',
    color: Colors.grey,
    width: 20,
    height: 20,
  );
  static Widget enableBranchIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/branch_icon.svg',
    color: Color(0xff2c3d73),
    width: 23,
    height: 23,
  );

  //----------------------------------------

  static Widget moreIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/more_icon.svg',
    color: Color(0xff2c3d73),
    width: 20,
    height: 20,
  );

  //----------------------------------------

  static Widget disableShoppingBasketIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/shopping_basket_icon.svg',
    color: Colors.grey,
    width: 20,
    height: 20,
  );
  static Widget enableShoppingBasketIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/shopping_basket_icon.svg',
    color: Color(0xff2c3d73),
    width: 23,
    height: 23,
  );

  static Widget disableProfileIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/profile_icon.svg',
    color: Colors.grey,
    width: 20,
    height: 20,
  );
  static Widget enableProfileIcon = SvgPicture.asset(
    'assets/images/svg_images/global/bottom_navigation_bar/profile_icon.svg',
    color: Color(0xff2c3d73),
    width: 23,
    height: 23,
  );
}
