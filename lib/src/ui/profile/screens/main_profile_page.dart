// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/constants.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';

import 'package:jeanswest/src/constants/global/userAllInfo.dart';
import 'package:jeanswest/src/constants/test_data/user_messages.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/invite_friend_page.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/user_friends_list_page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_page.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/membership_card_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/menu_list_view_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/auth_profile_appbar_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/unauth_profile_appbar_widget.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_level.dart';
import 'package:jeanswest/src/ui/profile/screens/tab_bar_view_page.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_main_profile.dart';

import 'main_menu_list/inbox_page.dart';

class MainProfilePage extends StatefulWidget {
  final bool isAuth;

  const MainProfilePage({Key key, this.isAuth}) : super(key: key);
  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;

  Color fadeBlackColor;
  ScrollController listViewScrollController;
  LevelCard userLevel;
  LevelCard nextLevel;
  LevelCard preLevel;
  bool haveUnreadMessage;
  List<Widget> mainProfileListMenu;
  List<Widget> moreListMenu;

  @override
  void initState() {
    super.initState();
    userLevel = userLevelProvider(userPayment.moneyBuying);
    nextLevel = nextLevelProvider(userLevel);
    haveUnreadMessage = false;
    for (var i = 0; i < userMessages.length; i++) {
      if (!userMessages[i].readed) {
        haveUnreadMessage = true;
        break;
      } else {
        haveUnreadMessage = false;
      }
      scrollController = new ScrollController();
      mainProfileListMenu = createProfileListMenuPages(
          userLevel, nextLevel, userPayment.moneyBuying);
      moreListMenu = createMoreListMenuPages();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: F7_BACKGROUND_COLOR,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          // color: Colors.amberAccent,

          child: Column(
            children: [
              widget.isAuth
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.027 * _screenSize.width, horizontal: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AvakatanButtonWidget(
                            icon: SizedBox(
                                height: 0.055 * _screenSize.width,
                                width: 0.055 * _screenSize.width,
                                child: ProfileSvgImages.horMoreIcon),
                            backgroundColor: Colors.white,
                            height: 0.09 * _screenSize.width,
                            width: 0.09 * _screenSize.width,
                            textColor: MAIN_BLUE_COLOR,
                            radius: 50,
                            borderColor: Colors.grey[200],
                            hasShadow: true,
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MorePage(
                                          title: 'بیشتر',
                                          pages: moreListMenu,
                                        ))),
                          ),
                          Stack(
                            children: [
                              AvakatanButtonWidget(
                                icon: SizedBox(
                                    height: 0.055 * _screenSize.width,
                                    width: 0.055 * _screenSize.width,
                                    child: ProfileSvgImages.notificationIcon),
                                backgroundColor: Colors.white,
                                height: 0.09 * _screenSize.width,
                                width: 0.09 * _screenSize.width,
                                textColor: MAIN_BLUE_COLOR,
                                radius: 50,
                                borderColor: Colors.grey[200],
                                hasShadow: true,
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => InboxPage(
                                              changeHaveUnreadMessage:
                                                  changeHaveUnreadMessage,
                                            ))),
                              ),
                              Positioned(
                                bottom: 0.06 * _screenSize.width / 2,
                                // right: 0.03 * _screenSize.width / 2,
                                child: haveUnreadMessage
                                    ? Container(
                                        height: 0.022 * _screenSize.width, //8,
                                        width: 0.022 * _screenSize.width, //8,
                                        decoration: BoxDecoration(
                                          color: MAIN_GOLD_COLOR,
                                          borderRadius: BorderRadius.circular(
                                              0.138 * _screenSize.width //50
                                              ),
                                        ),
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 0.023 * _screenSize.width),
                color: F7_BACKGROUND_COLOR,
                child: Column(
                  children: [
                    widget.isAuth
                        ? AuthProfileAppBarWidget(
                            userLevel: userLevel,
                            nextLevel: nextLevel,
                            moneyBuying: userPayment.moneyBuying)
                        : UnauthProfileAppBarWidget(),
                    widget.isAuth
                        ? GestureDetector(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 0.016 * _screenSize.width),
                              alignment: Alignment.center,
                              height: 0.15 * _screenSize.height,
                              width: _screenSize.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: new AssetImage(
                                      'assets/images/png_images/global/invite_friends.png'),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TabBarViewPage(
                                    title: 'دوستان',
                                    selectedTab: 0,
                                    tabTitles: [
                                      'دعوت دوست',
                                      'دوستان من',
                                    ],
                                    tabWidgets: [
                                      InviteFrindePage(
                                        userId: 'user-${user.phoneNumber}',
                                        receivedGift: userInvite.receivedGift,
                                        someOfInvited: userInvite.someOfInvited,
                                        someOfInstallFromInvited:
                                            userInvite.someOfInstallFromInvited,
                                        someOfShoppingFromInvited: userInvite
                                            .someOfShoppingFromInvited,
                                      ),
                                      UserFriendsListPage(
                                        friends: userFriends.friends,
                                      ),
                                    ],
                                    bottomButton: 'ارسال لینک',
                                    bottomButtonFunction: bottomButtonFunction,
                                  ),
                                ),
                              );
                            },
                          )
                        : Container()
                  ],
                ),
              ),
              GestureDetector(
                child: MembershipCardWidget(
                  userLevel: userLevel,
                  nextLevel: nextLevel,
                  preLevel: preLevel,
                  moneyBuying: userPayment.moneyBuying,
                ),
              ),
              MenuListViewWidget(
                titles: widget.isAuth ? mainProfileListTitles : moreListTitles,
                icons: widget.isAuth ? mainProfileListIcons : moreListIcons,
                pages: widget.isAuth ? mainProfileListMenu : moreListWidgets,
                backgroundColor: F7_BACKGROUND_COLOR,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  changeHaveUnreadMessage() {
    setState(() {
      haveUnreadMessage = false;
    });
  }
}
