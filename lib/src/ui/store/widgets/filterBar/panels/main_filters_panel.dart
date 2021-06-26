// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/globalInstances/profile/category.dart';
import 'package:jeanswest/src/constants/global/globalInstances/store/category_colors.dart';
import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/check_box_in_main_filter_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/group_filter_menu_list_view_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/option_filter_menu_list_view_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/panels/sub_group_filters_panel.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainFiltersPanel extends StatefulWidget {
  final Function() closePanel;
  final ListOfCategory category;
  final List<String> optionGroup;
  final MediaQueryData mediaQuery;
  // final List<Widget> optionWidgets;
  //
  final List<List<String>> subGroupsTitles;
  final List<List<bool>> subGroupsValue;
  //
  final List<bool> genderCheckBoxValue;
  final List<bool> ageCheckBoxValue;
  //
  final List<bool> colorCheckBoxValue;
  final List<Map<String, bool>> sizeGroupCheckBoxValue;
  final Map<String, int> priceLimitValue;

  final Function(List<List<bool>>) confirmSubGroupValues;
  final Function(
    List<bool> genderCheckBoxValue,
    List<bool> ageCheckBoxValue,
    List<bool> colorCheckBoxValue,
    List<Map<String, bool>> sizeGroupCheckBoxValue,
    Map<String, int> priceLimitValue,
  ) confirmOptionsValues;
//
  const MainFiltersPanel({
    Key key,
    @required this.closePanel,
    @required this.category,
    @required this.optionGroup,
    @required this.mediaQuery,
    // @required this.optionWidgets,
    //
    @required this.sizeGroupCheckBoxValue,
    @required this.subGroupsTitles,
    @required this.subGroupsValue,
    @required this.genderCheckBoxValue,
    @required this.ageCheckBoxValue,
    @required this.priceLimitValue,
    @required this.colorCheckBoxValue,
    @required this.confirmSubGroupValues,
    @required this.confirmOptionsValues,
  }) : super(key: key);
  @override
  _MainFiltersPanelState createState() => _MainFiltersPanelState();
}

