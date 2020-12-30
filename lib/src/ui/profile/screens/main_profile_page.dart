// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/constants.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/more_page.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/membership_card_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/menu_list_view_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/profile_appbar_widget.dart';

class MainProfilePage extends StatefulWidget {
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

  @override
  void initState() {
    super.initState();

    userLevel = moneyBuying < int.parse(goldLevel.minPay)
        ? moneyBuying < int.parse(silverLevel.minPay)
            ? moneyBuying < int.parse(blueTwoPlusLevel.minPay)
                ? moneyBuying < int.parse(bluePlusLevel.minPay)
                    ? blueLevel
                    : bluePlusLevel
                : blueTwoPlusLevel
            : silverLevel
        : goldLevel;
    print('moneyBuying : $moneyBuying');
    print('userLevel : ${userLevel.title}');
    //
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          color: F7_BACKGROUND_COLOR,
          // color: Colors.amberAccent,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AvakatanButtonWidget(
                      icon: ProfileSvgImages.horMoreIcon,
                      backgroundColor: Colors.white,
                      textColor: MAIN_BLUE_COLOR,
                      radius: 50,
                      borderColor: Colors.grey[200],
                      hasShadow: true,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MorePage(title: 'بیشتر'))),
                    ),
                    AvakatanButtonWidget(
                      icon: ProfileSvgImages.notificationIcon,
                      backgroundColor: Colors.white,
                      textColor: MAIN_BLUE_COLOR,
                      radius: 50,
                      borderColor: Colors.grey[200],
                      hasShadow: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: F7_BACKGROUND_COLOR,
                child: Column(
                  children: [
                    ProfileAppBarWidget(),
                    SizedBox(height: 10),
                    GestureDetector(
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: 85,
                        width: _screenSize.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: new AssetImage(
                                'assets/images/png_images/global/invite_friends.png'),
                          ),
                        ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             InviteFriendsScreen(
                        //               userId: 'user-9176509634',
                        //               receivedGift: 250000,
                        //               someOfInvited: 8,
                        //               someOfInstallFromInvited: 5,
                        //               someOfShoppingFromInvited: 3,
                        //             )));
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: MembershipCardWidget(
                  userLevel: userLevel,
                  nextLevel: nextLevel,
                  preLevel: preLevel,
                  moneyBuying: moneyBuying,
                ),
              ),
              MenuListViewWidget(
                titles: mainProfileListTitles,
                icons: mainProfileListIcons,
                widgets: mainProfileListWidgets,
                backgroundColor: F7_BACKGROUND_COLOR,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
