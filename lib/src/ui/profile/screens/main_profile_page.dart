// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/profile/constants.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-payment-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-invite-info.dart';
import 'package:jeanswest/src/constants/test_data/texts.dart';
// import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-friends-info.dart';
//
import 'package:jeanswest/src/constants/test_data/user_messages.dart';
import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/invite_friend_page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_page.dart';
import 'package:jeanswest/src/ui/profile/screens/userAccountInfo/account_info_screen.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/membership_card_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/menu_list_view_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/auth_profile_appbar_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/unauth_profile_appbar_widget.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_level.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_main_profile.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'main_menu_list/inbox_page.dart';

class MainProfilePage extends StatefulWidget {
  final bool isAuth;
  final bool showCompeletProfileMessage;
  final Function(bool) changeCompeletProfileMessage;

  const MainProfilePage({
    Key key,
    this.isAuth,
    this.showCompeletProfileMessage,
    this.changeCompeletProfileMessage,
  }) : super(key: key);
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
  //
  int percentCompleteProfile;

  @override
  void initState() {
    super.initState();
    percentCompleteProfile = 100;
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
      buildProfile();
      moreListMenu = createMoreListMenuPages();
    }
  }

  buildProfile() {
    percentCompleteProfile = 100;
    if (user.firstName == null || user.firstName == '') {
      print(' 10 : firstName is empty');
      percentCompleteProfile = percentCompleteProfile - 10;
    }
    if (user.lastName == null || user.lastName == '') {
      print(' 10 : lastName is empty');
      percentCompleteProfile = percentCompleteProfile - 10;
    }
    if (user.email == null || user.email == '') {
      print(' 20 : email is empty');
      percentCompleteProfile = percentCompleteProfile - 20;
    }
    if (user.gender == null ||
        user.gender.perName == null ||
        user.gender.perName == '') {
      print(' 20 : gender is empty');
      percentCompleteProfile = percentCompleteProfile - 20;
    }
    if (user.dayOfBirth == null ||
        user.dayOfBirth == '' ||
        user.monthOfBirth == null ||
        user.monthOfBirth == '' ||
        user.yearOfBirth == null ||
        user.yearOfBirth == '') {
      print(' 20 : dateOfBirth is empty');
      percentCompleteProfile = percentCompleteProfile - 20;
    }
    print('percentCompleteProfile : $percentCompleteProfile %');
    mainProfileListMenu = createProfileListMenuPages(
      userLevel: userLevel,
      nextLevel: nextLevel,
      moneyBuying: userPayment.moneyBuying,
      rebuild: () => buildProfile(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: F7_BACKGROUND_COLOR,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          child: Column(
            children: [
              widget.isAuth
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.027 * _screenSize.width,
                        horizontal: 0.041 * _screenSize.width, //15,
                      ),
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
                            radius: 0.138 * _screenSize.width, //50,
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
                                radius: 0.138 * _screenSize.width, //50,
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
              // widget.showCompeletProfileMessage
              widget.isAuth && showCompeletProfileMessage
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 0.041 * _screenSize.width, //15,
                      ),
                      height: 0.19425 * _screenSize.height, //115,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          0.011 * _screenSize.width, //4,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                // color: Colors.red,
                                child: GestureDetector(
                                  child: Container(
                                    width: 0.05 * _screenSize.width, //18,
                                    height: 0.05 * _screenSize.width, //18,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 0.016 * _screenSize.height, //10
                                      horizontal:
                                          0.0333 * _screenSize.width, //12,
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: BLUE_SKY_FADE_COLOR,
                                      borderRadius: BorderRadius.circular(
                                        0.138 * _screenSize.width, //50,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      size: 0.038 * _screenSize.width, //14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  onTap: () => setState(() {
                                    showCompeletProfileMessage = false;
                                    print('closing');
                                    widget.changeCompeletProfileMessage(false);
                                  }),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.041 * _screenSize.width, //15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'اطلاعات حساب کاربری خود را تکمیل کنید',
                                  style: TextStyle(
                                    fontSize: 0.03 * _screenSize.width, //11
                                  ),
                                ),
                                AvakatanButtonWidget(
                                  backgroundColor: MAIN_BLUE_COLOR,
                                  textColor: Colors.white,
                                  borderColor: MAIN_BLUE_COLOR,
                                  hasShadow: false,
                                  title: 'تکمیل اطلاعات',
                                  height: 0.04729 * _screenSize.height, //28
                                  width: 0.27 * _screenSize.width, //100,
                                  radius: 0.011 * _screenSize.width, //4,
                                  fontSize: 0.03 * _screenSize.width, //11
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AccountInfoScreen(
                                          title: 'جزئیات حساب کاربری',
                                          userAccountInfo: user,
                                          updateUser:
                                              (UserMainInfo userMainInfo) {
                                            user = userMainInfo;
                                            buildProfile();
                                          }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.023 * _screenSize.height, //15,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.019 * _screenSize.width, //7
                            ),
                            child: GestureDetector(
                              child: Row(
                                children: [
                                  Text(
                                    '$percentCompleteProfile%',
                                    style: TextStyle(
                                      fontSize: 0.027 * _screenSize.width, //10,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      percent: percentCompleteProfile / 100,
                                      progressColor: Color(0xff32BE93),
                                      animation: true,
                                      restartAnimation: true,
                                      curve: Curves.linear,
                                      animationDuration: 3200,
                                      lineHeight:
                                          0.011 * _screenSize.height, //7
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountInfoScreen(
                                      title: 'جزئیات حساب کاربری',
                                      userAccountInfo: user,
                                      updateUser: (UserMainInfo userMainInfo) {
                                        user = userMainInfo;
                                        buildProfile();
                                      }),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.023 * _screenSize.height, //15,
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: 0.03125 * _screenSize.height, //20
              ),
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
                                borderRadius: BorderRadius.circular(
                                  0.027 * _screenSize.width, //10,
                                ),
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
                                  builder: (context) => InviteFrindePage(
                                    title: 'دعوت دوستان',
                                    userId: 'user-${user.phoneNumber}',
                                    receivedGift: userInvite.receivedGift,
                                    someOfInvited: userInvite.someOfInvited,
                                    someOfInstallFromInvited:
                                        userInvite.someOfInstallFromInvited,
                                    someOfShoppingFromInvited:
                                        userInvite.someOfShoppingFromInvited,
                                    queFaq: friendsQueFaq,
                                    ansFaq: friendsAnsFaq,
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
                haveExit: widget.isAuth,
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
