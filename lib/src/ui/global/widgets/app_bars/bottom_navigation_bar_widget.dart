// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

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
    return Container(
      color: Colors.white,
      // height: BOTTOM_NAVIGATION_BAR_HEIGHT,
      height: 0.093 * _screenSize.height, //60,
      child: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: MAIN_BLUE_COLOR,
        backgroundColor: Colors.white,
        selectedFontSize: 0.027 * _screenSize.width, //10,
        unselectedFontSize: 0.027 * _screenSize.width, //10,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0046 * _screenSize.height, //3,
              ),
              child: widget.selectedIndex == 0
                  ? SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-sr-home.svg',
                      color: MAIN_BLUE_COLOR,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    )
                  : SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-rr-home.svg',
                      color: Colors.grey,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    ),
            ),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.home".tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: 3),
              child: widget.selectedIndex == 1
                  ? SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-sr-marker.svg',
                      color: MAIN_BLUE_COLOR,
                      width: 0.054 * _screenSize.width, //20,
                      height: 0.054 * _screenSize.width, //20,
                    )
                  : SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-rr-marker.svg',
                      color: Colors.grey,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    ),
            ),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.branches".tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0046 * _screenSize.height, //3,
              ),
              child: widget.selectedIndex == 2
                  ? SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-sr-shop.svg',
                      color: MAIN_BLUE_COLOR,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    )
                  : SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-rr-shop.svg',
                      color: Colors.grey,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    ),
            ),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.store".tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0046 * _screenSize.height, //3,
              ),
              child: widget.selectedIndex == 3
                  ? SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-sr-shopping-cart.svg',
                      color: MAIN_BLUE_COLOR,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    )
                  : SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-rr-shopping-cart.svg',
                      color: Colors.grey,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    ),
            ),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.shopping_basket".tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 0.0046 * _screenSize.height, //3,
              ),
              child: widget.selectedIndex == 4
                  ? SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-sr-user.svg',
                      color: MAIN_BLUE_COLOR,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    )
                  : SvgPicture.asset(
                      'assets/images/svg_images/global/new/fi-rr-user.svg',
                      color: Colors.grey,
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                    ),
            ),
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.profile".tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
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
