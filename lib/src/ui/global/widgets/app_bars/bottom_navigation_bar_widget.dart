import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/size_constants.dart';
import 'package:jeanswest/src/constants/global/svg_images/bottom_navigation_bar_svg_images.dart';

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
    return SizedBox(
      height: BOTTOM_NAVIGATION_BAR_HEIGHT,
      child: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: MAIN_BLUE_COLOR,
        selectedFontSize: 13,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 0
                ? BottomNavigationBarSvgImages.enableHomeIcon
                : BottomNavigationBarSvgImages.disableHomeIcon,
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.home".tr(),
            ),
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 1
                ? BottomNavigationBarSvgImages.enableBranchIcon
                : BottomNavigationBarSvgImages.disableBranchIcon,
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.branches".tr(),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store_mall_directory_outlined,
              color: widget.selectedIndex == 2 ? MAIN_BLUE_COLOR : Colors.grey,
              size: widget.selectedIndex == 2 ? 23 : 20,
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
                ? BottomNavigationBarSvgImages.enableShoppingBasketIcon
                : BottomNavigationBarSvgImages.disableShoppingBasketIcon,
            // ignore: deprecated_member_use
            title: Text(
              "bottom_navigation_bar_widget.shopping_basket".tr(),
            ),
          ),
          BottomNavigationBarItem(
            icon: widget.selectedIndex == 4
                ? BottomNavigationBarSvgImages.enableProfileIcon
                : BottomNavigationBarSvgImages.disableProfileIcon,
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
