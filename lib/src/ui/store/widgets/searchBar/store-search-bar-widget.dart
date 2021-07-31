// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class StoreSearchBarWidget extends StatefulWidget {
  final FocusNode searchFocusNode;
  final TextEditingController searchTextEditingController;
  final bool searchTextFeildIsEnabled;
  final Function(bool) changeSearchTextFeildIsEnabled;
  final Function(String) sumbittSearch;

  const StoreSearchBarWidget({
    Key key,
    @required this.searchFocusNode,
    @required this.searchTextEditingController,
    @required this.searchTextFeildIsEnabled,
    @required this.changeSearchTextFeildIsEnabled,
    @required this.sumbittSearch,
  }) : super(key: key);
  @override
  _StoreSearchBarWidgetState createState() => _StoreSearchBarWidgetState();
}

class _StoreSearchBarWidgetState extends State<StoreSearchBarWidget> {
  ScrollController scrollController = new ScrollController();

  bool keyboardIsOpen;
  var keyboardVisibilityController = KeyboardVisibilityController();

  @override
  void initState() {
    keyboardIsOpen = false;
    keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        if (mounted)
          setState(() {
            keyboardIsOpen = true;
          });
      } else {
        widget.searchFocusNode.unfocus();
        if (mounted)
          setState(() {
            keyboardIsOpen = false;
          });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      height: 0.09375 * _screenSize.height, //60,
      child: Row(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  width: _screenSize.width -
                      (0.125 * _screenSize.width //45,
                      ),
                  child: SearchAppBarWidget(
                    preTitle: widget.searchTextEditingController.text.length > 0
                        ? ""
                        : '${"search_in_list_hint".tr()} ',
                    title: widget.searchTextEditingController.text.length > 0
                        ? widget.searchTextEditingController.text
                        : "همه محصولات",
                    textFielIsActive: widget.searchTextFeildIsEnabled,
                    textEditingController: widget.searchTextEditingController,
                    onChangeSearchField: (String value) {
                      widget.sumbittSearch(value);
                    },
                    focusNode: widget.searchFocusNode,
                    titleStyle: TextStyle(
                      color: keyboardIsOpen &&
                              widget.searchTextEditingController.text.length > 0
                          ? Colors.black
                          : DARK_GREY,
                      fontSize: 0.0444 * _screenSize.width, //16,
                      fontWeight: FontWeight.w400,
                    ),
                    titleIsCenter: false,
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                    haveClearText: true,
                    onTapIcon: () {},
                    openRealSearchPanel:
                        (bool isOpen, BuildContext buildContext) {},
                    screenSize: _screenSize,
                  ),
                ),
              ),
              widget.searchTextFeildIsEnabled
                  ? SizedBox()
                  : GestureDetector(
                      child: Container(
                        width: _screenSize.width -
                            (0.125 * _screenSize.width //45,
                            ),
                        margin: EdgeInsets.symmetric(
                          vertical: 0.015 * _screenSize.height, //10,
                        ),
                        color: Colors.transparent,
                        // color: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          widget.searchFocusNode.requestFocus();
                          widget.changeSearchTextFeildIsEnabled(true);
                        });
                      },
                    ),
            ],
          ),
          GestureDetector(
              child: Container(
                width: 0.1027 * _screenSize.width, //37,
                height: 0.1027 * _screenSize.width, //37,
                decoration: BoxDecoration(
                  color: F2_BACKGROUND_COLOR,
                  borderRadius: BorderRadius.circular(
                    0.011 * _screenSize.width, //4,
                  ),
                ),
                child: Icon(
                  Icons.qr_code_scanner_sharp,
                  size: 0.07777 * _screenSize.width, //28
                ),
              ),
              onTap: () async {
                String barcodeScanRes;

                print(
                    "#${MAIN_BLUE_COLOR.toString().substring(10, MAIN_BLUE_COLOR.toString().length - 1)}");

                try {
                  barcodeScanRes = await scanner.scan();
                  print(barcodeScanRes);
                  if (barcodeScanRes != "-1")
                    showToast(
                      message: "بارکد محصول اسکن شده : $barcodeScanRes",
                      textColor: Colors.white,
                      backgroundColor: GREEN_TEXT_COLOR,
                    );
                } on PlatformException {
                  barcodeScanRes = 'Failed to get platform version.';
                }
              }),
        ],
      ),
    );
  }
}