class _MainFiltersPanelState extends State<MainFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  PanelController subCategoryPanelController = new PanelController();
  //

  //
  List<TextStyle> mainGroupTextStyles = [];
  //
  List<List<String>> tempSubGroupsTitles = [];
  List<List<bool>> tempSubGroupsValue = [];
  //
  List<bool> tempGenderCheckBoxValue = [];
  List<bool> tempAgeGroupCheckBoxValue = [];
  List<bool> tempColorsValue = [];
  List<Map<String, bool>> tempSizeGroupCheckBoxValue = [];
  Map<String, int> tempPriceLimitValue = {};
  //
  List<String> colorsSubtitleName = [];
  List<Widget> colorsSubtitleWidget = [];
  bool isShowColorWidget;
  Map<String, List<String>> sizeGroupSubtitleName;
  //

  //
  List<Widget> optionsWidget = [];
  int selectedGroup = -1;
  int tempSelectedGroup;
  //
  @override
  void initState() {
    isShowColorWidget = false;
    mainGroupTextStyles = [];
    widget.category.group.forEach((element) {
      mainGroupTextStyles.add(
        TextStyle(
          color: Colors.black87,
          fontSize: 0.0444 * widget.mediaQuery.size.width, //16,
          fontWeight: FontWeight.w400,
        ),
      );
    });

    initializeValues();
    updateSubtitles();
    prepareValues();

    super.initState();
  }

  prepareValues() {
    setState(() {
      sizeGroupSubtitleName = {};
      for (int indexOfGroup = 0;
          indexOfGroup < widget.sizeGroupCheckBoxValue.length;
          indexOfGroup++) {
        List<String> subNameInGroup = [];

        for (int indexOfSub = 0;
            indexOfSub <
                widget.sizeGroupCheckBoxValue[indexOfGroup].values.length;
            indexOfSub++) {
          if (widget.sizeGroupCheckBoxValue[indexOfGroup].values
              .elementAt(indexOfSub)) {
            subNameInGroup.add(widget.category
                    .size[widget.category.size.keys.elementAt(indexOfGroup)]
                [indexOfSub]);
            sizeGroupSubtitleName[widget.category.group[indexOfGroup]] =
                subNameInGroup;
          }
        }
      }
      widget.sizeGroupCheckBoxValue.forEach((element) {});
      optionsWidget = prepareOptionsWidgets(
        selectedIndexPage: selectedGroup - 5,
        haveGenderAndAge: false,
        mediaQuery: widget.mediaQuery,
        listOfCat: listOfCategory,
        genderCheckBoxValue: tempGenderCheckBoxValue,
        ageCheckBoxValue: tempAgeGroupCheckBoxValue,
        colorCheckBoxValue: tempColorsValue,
        sizeGroupCheckBoxValue: tempSizeGroupCheckBoxValue,
        priceLimitValue: tempPriceLimitValue,
        //
        updateGenderValue: (List<bool> newValue) => setState(() {
          tempGenderCheckBoxValue = newValue;
          selectedGroup = -1;
        }),

        updateAgeValue: (List<bool> newValue) => setState(() {
          tempAgeGroupCheckBoxValue = newValue;
          selectedGroup = -1;
        }),

        updateSizeValue: (List<Map<String, bool>> newValue) => setState(() {
          tempSizeGroupCheckBoxValue = newValue;
          updateSubtitles();
          selectedGroup = -1;
          subCategoryPanelController.close();
        }),
        updateColorValue: (List<bool> newValue) => setState(() {
          tempColorsValue = newValue;
          updateSubtitles();
          selectedGroup = -1;
          subCategoryPanelController.close();
        }),
        updatePriceValue: (int newMinPrice, int newMaxPrice) => setState(() {
          tempPriceLimitValue["min"] = newMinPrice;
          tempPriceLimitValue["max"] = newMaxPrice;
          updateSubtitles();
          selectedGroup = -1;
          subCategoryPanelController.close();
          print("..................................");
          // if (subCategoryPanelController.isPanelClosed) selectedGroup = -1;
        }),
      );
      tempSelectedGroup = selectedGroup;
    });
  }

  updateSubtitles() {
    setState(() {
      int checkColor = checkValueListStatus(tempColorsValue);
      if (checkColor == 1) {
        colorsSubtitleName = ["همه رنگ ها"];
        isShowColorWidget = false;
      } else if (checkColor == -1) {
        isShowColorWidget = false;
        colorsSubtitleName = [];
      } else {
        isShowColorWidget = true;
        colorsSubtitleName = [];
        colorsSubtitleWidget = [];

        for (int index = 0; index < catColors.length; index++) {
          if (tempColorsValue[index]) {
            colorsSubtitleWidget.add(catColors[index].image);
          }
        }
      }
    });
  }

  initializeValues() {
    setState(() {
      tempSubGroupsTitles = widget.subGroupsTitles;
      tempSubGroupsValue = widget.subGroupsValue;
      tempSizeGroupCheckBoxValue = widget.sizeGroupCheckBoxValue;
      tempGenderCheckBoxValue = widget.genderCheckBoxValue;
      tempAgeGroupCheckBoxValue = widget.ageCheckBoxValue;
      tempColorsValue = widget.colorCheckBoxValue;
      tempPriceLimitValue = widget.priceLimitValue;
      selectedGroup = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    print("selectedGroup : $selectedGroup");
    if (tempSelectedGroup != selectedGroup) {
      // initializeValues();
      updateSubtitles();
      prepareValues();
    }
    return Container(
      width: _screenSize.width,
      height: _screenSize.height,
      color: Colors.white,
      child: SlidingUpPanel(
        controller: subCategoryPanelController,
        minHeight: 0,
        maxHeight: _screenSize.height,
        isDraggable: false,
        onPanelClosed: () {},
        onPanelOpened: () {},
        panel: Container(
          height: _screenSize.height,
          width: _screenSize.width,
          child: Column(
            children: [
              AppBarWithBackWidget(
                title: selectedGroup < 0
                    ? ""
                    : selectedGroup < widget.category.group.length
                        ? widget.category.group[selectedGroup]
                        : widget.optionGroup[
                            (selectedGroup - widget.optionGroup.length) + 4],
                onTapBack: () {
                  initializeValues();
                  subCategoryPanelController.close();
                },
                option: SizedBox(height: 45),
              ),
              Expanded(
                  child: selectedGroup < 0
                      ? SizedBox()
                      : selectedGroup < widget.category.group.length
                          ? SubGroupFiltersPanel(
                              indexInOptionWidgets: -1,
                              haveGroupTitle: true,
                              groupTitle: widget.category.group[selectedGroup],
                              subGroupsTitle:
                                  tempSubGroupsTitles[selectedGroup],
                              subGroupsValue: tempSubGroupsValue[selectedGroup],
                              updateSubGroupsValue: (List<bool> newValues) {
                                subCategoryPanelController.close();
                                updateSubGroupValue(selectedGroup, newValues);
                              },
                            )
                          : selectedGroup <
                                  widget.category.group.length +
                                      optionsWidget.length
                              ? optionsWidget[
                                  selectedGroup - widget.category.group.length]
                              : SizedBox()),
              SizedBox(height: 20),
            ],
          ),
        ),
        body: Column(
          children: [
            AppBarWithBackWidget(
              title: "فیلترها",
              onTapBack: () {
                initializeValues();
                widget.closePanel();
              },
              option: GestureDetector(
                child: Container(
                  // color: Colors.amber,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "حذف همه فیلترها",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MAIN_BLUE_COLOR,
                    ),
                  ),
                ),
                onTap: () {
                  print("00000");
                },
              ),
            ),
            Container(
              height: 3,
              color: FB_BACKGROUND_COLOR,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: 15,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "دسته بندی",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            GroupFilterMenuListViewWidget(
                              titles: widget.category.group,
                              subtitlesValue: tempSubGroupsValue,
                              subtitlesName: widget.category.subGroup,
                              // haveIcons: false,
                              // haveExit: false,
                              // isNavigation: false,
                              // textStyles: mainGroupTextStyles,
                              selectedIndex: (int index) {
                                setState(() {
                                  selectedGroup = index;
                                });
                                print(
                                    "update selectedGroup fom group, index : $selectedGroup");
                                subCategoryPanelController.open();
                              },
                              // backgroundColor: Colors.white,
                              screenSize: _screenSize,
                              // showName: [true, true, true],
                              subtitlesWidget: {},
                            ),
                            CheckBoxInMainFilterWidget(
                              title: "جنسیت",
                              titleTextStyle: TextStyle(
                                color: Colors.black87,
                                fontSize:
                                    0.0444 * widget.mediaQuery.size.width, //16,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxTitles: widget.category.gender,
                              checkBoxTitlesTextStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxValue: tempGenderCheckBoxValue,
                              updateCheckBoxValue: (int index, bool newValue) {
                                setState(() {
                                  tempGenderCheckBoxValue[index] = newValue;
                                });
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.001 * _screenSize.width, //0.3,
                              height: 2,
                            ),
                            CheckBoxInMainFilterWidget(
                              title: "رده سنی",
                              titleTextStyle: TextStyle(
                                color: Colors.black87,
                                fontSize:
                                    0.0444 * widget.mediaQuery.size.width, //16,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxTitles: widget.category.ageGroup,
                              checkBoxTitlesTextStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxValue: tempAgeGroupCheckBoxValue,
                              updateCheckBoxValue: (int index, bool newValue) {
                                setState(() {
                                  tempAgeGroupCheckBoxValue[index] = newValue;
                                });
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.001 * _screenSize.width, //0.3,
                              height: 2,
                            ),
                            OptionFilterMenuListViewWidget(
                              titles: widget.optionGroup.sublist(2),
                              selectedIndex: (int index) {
                                setState(() {
                                  selectedGroup =
                                      index + (widget.category.group.length);
                                });
                                subCategoryPanelController.open();
                              },
                              screenSize: _screenSize,
                              colorSubtitlesName: colorsSubtitleName,
                              colorSubtitlesWidget: colorsSubtitleWidget,
                              sizeSubtitlesName: sizeGroupSubtitleName,
                              priceSubtitlesName:
                                  "از ${widget.priceLimitValue["min"]} تا ${widget.priceLimitValue["max"]} تومان",
                              showName: [!isShowColorWidget, true, true],
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: AvakatanButtonWidget(
                        backgroundColor: MAIN_BLUE_COLOR,
                        textColor: Colors.white,
                        title: "اعمال فیلتر",
                        height: 0.0625 * _screenSize.height, //40,
                        width: _screenSize.width,
                        radius: 0.0138 * _screenSize.width, //5,
                        fontSize: 0.041 * _screenSize.width, //15,
                        borderColor: MAIN_BLUE_COLOR,
                        onTap: () {
                          widget.confirmSubGroupValues(tempSubGroupsValue);
                          widget.confirmOptionsValues(
                            tempGenderCheckBoxValue,
                            tempAgeGroupCheckBoxValue,
                            tempColorsValue,
                            tempSizeGroupCheckBoxValue,
                            tempPriceLimitValue,
                          );
                          widget.closePanel();
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  updateSubGroupValue(int index, List<bool> newValues) {
    List<bool> _temp = newValues;
    List<List<bool>> _tempList = tempSubGroupsValue.sublist(0, index);
    _tempList.add(_temp);
    _tempList.addAll(tempSubGroupsValue.sublist(index + 1));
    setState(() {
      tempSubGroupsValue = [];
      tempSubGroupsValue = _tempList;
    });
  }
}
