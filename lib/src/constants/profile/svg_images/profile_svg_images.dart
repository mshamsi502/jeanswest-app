// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-12  ,  06:49 PM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeanswest/src/constants/global/colors.dart';

class ProfileSvgImages {
  ProfileSvgImages._();

  //
  // -----------------------------------------------------
  //

  static Widget aboutUsIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/about_us.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget addressesIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/addresses.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget backBuyingIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/back_buying.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget favoriteIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/favorite.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget friendsIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/friends.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget smallGiftIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/gift.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget largeGiftIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/gift.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget helpIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/help.svg',
    color: MAIN_BLUE_COLOR,
    height: 12,
    width: 12,
  );

  static Widget messageIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/message.svg',
    color: MAIN_BLUE_COLOR,
    height: 20,
    width: 20,
  );

  static Widget myWhiteBarcodeIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/my_barcode.svg',
    // color: MAIN_BLUE_COLOR
    color: Colors.white,
    height: 18,
    width: 18,
  );
  static Widget myBlueBarcodeIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/my_barcode.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget myOrdersIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/my_orders.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget notificationIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/notification.svg',
    color: MAIN_BLUE_COLOR,
    height: 20,
    width: 20,
  );
  static Widget horMoreIcon = SvgPicture.asset(
    'assets/images/svg_images/global/hor_more_icon.svg',
    color: MAIN_BLUE_COLOR,
    width: 10,
    height: 10,
  );

  static Widget pointerIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/pointer.svg',
    // color: MAIN_BLUE_COLOR,
    height: 13,
    width: 13,
  );

  static Widget profileIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/profile.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );
  static Widget exitIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/exit.svg',
    color: Color(0xffF51F1F),
    height: 18,
    width: 18,
  );

  static Widget supportIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/support.svg',
    color: MAIN_BLUE_COLOR,
    height: 18,
    width: 18,
  );

  static Widget infinityIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/infinity.svg',
    color: Colors.black45,
    // height: 5,
    // width: 5,
  );

//
// -----------------------------------------------------
//

  static Widget starIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/invite_friends/star_icon.svg',
    // color: Colors.black45,
    height: 33,
    width: 33,
  );
  //
// -----------------------------------------------------
//

  static Widget couponIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/coupons_info/coupons.svg',
    // color: Colors.black45,
    height: 33,
    width: 33,
  );
  static Widget coinIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/coupons_info/coin.svg',
    // color: Colors.black45,
    height: 25,
    width: 25,
  );
  //
// -----------------------------------------------------
//

  static Widget blueSendToRightIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/more/send.svg',
    color: MAIN_BLUE_COLOR,
    // height: 20,
    // width: 20,
  );
  static Widget blueSendToLeftIcon = RotatedBox(
    quarterTurns: -3,
    child: SvgPicture.asset(
      'assets/images/svg_images/profile/more/send.svg',
      color: MAIN_BLUE_COLOR,
      // height: 20,
      // width: 20,
    ),
  );

  static Widget greySendToRightIcon = SvgPicture.asset(
    'assets/images/svg_images/profile/more/send.svg',
    color: Colors.grey[300],
    // height: 20,
    // width: 20,
  );
  static Widget greySendToLeftIcon = RotatedBox(
    quarterTurns: -3,
    child: SvgPicture.asset(
      'assets/images/svg_images/profile/more/send.svg',
      color: Colors.grey[300],
      // height: 20,
      // width: 20,
    ),
  );
}
