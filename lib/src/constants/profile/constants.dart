// // Project: JeansWest App
// // Created by: Koorosh Karimnia
// // Email: KooroshKarimnia@gmail.com
// // Date: 2020-09-13
// // Time: 11:56 AM
//
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/ui/profile/screens/support_page.dart';

import 'svg_images/profile_svg_images.dart';
//
// const String TOKEN = 'token';
// const String BASE_URL_FOR_BRANCH_ADDRESS = 'https://jeanswest.club';
// const int RECEIVE_TIMEOUT = 5000;
// const int CONNECT_TIMEOUT = 5000;
// const Duration POPUP_INFO_BRANCH_DURATION_ANIMATION =
//     Duration(milliseconds: 300);
// const Duration POPUP_LIST_VIEW_BRANCH_DURATION_ANIMATION =
//     Duration(milliseconds: 700);
// const Color MAIN_BLUE_COLOR = MAIN_BLUE_COLOR;
// const TextDirection rtlTextDirection = TextDirection.rtl;
// const TextDirection ltrTextDirection = TextDirection.ltr;
// //
//
//
// /// for Test
//
// Branch banimodeLocation = new Branch(
//   departmentInfoID: '1113',
//   depName: 'فروشگاه انلاین بانی مد',
//   depAddress:
//       'تهران - جنت آباد مرکزی - خیابان دانش - خیابان عابدی - خیابان شهید محمد نوروزی - پلاک 5',
//   depTel: '02191070544',
//   isActive: 1,
//   locationPoint: '35.753539,51.335078',
//   lat: '35.7536',
//   lng: '51.3051',
//   distance: 459235,
//   distanceDesc: '459.2 کیلومتر از شما فاصله دارد.',
//   workTime: 'همه روزه از 10 تا 22',
// );

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
