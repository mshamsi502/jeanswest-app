import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/city/city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/district/district.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class ListUnitAddressPanelWidget extends StatefulWidget {
  final String selectedOption;
  final Size screenSize;
  final FocusNode focusNode;
  final List<Province> allProvince;
  final List<City> allCity;
  final List<District> allDistrict;
  final Function(int) updateProvince;
  final Function(int) updateCity;
  final Function(int) updateDistrict;
  final Function() closePanel;
  final Function(String) onChangeSearchFeild;

  ListUnitAddressPanelWidget({
    Key key,
    this.selectedOption,
    this.allProvince,
    this.allCity,
    this.allDistrict,
    this.updateProvince,
    this.updateCity,
    this.updateDistrict,
    this.closePanel,
    this.screenSize,
    this.focusNode,
    this.onChangeSearchFeild,
  }) : super(key: key);

  @override
  _ListUnitAddressPanelWidgetState createState() =>
      _ListUnitAddressPanelWidgetState();
}

class _ListUnitAddressPanelWidgetState
    extends State<ListUnitAddressPanelWidget> {
  ScrollController editScrollController = new ScrollController();

  var keyboardVisibilityController = KeyboardVisibilityController();
  TextEditingController searchTextEditingController =
      new TextEditingController();
  Map<String, String> selectedOptionName;

  @override
  void initState() {
    selectedOptionName = widget.selectedOption == "province"
        ? {
            "perSingle": "استان",
            "perPlural": "استان ها",
          }
        : widget.selectedOption == "city"
            ? {
                "perSingle": "شهر",
                "perPlural": "شهر ها",
              }
            : {
                "perSingle": "محله",
                "perPlural": "محله ها",
              };
    scrollJumpAfterKeyborad(
      keyboardVisibilityController: keyboardVisibilityController,
      scrollController: editScrollController,
      screenSize: widget.screenSize,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              0.027 * _screenSize.width, //10,
            ),
            topRight: Radius.circular(
              0.027 * _screenSize.width, //10,
            )),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: 0.041 * _screenSize.width, //15,
          vertical: 0.016 * _screenSize.height //10
          ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.selectedOption == "province" ? "استان" : widget.selectedOption == "city" ? "شهر" : "محله"} را انتخاب کنید:',
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                  child: Icon(
                    Icons.close,
                    size: 0.06111 * _screenSize.width, //22,
                  ),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    widget.closePanel();
                  }),
            ],
          ),
          SearchAppBarWidget(
            preTitle: 'جستجو ',
            title: selectedOptionName['perPlural'],
            textFielIsActive: true,
            textEditingController: searchTextEditingController,
            onChangeSearchField: widget.onChangeSearchFeild,
            focusNode: widget.focusNode,
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
          SizedBox(height: 0.0078 * _screenSize.height //5,
              ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.selectedOption == "province"
                    ? widget.allProvince.length
                    : widget.selectedOption == "city"
                        ? widget.allCity.length
                        : widget.allDistrict.length,
                controller: editScrollController,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.0078 * _screenSize.height //5,
                          ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 0.0194 * _screenSize.width, //7,
                          ),
                          Text(
                            widget.selectedOption == "province"
                                ? widget.allProvince[index].name
                                : widget.selectedOption == "city"
                                    ? widget.allCity[index].name
                                    : widget.allDistrict[index].name,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      if (widget.selectedOption == "province") {
                        widget.updateProvince(index);
                      } else if (widget.selectedOption == "city") {
                        widget.updateCity(index);
                      } else {
                        widget.updateDistrict(index);
                      }
                      searchTextEditingController.clear();
                      FocusScope.of(context).unfocus();
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
