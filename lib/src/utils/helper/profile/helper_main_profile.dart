// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  15:30 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/profile/screens/userAddresses/addresses-list-page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-friends-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-invite-info.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/invite_friend_page.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/user_friends_list_page.dart';
import 'package:jeanswest/src/ui/profile/screens/user_account_info/account_info_screen.dart';
import 'package:jeanswest/src/ui/profile/screens/tab_bar_view_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/membership_level_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/jeanpoint_and_coupons_page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/about_us_page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/support_page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/return_process_page.dart';
import 'package:jeanswest/src/ui/profile/screens/favoritesList/favorites-list-screen.dart';

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-favorites-info.dart';

import 'dart:io';

import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/extra.dart' as android_extra;

List<Widget> createProfileListMenuPages(
    LevelCard userLevel, LevelCard nextLevel, int moneyBuying) {
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
          userLevel: userLevel,
          nextLevel: nextLevel,
          moneyBuying: moneyBuying,
        ),
        JeanpointAndCouponsPage(),
      ],
      bottomButtonFunction: () {},
    ),
  );
  profileListMenu.add(Container());
  profileListMenu.add(FavoritesListScreen(
    title: "علاقه مندی ها",
    products: userFavorites,
  ));
  profileListMenu.add(AddressesListPage(
    title: 'لیست آدرس ها',
  ));
  profileListMenu.add(
    TabBarViewPage(
      title: 'دوستان',
      selectedTab: 1,
      tabTitles: [
        'دعوت دوست',
        'دوستان من',
      ],
      tabWidgets: [
        InviteFrindePage(
          userId: 'user-${user.phoneNumber}',
          receivedGift: userInvite.receivedGift,
          someOfInvited: userInvite.someOfInvited,
          someOfInstallFromInvited: userInvite.someOfInstallFromInvited,
          someOfShoppingFromInvited: userInvite.someOfShoppingFromInvited,
        ),
        UserFriendsListPage(
          friends: userFriends.friends,
        ),
      ],
      bottomButton: 'ارسال لینک',
      bottomButtonFunction: bottomButtonFunction,
    ),
  );
  profileListMenu.add(AccountInfoScreen(
    initPanelState: PanelState.CLOSED,
  ));
  return profileListMenu;
}

List<Widget> createMoreListMenuPages() {
  // ignore: deprecated_member_use
  List<Widget> profileListMenu = new List<Widget>();
  profileListMenu.add(SupportPage());
  profileListMenu.add(AboutUsPage());
  profileListMenu.add(ReturnProcessPage());
  return profileListMenu;
}

bottomButtonFunction() {
  String link = 'club.avakatan.ir/public/jeanswest.apk';
  String text = 'به جین وست ملحق شو :)\n$link';

  if (Platform.isAndroid) {
    android_intent.Intent()
      ..setAction(android_action.Action.ACTION_SEND)
      ..setType('text/plain')
      ..putExtra(android_extra.Extra.EXTRA_TEXT, text)
      ..startActivity().catchError((e) => print(e));
  }
  //  else if (Platform.isIOS) {
  //   // IOS Intent to Map Apps
  //   //   "comgooglemaps://?center=40.765819,-73.975866&zoom=14&views=traffic"
  //   Uri.parse(
  //       'comgooglemaps://?saddr=Google+Inc,+8th+Avenue,+New+York,+NY&daddr=John+F.+Kennedy+International+Airport,+Van+Wyck+Expressway,+Jamaica,+New+York&directionsmode=transit');
  // } else {
  //   // Other OS Intent to Map Apps
  // }
}
