// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/ui/profile/screens/tab_bar_view_page.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/invite_friend_page.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/user_friends_list_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/membership_level_page.dart';
import 'package:jeanswest/src/ui/profile/screens/membership/jeanpoint_and_coupons_page.dart';

class MenuListViewWidget extends StatefulWidget {
  final List<String> titles;
  final List<Widget> icons;
  final Color backgroundColor;
  final LevelCard userLevel;
  final LevelCard nextLevel;
  final int moneyBuying;
  const MenuListViewWidget({
    Key key,
    this.titles,
    this.icons,
    this.backgroundColor,
    this.userLevel,
    this.nextLevel,
    this.moneyBuying,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MenuListViewWidgetState();
}

class _MenuListViewWidgetState extends State<MenuListViewWidget> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('user.friends.lenght : ${user.friends.length}');
    var _screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: widget.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                openListMenu(
                  index,
                  widget.userLevel,
                  widget.nextLevel,
                  widget.moneyBuying,
                );
              },
              child: Container(
                color: widget.backgroundColor,
                // color: Colors.blue,
                height: 0.166 * _screenSize.width, //60,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Container(
                      // color: Colors.red,
                      height: 0.069 * _screenSize.width, //25,
                      width: 0.069 * _screenSize.width, //25,
                      child: widget.icons[index],
                    ),
                    Expanded(flex: 2, child: SizedBox()),
                    Container(
                      width: 0.472 * _screenSize.width, //170,
                      child: Text(
                        widget.titles[index],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: index == 6
                              ? Color(0xffF51F1F)
                              : Color(0xff323B56),
                          fontSize: 0.036 * _screenSize.width, //13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(flex: 10, child: SizedBox()),
                    Container(
                      width: 0.041 * _screenSize.width,
                      // color: Colors.greenAccent,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 0.041 * _screenSize.width, //15,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.001 * _screenSize.width, //0.3,
              indent: 0.166 * _screenSize.width, //60,,
              height: 2,
            ),
          ],
        );
      },
    );
  }

  openListMenu(
    int index,
    LevelCard userLevel,
    LevelCard nextLevel,
    int moneyBuying,
  ) {
    print('0.0.0.0.0.0.0.0');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        switch (index) {
          case 0:
            {
              return TabBarViewPage(
                title: 'سطح عضویت',
                selectedTab: 1,
                tabTitles: [
                  'سطح عضویت من',
                  ' جین پوینت ها و بن ها',
                ],
                tabWidgets: [
                  MembershipLevelPage(
                    userLevel: widget.userLevel,
                    nextLevel: widget.nextLevel,
                    moneyBuying: widget.moneyBuying,
                  ),
                  JeanpointAndCouponsPage(),
                ],
              );
            }
            break;
          case 4:
            {
              return TabBarViewPage(
                title: 'دوستان',
                selectedTab: 1,
                tabTitles: [
                  'دعوت دوست',
                  'دوستان من',
                ],
                tabWidgets: [
                  InviteFrindePage(
                    userId: 'user-${user.phoneNumber}',
                    receivedGift: user.receivedGift,
                    someOfInvited: user.someOfInvited,
                    someOfInstallFromInvited: user.someOfInstallFromInvited,
                    someOfShoppingFromInvited: user.someOfShoppingFromInvited,
                  ),
                  UserFriendsListPage(
                    friends: user.friends,
                  ),
                ],
                bottomButton: 'ارسال لینک',
              );
            }
            break;
          default:
            {
              return Container();
            }
            break;
        }
      }),
    );
  }
}
