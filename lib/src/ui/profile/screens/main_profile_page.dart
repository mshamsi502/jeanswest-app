// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';

import 'package:jeanswest/src/constants/global/globalInstances/profile/invite-friends-faq-data.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/level-cards-data.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-tickets-info.dart';

import 'package:jeanswest/src/constants/profile/constants.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';

import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-payment-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-invite-info.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';

import 'package:jeanswest/src/models/profile/user/user-main-info.dart';

import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/invite_friend_page.dart';
import 'package:jeanswest/src/ui/profile/screens/messages/inbox-message-page.dart';
import 'package:jeanswest/src/ui/profile/screens/more_page.dart';
import 'package:jeanswest/src/ui/profile/screens/userAccountInfo/account_info_screen.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/membership_card_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/menu_list_view_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/cards-info-widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/auth_profile_appbar_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/unauth_profile_appbar_widget.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_level.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_main_profile.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:jeanswest/src/ui/profile/widgets/global/log-out-panel-widget.dart';

class MainProfilePage extends StatefulWidget {
  final bool isAuth;
  // final Size screenSize;
  final bool showCompeletProfileMessage;
  final Function(bool) changeCompeletProfileMessage;

  const MainProfilePage({
    Key key,
    this.isAuth,
    this.showCompeletProfileMessage,
    this.changeCompeletProfileMessage,
    // this.screenSize,
  }) : super(key: key);
  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;

  PanelController logOutPanel;
  PanelController cardsInfoPanel;
  Color fadeBlackColor;
  ScrollController listViewScrollController;
  SingleLevelCard userLevel;
  String userLevelAssets;
  // LevelCard userLevel;
  String userLevelName;
  // LevelCard nextLevel;
  SingleLevelCard nextLevel;
  // LevelCard preLevel;
  bool haveUnreadMessage;
  List<Widget> mainProfileListMenu = [];
  List<Widget> moreListMenu;
  List<Widget> moreListWidgets;
  //
  int percentCompleteProfile;
  int showingCard = 0;
  //
  Map<String, dynamic> cardsInfoMap;

  @override
  void initState() {
    super.initState();

    // print("aaaaaaaaaaaaaaaaaaaaaaaaaa levelCardsData : $levelCardsData");
    cardsInfoMap = prepareMainCards(
      levelCards: levelCardsData,
      // screenSize: widget.screenSize,
    );
    // print("bbbbbbbbb");
    if (widget.isAuth) {
      percentCompleteProfile = 100;
      userLevelName = userPayment.cTypeName;
      // userLevel = userLevelProvider(userPayment.payToman);
      // nextLevel = nextLevelProvider(userLevel);
      userLevel = userLevelProvider(
        moneyBuying: userPayment.payToman,
        cardsInfo: levelCardsData,
      );
      // print("userlevel : $userLevel");
      nextLevel = nextLevelProvider(
        userLevel: userLevel,
        cardsInfo: levelCardsData,
      );

      userLevelAssets = userLevel.image;
      // print("nextLevel : $nextLevel");
      haveUnreadMessage = false;
      scrollController = new ScrollController();
      logOutPanel = new PanelController();
      cardsInfoPanel = new PanelController();
      // for (var i = 0; i < userMessages.length; i++) {
      buildProfile();
      // for (var i = 0; i < userNotifs.length; i++) {
      moreListMenu = createMoreListMenuPages(
          userTicketss: userTickets,
          updateUserTickets: (List<DataTicket> newTickets) {
            updateUserTickets(newTickets);
          });
      moreListWidgets = createMorePages(
          context: context,
          userTicketss: userTickets,
          updateUserTickets: (List<DataTicket> newTickets) {
            updateUserTickets(newTickets);
          });
      // }
    }
  }

  updateUserTickets(List<DataTicket> tickets) {
    setState(() {
      userTickets = tickets;
      print(
          "last ticket : ${userTickets[userTickets.length - 1].context[userTickets[userTickets.length - 1].context.length - 1].text}");
    });
  }

