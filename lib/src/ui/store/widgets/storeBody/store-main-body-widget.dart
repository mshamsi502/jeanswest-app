// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';

class StoreMainBodyWidget extends StatefulWidget {
  final FocusNode searchFocusNode;
  final TextEditingController searchTextEditingController;
  final bool searchTextFeildIsEnabled;
  final Function(bool) changeSearchTextFeildIsEnabled;

  const StoreMainBodyWidget({
    Key key,
    @required this.searchFocusNode,
    @required this.searchTextEditingController,
    @required this.searchTextFeildIsEnabled,
    @required this.changeSearchTextFeildIsEnabled,
  }) : super(key: key);
  @override
  _StoreMainBodyWidgetState createState() => _StoreMainBodyWidgetState();
}

class _StoreMainBodyWidgetState extends State<StoreMainBodyWidget> {
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      height: 60,
      // color: Colors.red,
      child: Row(
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  width: _screenSize.width - 45,
                  child: SearchAppBarWidget(
                    preTitle: '${"search_in_list_hint".tr()} ',
                    title: "همه محصولات",
                    textFielIsActive: widget.searchTextFeildIsEnabled,
                    textEditingController: widget.searchTextEditingController,
                    onChangeSearchField: (String value) {},
                    focusNode: widget.searchFocusNode,
                    titleStyle: TextStyle(
                      color: DARK_GREY,
                      fontSize: 0.0444 * _screenSize.width, //16,
                      fontWeight: FontWeight.w400,
                    ),
                    titleIsCenter: false,
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
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
                        width: _screenSize.width - 45,
                        margin: EdgeInsets.symmetric(vertical: 10),
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
          Container(
            width: 37,
            height: 37,
            decoration: BoxDecoration(
              color: F2_BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.qr_code_scanner_sharp,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
