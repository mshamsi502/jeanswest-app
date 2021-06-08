// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  15:30 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-tickets-info.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-data.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';
import 'package:jeanswest/src/models/profile/user/user-copouns-info.dart';
import 'package:jeanswest/src/ui/profile/screens/userAddresses/addresses-list-page.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/ui/profile/screens/userAccountInfo/account_info_screen.dart';
import 'package:jeanswest/src/ui/profile/screens/tab_bar_view_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/membership_level_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/jeanpoint_and_coupons_page.dart';
import 'package:jeanswest/src/ui/profile/screens/orderList/order_list_screen.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/about_us_page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/support_page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/return_process_page.dart';
import 'package:jeanswest/src/ui/profile/screens/favoritesList/favorites-list-screen.dart';
import 'package:jeanswest/src/constants/global/globalInstances/return-policy-data.dart';
import 'package:jeanswest/src/constants/global/globalInstances/about-us-data.dart';

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-favorites-info.dart';

import 'dart:io';

import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/extra.dart' as android_extra;

List<Widget> createProfileListMenuPages({
  // Size screenSize,
  SingleLevelCard userLevel,
  // LevelCard userLevel,
  String userLevelName,
  SingleLevelCard nextLevel,
  // LevelCard nextLevel,
  String imageType,
  String assetsLevelCard,
  int moneyBuying,
  Function() rebuild,
}) {
  // ignore: deprecated_member_use
  List<Widget> profileListMenu = new List<Widget>();

  profileListMenu.add(
    TabBarViewPage(
      title: 'سطح عضویت',
      selectedTab: 1,
      tabTitles: [
        'سطح عضویت من',
        ' جین پوینت ها و بن ها',
      ],
      tabWidgets: [
        MembershipLevelPage(
          userLevelName: userLevelName,
          userLevel: userLevel,
          nextLevel: nextLevel,
          moneyBuying: moneyBuying,
          imageType: imageType,
          assetsLevelCard: assetsLevelCard,
        ),
        JeanpointAndCouponsPage(
            // ignore: deprecated_member_use
            userJeanpointBons: userJeanpointBons ?? List<UserCouponsInfo>()),
      ],
      bottomButtonFunction: () {},
    ),
  );
  profileListMenu.add(OrderListScreen());
  profileListMenu.add(FavoritesListScreen(
    title: "علاقه مندی ها",
    products: userFavorites,
  ));
  profileListMenu.add(AddressesListPage(
    title: 'لیست آدرس ها',
    // screenSize: screenSize,
  ));

  profileListMenu.add(
    AccountInfoScreen(
        title: 'جزئیات حساب کاربری',
        userAccountInfo: user,
        updateUser: (UserMainInfo userMainInfo) async {
          // user = userMainInfo;

          rebuild();
        }),
  );

  return profileListMenu;
}

List<Widget> createMoreListMenuPages(
    {@required Function(List<DataTicket>) updateUserTickets}) {
  // ignore: deprecated_member_use
  List<Widget> profileListMenu = new List<Widget>();
  profileListMenu.add(SupportPage(
    userTickets: userTickets,
    // updateUserTickets: (List<DataTicket> tickets) => userTickets = tickets,
    updateUserTickets: updateUserTickets,
  ));
  profileListMenu.add(AboutUsPage(
    aboutUsData: aboutUsData,
  ));
  profileListMenu.add(ReturnProcessPage(
    initialTab: 0,
    returnProciyData: returnPolicyData,
  ));
  return profileListMenu;
}

bottomButtonFunction(String textLink) {
  // String link = 'club.avakatan.ir/public/jeanswest.apk';
  // String text = 'به جین وست ملحق شو :)\n$link';

  if (Platform.isAndroid) {
    android_intent.Intent()
      ..setAction(android_action.Action.ACTION_SEND)
      ..setType('text/plain')
      ..putExtra(android_extra.Extra.EXTRA_TEXT, textLink)
      ..startActivity().catchError((e) => print(e));
  }

  // ignore: unused_element

  //  else if (Platform.isIOS) {
  //   // IOS Intent to Map Apps
  //   //   "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"
  //   Uri.parse(
  //       'comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit');
  // } else {
  //   // Other OS Intent to Map Apps
  // }
}

UserMainInfo createUser({
  @required UserMainInfoData userAccount,
  String userTblPosCustRes,
  String dateFormat = STANDARD_DATE_FORMAT,
}) {
  DateTime parseDate = new DateFormat(dateFormat).parse(userAccount.birthDate);
  print('_=_ create user success');
  return UserMainInfo(
    code: userAccount.code,
    tblPosCustomersID: userTblPosCustRes,
    firstName: userAccount.firstName,
    lastName: userAccount.lastName,
    erpPartnerShipCode: userAccount.erpPartnerShipCode,
    email: userAccount.email,
    gender: userAccount.gender,
    phoneNumber: userAccount.phoneNumber,
    yearOfBirthGeo: parseDate.year.toString(),
    monthOfBirthGeo: parseDate.month.toString(),
    dayOfBirthGeo: parseDate.day.toString(),
  );
}