  buildProfile() {
    percentCompleteProfile = 100;
    if (user.firstName == null || user.firstName == '') {
      // print(' 10 : firstName is empty');
      percentCompleteProfile = percentCompleteProfile - 10;
    }
    if (user.lastName == null || user.lastName == '') {
      // print(' 10 : lastName is empty');
      percentCompleteProfile = percentCompleteProfile - 10;
    }
    if (user.email == null || user.email == '') {
      // print(' 20 : email is empty');
      percentCompleteProfile = percentCompleteProfile - 20;
    }
    if (user.gender == null) {
      // print(' 20 : gender is empty');
      percentCompleteProfile = percentCompleteProfile - 20;
    }
    if (user.dayOfBirthShamsi == null ||
        user.dayOfBirthShamsi == '' ||
        user.monthOfBirthShamsi == null ||
        user.monthOfBirthShamsi == '' ||
        user.yearOfBirthShamsi == null ||
        user.yearOfBirthShamsi == '') {
      // print(' 20 : dateOfBirth is empty');
      percentCompleteProfile = percentCompleteProfile - 20;
    }
    if (percentCompleteProfile == 100)
      widget.changeCompeletProfileMessage(false);
    // print('percentCompleteProfile : $percentCompleteProfile %');
    print("rebuild in main profile page");
    mainProfileListMenu = createProfileListMenuPages(
      // screenSize: widget.screenSize,
      userLevel: userLevel,
      userLevelName: userLevelName,
      nextLevel: nextLevel,
      imageType: getTypeFileLink(userLevelAssets),
      assetsLevelCard: userLevelAssets,
      moneyBuying: userPayment.payToman,
      rebuild: (UserMainInfo newUser) {
        setState(() {
          user = newUser;
        });
        buildProfile();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: F7_BACKGROUND_COLOR,
      child: SlidingUpPanel(
        controller: logOutPanel,
        minHeight: 0,
        maxHeight: 0.234 * _screenSize.height, //150,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            0.083 * _screenSize.width, //30
          ),
          topRight: Radius.circular(
            0.083 * _screenSize.width, //30
          ),
        ),
        panel: LogOutPanelWidget(
          height: 0.234 * _screenSize.height, //150,
          closeLogOutPanel: () => logOutPanel.close(),
        ),
        body: SlidingUpPanel(
          controller: cardsInfoPanel,
          minHeight: 0,
          maxHeight: 0.8445 * _screenSize.height, //500,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              0.083 * _screenSize.width, //30
            ),
            topRight: Radius.circular(
              0.083 * _screenSize.width, //30
            ),
          ),
          panel: CardsInfoWidget(
            levelCards: levelCardsData,
            cardsInfo: cardsInfoMap,
            // assetsLevelCard: assetsLevelCard,
            // levels: mainLevels,
            screenSize: _screenSize,
            closeCardsInfoPanel: () => cardsInfoPanel.close(),
            showingCard: showingCard,
            changeShowingCard: (int index) => setState(() {
              showingCard = index;
            }),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Container(
              // color: Colors.red,
              child: Column(
                children: [
                  widget.isAuth
                      ? Container(
                          padding: EdgeInsets.only(
                            top: 0.027 * _screenSize.width,
                            left: 0.041 * _screenSize.width, //15,
                            right: 0.041 * _screenSize.width, //15,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AvakatanButtonWidget(
                                icon: SizedBox(
                                    height: 0.069 * _screenSize.width, //25,
                                    width: 0.069 * _screenSize.width, //25,
                                    child: ProfileSvgImages.horMoreIcon),
                                backgroundColor: Colors.white,
                                height: 0.111 * _screenSize.width, //40,
                                width: 0.111 * _screenSize.width, //40,
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
                                        height: 0.069 * _screenSize.width, //25,
                                        width: 0.069 * _screenSize.width, //25,
                                        child:
                                            ProfileSvgImages.notificationIcon),
                                    backgroundColor: Colors.white,
                                    height: 0.111 * _screenSize.width, //40,
                                    width: 0.111 * _screenSize.width, //40,
                                    textColor: MAIN_BLUE_COLOR,
                                    radius: 0.138 * _screenSize.width, //50,
                                    borderColor: Colors.grey[200],
                                    hasShadow: true,
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InboxMessagePage(
                                                  changeHaveUnreadMessage:
                                                      changeHaveUnreadMessage,
                                                ))),
                                    // builder: (context) => InboxPage(
                                    //       changeHaveUnreadMessage:
                                    //           changeHaveUnreadMessage,
                                    //     ))),
                                  ),
                                  Positioned(
                                    bottom: 0.06 * _screenSize.width / 2,
                                    // right: 0.03 * _screenSize.width / 2,
                                    child: haveUnreadMessage
                                        ? Container(
                                            height:
                                                0.022 * _screenSize.width, //8,
                                            width:
                                                0.022 * _screenSize.width, //8,
                                            decoration: BoxDecoration(
                                              color: MAIN_GOLD_COLOR,
                                              borderRadius:
                                                  BorderRadius.circular(0.138 *
                                                          _screenSize.width //50
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
                            vertical: 0.016 * _screenSize.height, //10
                          ),
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
                                          vertical:
                                              0.016 * _screenSize.height, //10
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
                                        widget.changeCompeletProfileMessage(
                                            false);
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          builder: (context) =>
                                              AccountInfoScreen(
                                                  title: 'جزئیات حساب کاربری',
                                                  userAccountInfo: user,
                                                  updateUser: (UserMainInfo
                                                      userMainInfo) {
                                                    setState(() {
                                                      user = userMainInfo;
                                                    });

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
                                          fontSize:
                                              0.027 * _screenSize.width, //10,
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
                                          updateUser:
                                              (UserMainInfo userMainInfo) {
                                            setState(() {
                                              user = userMainInfo;
                                            });
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
                    height: 0.016 * _screenSize.height, //10
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 0.023 * _screenSize.width),
                    color: F7_BACKGROUND_COLOR,
                    child: Column(
                      children: [
                        widget.isAuth
                            ? AuthProfileAppBarWidget(
                                userLevel: userLevel,
                                userLevelName: userLevelName,
                                nextLevel: nextLevel,
                                imageType: getTypeFileLink(userLevelAssets),
                                assetsLevelCard: userLevelAssets,
                                moneyBuying: userPayment.payToman)
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
                                        // userId: 'user-${user.phoneNumber}',
                                        invitationCode: user.code,
                                        receivedGift: userInvite.receivedGift,
                                        someOfInvited: userInvite.someOfInvited,
                                        someOfInstallFromInvited:
                                            userInvite.someOfInstallFromInvited,
                                        someOfShoppingFromInvited: userInvite
                                            .someOfShoppingFromInvited,
                                        faq: inviteFriendsFAQ,
                                        screenSize: _screenSize,
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 0.023 * _screenSize.height, //15
                  ),
                  // GestureDetector(
                  //   child:
                  MembershipCardWidget(
                      showingCard: showingCard,
                      assetsLevelCard: cardsInfoMap["mainAssetsLevelCard"],
                      imageType: cardsInfoMap["imageType"],
                      changeShowingCard: (int index) => setState(() {
                            showingCard = index;
                            // print("--------showingCard : $showingCard");
                            if (cardsInfoPanel.isAttached &&
                                cardsInfoPanel.isPanelClosed)
                              cardsInfoPanel.open();
                          })),
                  // onTap: () => cardsInfoPanel.open(),
                  // ),
                  MenuListViewWidget(
                    titles:
                        widget.isAuth ? mainProfileListTitles : moreListTitles,
                    icons: widget.isAuth ? mainProfileListIcons : moreListIcons,
                    pages:
                        widget.isAuth ? mainProfileListMenu : moreListWidgets,
                    haveExit: widget.isAuth,
                    backgroundColor: F7_BACKGROUND_COLOR,
                    openLogOutPanel: () => logOutPanel.open(),
                    screenSize: _screenSize,
                  ),
                  SizedBox(
                    height: 0.14 * _screenSize.height, //90,
                  ),
                ],
              ),
            ),
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
