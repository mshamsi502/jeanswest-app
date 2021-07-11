// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/bottom_navigation_bar_svg_images.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) updateProp;

  const BottomNavigationBarWidget({
    Key key,
    this.selectedIndex,
    this.updateProp,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return SizedBox(
      // height: BOTTOM_NAVIGATION_BAR_HEIGHT,
      height: 0.09 * _screenSize.height, // 58,
      child: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: MAIN_BLUE_COLOR,
        selectedFontSize: 0.02 * _screenSize.height, //13,
        unselectedFontSize: 0.017 * _screenSize.height, //11,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 0
                ? SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: BottomNavigationBarSvgImages.enableHomeIcon)
                : SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: BottomNavigationBarSvgImages.disableHomeIcon),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.home".tr(),
            ),
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 1
                ? SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: BottomNavigationBarSvgImages.enableBranchIcon)
                : SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: BottomNavigationBarSvgImages.disableBranchIcon),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.branches".tr(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_mall_directory_outlined,
              color: widget.selectedIndex == 2 ? MAIN_BLUE_COLOR : Colors.grey,
              size: widget.selectedIndex == 2
                  ? 0.035 * _screenSize.height //23
                  : 0.031 * _screenSize.height, //20,
            ),
            // widget.selectedIndex == 2
            //     ? BottomNavigationBarSvgImages.enableBranchIcon
            //     : BottomNavigationBarSvgImages.disableBranchIcon,
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.store".tr(),
            ),
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 3
                ? SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: GlobalSvgImages.enableShoppingBasketIcon)
                : SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: GlobalSvgImages.disableShoppingBasketIcon),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.shopping_basket".tr(),
            ),
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 4
                ? SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: BottomNavigationBarSvgImages.enableProfileIcon)
                : SizedBox(
                    width: 0.035 * _screenSize.height, //23,
                    height: 0.035 * _screenSize.height, //23,
                    child: BottomNavigationBarSvgImages.disableProfileIcon),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.profile".tr(),
            ),
          )
        ],
        currentIndex: widget.selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) async {
    int _selectedIndex = widget.selectedIndex;
    if (widget.selectedIndex == index)
      return;
    else {
      setState(() {
        _selectedIndex = index;
      });
    }
    widget.updateProp(_selectedIndex);
  }
}
