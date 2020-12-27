//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';

class MenuListViewWidget extends StatefulWidget {
  const MenuListViewWidget({
    Key key,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MenuListViewWidgetState();
}

class _MenuListViewWidgetState extends State<MenuListViewWidget> {
  ScrollController _scrollController;
  List<String> titles = [
    "profile_screen.my_orders".tr(),
    "profile_screen.favourite_list".tr(),
    "profile_screen.my_addresses".tr(),
    "profile_screen.friends".tr(),
    "profile_screen.jean_points_and_coupons".tr(),
    "profile_screen.info_account".tr(),
    "profile_screen.exit_from_account".tr(),
    "profile_screen.support".tr(),
    "profile_screen.about_us".tr(),
    "profile_screen.return_procedure".tr(),
  ];
  // List<IconData> icons = [
  List<Widget> icons = [
    // Icons.shopping_bag_outlined,
    ProfileSvgImages.myOrdersIcon,
    // Icons.favorite_border,
    ProfileSvgImages.favoriteIcon,
    // Icons.map_outlined,
    ProfileSvgImages.addressesIcon,
    // Icons.child_friendly,
    ProfileSvgImages.friendsIcon,
    // Icons.card_giftcard_outlined,
    ProfileSvgImages.largeGiftIcon,
    // Icons.person_outline,
    ProfileSvgImages.profileIcon,
    // Icons.support_agent_outlined,
    ProfileSvgImages.exitIcon,
    // Icons.support_agent_outlined,
    ProfileSvgImages.supportIcon,
    // Icons.info_outline,
    ProfileSvgImages.aboutUsIcon,
    // Icons.accessible_outlined,
    ProfileSvgImages.backBuyingIcon,
  ];

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dpiSize = MediaQuery.of(context).devicePixelRatio;
    List<Widget> widgets = [
      // OrderListScreen(),
      // FavoritesListScreen(),
      // AddressesListScreen(),
      // FriendsScreen(),
      // JeanpointsAndCouponsScreen(),
      // AccountInfoScreen(
      //   initPanelState: PanelState.CLOSED,
      // ),
      Container(),
      // SupportScreen(dpiSize: dpiSize),
      // AboutUsScreen(),
      // ReturnProcedureScreen(),
    ];

    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              color: Colors.white,
              height: 60,
              child: ListTile(
                title: Align(
                  alignment: context.locale.toString() == 'en_US'
                      ? Alignment(-1.15, -0.2)
                      : Alignment(1.15, -0.3),
                  child: Container(
                    width: 170,
                    // color: Colors.red,
                    child: Text(
                      titles[index],
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color:
                            index == 6 ? Color(0xffF51F1F) : Color(0xff323B56),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.grey[400],
                ),
                leading: Container(
                  height: 25,
                  width: 25,
                  child: icons[index],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => widgets[index],
                    ),
                  );
                },
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.3,
              indent: 60,
              height: 2,
            ),
          ],
        );
      },
    );
  }
}
