import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/city/city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/district/district.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/province/province.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/search_appbar_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/search/helper_search.dart';

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
      scrollController: editScrollController,
      screenSize: widget.screenSize,
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.selectedOption == "province" ? "استان" : widget.selectedOption == "city" ? "شهر" : "محله"} را انتخاب کنید:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                  child: Icon(
                    Icons.close,
                    size: 22,
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
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            titleIsCenter: false,
            icon: Icon(
              Icons.search_outlined,
              color: DARK_GREY,
            ),
            onTapIcon: () {},
            openRealSearchPanel: (bool isOpen, BuildContext buildContext) {},
          ),
          SizedBox(height: 5),
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
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 7),
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
