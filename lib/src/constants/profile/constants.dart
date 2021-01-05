// // Project: JeansWest App
// // Created by: Koorosh Karimnia
// // Email: KooroshKarimnia@gmail.com
// // Date: 2020-09-13
// // Time: 11:56 AM
//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/support_page.dart';

import 'svg_images/profile_svg_images.dart';

List<String> mainProfileListTitles = [
  "profile_screen.jean_points_and_coupons".tr(),
  "profile_screen.my_orders".tr(),
  "profile_screen.favourite_list".tr(),
  "profile_screen.my_addresses".tr(),
  "profile_screen.friends".tr(),
  "profile_screen.info_account".tr(),
  "profile_screen.exit_from_account".tr(),
];
List<Widget> mainProfileListIcons = [
  ProfileSvgImages.largeGiftIcon,
  ProfileSvgImages.myOrdersIcon,
  ProfileSvgImages.favoriteIcon,
  ProfileSvgImages.addressesIcon,
  ProfileSvgImages.friendsIcon,
  ProfileSvgImages.profileIcon,
  ProfileSvgImages.exitIcon,
];
List<Widget> mainProfileListWidgets = [
  // JeanpointsAndCouponsScreen(),
  Container(),
  // OrderListScreen(),
  Container(),
  // FavoritesListScreen(),
  Container(),
  // AddressesListScreen(),
  Container(),
  // FriendsScreen(),
  Container(),
  // AccountInfoScreen(
  //   initPanelState: PanelState.CLOSED,
  // ),
  Container(),
// exit
  Container(),
];

List<String> moreListTitles = [
  "profile_screen.support".tr(),
  "profile_screen.about_us".tr(),
  "profile_screen.return_procedure".tr(),
];
List<Widget> moreListIcons = [
  // Icons.support_agent_outlined,
  ProfileSvgImages.supportIcon,
  // Icons.info_outline,
  ProfileSvgImages.aboutUsIcon,
  // Icons.accessible_outlined,
  ProfileSvgImages.backBuyingIcon,
];
List<Widget> moreListWidgets = [
  // Container(),
  SupportPage(),
  Container(),
  // AboutUsScreen(),
  Container(),
  // ReturnProcedureScreen(),
];
