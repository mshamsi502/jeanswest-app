// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/profile_appbar_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

import 'file:///D:/MyProjects/%23AvaKatan/mobile_jeanswest_app_android/lib/src/constants/test_data/levels_card.dart';

class MainProfilePage extends StatefulWidget {
  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  AnimationController animationController;

  double cHeight = 150;
  Color fadeBlackColor;
  double itemHeight = 100;
  double itemsCount = 14;
  ScrollController listViewScrollController;
  //
  int moneyBuying;
  LevelCard userLevel;
  LevelCard nextLevel;
  LevelCard preLevel;

  @override
  void initState() {
    super.initState();

    //
    // moneyBuying = 50000; // zero level
    // moneyBuying = 17000000; // infinty level
    //
    // moneyBuying = 199000; // in limit before 200,000
    // moneyBuying = 200000; // in limit center 200,000
    // moneyBuying = 205000; // in limit after 200,000
    // moneyBuying = 700000; // blue level
    //
    // moneyBuying = 1495000; // in limit before 1,500,000
    // moneyBuying = 1500000; // in limit center 1,500,000
    // moneyBuying = 1501000; // in limit after 1,500,000
    // moneyBuying = 2000000; // blue + level
    //
    //
    // moneyBuying = 2950000; // in limit before 3,000,000
    // moneyBuying = 3000000; // in limit center 3,000,000
    // moneyBuying = 3010000; // in limit after 3,000,000
    moneyBuying = 4000000; // blue 2+ level
    //
    // moneyBuying = 4950000; // in limit before 5,000,000
    // moneyBuying = 5000000; // in limit center 5,000,000
    // moneyBuying = 5005000; // in limit after 5,000,000
    // moneyBuying = 8600000; // silver level
    //
    // moneyBuying = 14950000; // in limit before 15,000,000
    // moneyBuying = 15000000; // in limit center 15,000,000
    // moneyBuying = 15100000; // in limit after 15,000,000
    // moneyBuying = 17500000; // gold level
    // moneyBuying = 100000000; // gold level
    //
    //

    userLevel = moneyBuying < int.parse(goldLevel.minPay)
        ? moneyBuying < int.parse(silverLevel.minPay)
            ? moneyBuying < int.parse(blueTwoPlusLevel.minPay)
                ? moneyBuying < int.parse(bluePlusLevel.minPay)
                    ? moneyBuying < int.parse(blueLevel.minPay)
                        ? zeroLevel
                        : blueLevel
                    : bluePlusLevel
                : blueTwoPlusLevel
            : silverLevel
        : goldLevel;
    print('moneyBuying : $moneyBuying');
    print('userLevel : ${userLevel.title}');
    //

    for (var i = 0; i < levels.length; i++) {
      if (levels[i].title == userLevel.title) {
        setState(() {
          if (userLevel.title == infinityLevel.title)
            nextLevel = infinityLevel;
          else
            nextLevel = levels[i + 1];
          if (userLevel.title == zeroLevel.title) {
            preLevel = zeroLevel;
          } else {
            preLevel = levels[i - 1];
          }
        });

        break;
      }
    }
    //
    scrollController = new ScrollController();
    if (scrollController.hasClients) scrollController.jumpTo(10.0);

    animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2000));

    fadeBlackColor = Colors.black;
    scrollController.addListener(onScroll);
  }

  onScroll() {
    setState(() {
      cHeight =
          (30000 + scrollController.offset) / (scrollController.offset + 200);
      fadeBlackColor =
          cHeight < 120 ? Colors.transparent : fadeColor('000000', cHeight);
    });
    // print('he :  $cHeight');
    // print('co :  $buttonColor');
  }

  // @override
  // void dispose() {
  //   animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      height: screenSize.height - 60,
      child: DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: 1,
          maxChildSize: 1,
          builder: (context, scrollController) {
            return Container(
              child: Scaffold(
                body: NestedScrollView(
                  controller: this.scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        // backgroundColor: Colors.white,
                        backgroundColor: F7_BACKGROUND_COLOR,
                        toolbarHeight: 45,
                        title: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
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
                                onTap: () {},
                              ),
                              AvakatanButtonWidget(
                                icon: ProfileSvgImages.messageIcon,
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
                        pinned: true,
                        floating: true,
                        elevation: 5,
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: Container(
                      color: F7_BACKGROUND_COLOR,
                      // color: Colors.amberAccent,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.grey[200],
                            child: Column(
                              children: [
                                ProfileAppBarWidget(),
                                // MembershipCardWidget(
                                //   userLevel: userLevel,
                                //   moneyBuying: moneyBuying,
                                //   nextLevel: nextLevel,
                                //   preLevel: preLevel,
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: screenSize.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: new AssetImage(
                                                'assets/images/invite_friends.png'),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 20,
                                        child: Text(
                                          "profile_screen.invite_friends".tr(),
                                        ),
                                      )
                                    ],
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
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                          // MenuListViewWidget(),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
