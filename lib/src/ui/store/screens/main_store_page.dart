// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filters_bar_widget.dart';

class MainStorePage extends StatefulWidget {
  const MainStorePage({
    Key key,
  }) : super(key: key);
  @override
  _MainStorePageState createState() => _MainStorePageState();
}

class _MainStorePageState extends State<MainStorePage> {
  TextEditingController searchTextEditingController =
      new TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SearchAppBarWidget(
            preTitle: '${"search_in_list_hint".tr()} ',
            title: "همه محصولات",
            textFielIsActive: true,
            textEditingController: searchTextEditingController,
            onChangeSearchField: (String value) {},
            focusNode: searchFocusNode,
            titleStyle: TextStyle(
              color: DARK_GREY,
              fontSize: 0.0444 * _screenSize.width, //16,
              fontWeight: FontWeight.w400,
            ),
            titleIsCenter: false,
            icon: Icon(
              Icons.search_outlined,
              color: DARK_GREY,
            ),
            onTapIcon: () {},
            openRealSearchPanel: (bool isOpen, BuildContext buildContext) {},
            screenSize: _screenSize,
          ),
          FiltersBarWidget(),
        ],
      ),
    );
  }
}
