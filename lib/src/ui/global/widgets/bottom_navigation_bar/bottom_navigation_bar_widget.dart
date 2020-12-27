import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/bottom_navigation_bar_svg_images.dart';

import 'file:///D:/MyProjects/%23AvaKatan/mobile_jeanswest_app_android/lib/src/constants/global/size_constants.dart';

import 'animated_more_button_widget.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final int catchSelectedIndex;
  final AnimationController controller;
  final Animation<double> animation;
  final Function(int, int) updateProp;

  const BottomNavigationBarWidget({
    Key key,
    this.selectedIndex,
    this.controller,
    this.catchSelectedIndex,
    this.updateProp,
    this.animation,
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
            // icon: SizedBox.shrink(),
            // // ignore: deprecated_member_use
            // title: AnimatedMoreButtonWidget(widget.selectedIndex,
            //     animation: widget.animation),
            icon: Column(
              children: [
                SizedBox(
                  height: widget.selectedIndex == 2 ? 0 : 3,
                ),
                AnimatedMoreButtonWidget(widget.selectedIndex,
                    animation: widget.animation),
                SizedBox(
                  height: widget.selectedIndex == 2 ? 0 : 4,
                ),
                widget.selectedIndex == 2
                    ? Container()
                    : Text(
                        "bottom_navigation_bar_widget.more".tr(),
                        style: TextStyle(color: Colors.black54, fontSize: 10),
                      ),
              ],
            ),
            // ignore: deprecated_member_use
            title: SizedBox.shrink(),
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
    int _catchSelectedIndex = widget.catchSelectedIndex;
    if (widget.selectedIndex == index && index != 2)
      return;
    else {
      setState(() {
        if (index == 2 && widget.controller.isDismissed) {
          // print("isDismissed");
          // print('index : $index');
          // print('_catchSelectedIndex : $_catchSelectedIndex');
          widget.controller.forward();
          _selectedIndex = index;

          // _pc.open();
        } else if (index == 2 && widget.controller.isCompleted) {
          // print("isCompleted");
          // print('index : $index');
          // print('_catchSelectedIndex : $_catchSelectedIndex');
          widget.controller.reverse();
          _selectedIndex = _catchSelectedIndex;
          // _pc.close();
        } else {
          widget.controller.reverse();
          // print('index : $index');
          // print('_catchSelectedIndex : $_catchSelectedIndex');
          if (index != 2) _catchSelectedIndex = index;
          // print('_catchSelectedIndex : $_catchSelectedIndex');
          _selectedIndex = index;
        }
      });
    }
    widget.updateProp(_selectedIndex, _catchSelectedIndex);
  }
}

List<Widget> getRandomWidgetArray() {
  // ignore: deprecated_member_use
  List<Widget> gameCells = List<Widget>();
  List<String> titleList = [
    "bottom_navigation_bar_widget.item_01".tr(),
    "bottom_navigation_bar_widget.item_02".tr(),
    "bottom_navigation_bar_widget.item_03".tr(),
    "bottom_navigation_bar_widget.item_04".tr(),
    "bottom_navigation_bar_widget.item_05".tr(),
    "bottom_navigation_bar_widget.item_06".tr(),
    "bottom_navigation_bar_widget.item_07".tr(),
  ];
  for (int i = 0; i < 7; i++) {
    gameCells.add(new Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(5.0),
        splashColor: Colors.grey[100],
        onTap: () {
          print("object");
        },
        child: Container(
          width: 70,
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(
                    13.0), //I used some padding without fixed width and height
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),

                child: new Icon(Icons.alternate_email,
                    size: 20.0, color: Colors.white),
              ),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    titleList[i],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  )),
            ],
          ),
        ),
      ),
    ));
  }
  return gameCells;
}
