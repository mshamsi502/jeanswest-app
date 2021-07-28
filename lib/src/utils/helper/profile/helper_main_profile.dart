// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  15:30 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-jeanpoints-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-main-info.dart';
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
import 'package:jeanswest/src/constants/global/globalInstances/profile/return-policy-data.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/about-us-data.dart';

import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-favorites-info.dart';

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
  Function(UserMainInfo) rebuild,
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
    // products: userFavorites,
  ));
  profileListMenu.add(AddressesListPage(
    title: 'لیست آدرس ها',
    // screenSize: screenSize,
  ));

  profileListMenu.add(
    AccountInfoScreen(
        title: 'جزئیات حساب کاربری',
        userAccountInfo: user,
        updateUser: (UserMainInfo userMainInfo) {
          // user = userMainInfo;

          rebuild(userMainInfo);
        }),
  );

  return profileListMenu;
}

List<Widget> createMoreListMenuPages({
  List<DataTicket> userTicketss,
  @required Function(List<DataTicket>) updateUserTickets,
}) {
  // ignore: deprecated_member_use
  List<Widget> profileListMenu = new List<Widget>();
  profileListMenu.add(SupportPage(
    // userTickets: userTicketss,
    // updateUserTickets: (List<DataTicket> tickets) => userTickets = tickets,
    updateUserTickets: (List<DataTicket> newTickets) =>
        updateUserTickets(newTickets),
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

UserMainInfo createUser({
  @required UserMainInfoData userAccount,
  String userTblPosCustRes,
  String dateFormat = STANDARD_DATE_FORMAT,
}) {
  print('birthDate : ${userAccount.birthDate}');
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
