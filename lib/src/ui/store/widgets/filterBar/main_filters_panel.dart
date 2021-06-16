// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/menu_list_view_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/check_box_in_main_filter_widget.dart';
import 'package:jeanswest/src/ui/store/widgets/filterBar/sub_group_filters_panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainFiltersPanel extends StatefulWidget {
  final Function() closePanel;
  final ListOfCategory category;
  final Size screenSize;

  const MainFiltersPanel({
    Key key,
    @required this.closePanel,
    @required this.category,
    @required this.screenSize,
  }) : super(key: key);
  @override
  _MainFiltersPanelState createState() => _MainFiltersPanelState();
}

class _MainFiltersPanelState extends State<MainFiltersPanel> {
  ScrollController scrollController = new ScrollController();
  PanelController subCategoryPanelController = new PanelController();

  List<String> optionGroup = [
    "گروه رنگی",
    "سایز",
    "محدوده قیمت",
  ];
  //
  List<TextStyle> mainGroupTextStyles = [];
  List<bool> genderCheckBoxValue = [];
  List<bool> ageGroupCheckBoxValue = [];
  //

  int selectedGroup = -1;
  //
  @override
  void initState() {
    mainGroupTextStyles = [];
    widget.category.group.forEach((element) {
      mainGroupTextStyles.add(
        TextStyle(
          color: Colors.black87,
          fontSize: 0.0444 * widget.screenSize.width, //16,
          fontWeight: FontWeight.w400,
        ),
      );
    });

    genderCheckBoxValue = List.filled(widget.category.gender.length, false);
    ageGroupCheckBoxValue = List.filled(widget.category.gender.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
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
                    : selectedGroup < 3
                        ? widget.category.group[selectedGroup]
                        : optionGroup[selectedGroup - 5],
                onTapBack: () => subCategoryPanelController.close(),
                option: SizedBox(height: 45),
              ),
              Expanded(
                child: selectedGroup < 0
                    ? SizedBox()
                    : selectedGroup < widget.category.group.length
                        ? SubGroupFiltersPanel(
                            haveGroupTitle:
                                selectedGroup < widget.category.group.length,
                            groupTitle: selectedGroup < 0
                                ? ""
                                : selectedGroup < widget.category.group.length
                                    ? widget.category.group[selectedGroup]
                                    : optionGroup[selectedGroup -
                                        (widget.category.group.length + 2)],
                            subGroupsTitle: widget.category
                                .subGroup[widget.category.group[selectedGroup]],
                            subGroupsValue: List.filled(
                                widget
                                    .category
                                    .subGroup[
                                        widget.category.group[selectedGroup]]
                                    .length,
                                false),
                            updateSubGroupsValue: (List<bool> newValues) {},
                          )
                        : SizedBox(),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: AvakatanButtonWidget(
                  backgroundColor: MAIN_BLUE_COLOR,
                  textColor: Colors.white,
                  title: "تایید",
                  height: 0.0625 * _screenSize.height, //40,
                  width: _screenSize.width,
                  radius: 0.0138 * _screenSize.width, //5,
                  fontSize: 0.041 * _screenSize.width, //15,
                  borderColor: MAIN_BLUE_COLOR,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        body: Column(
          children: [
            AppBarWithBackWidget(
              title: "فیلترها",
              onTapBack: () => widget.closePanel(),
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "دسته بندی",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            MenuListViewWidget(
                              titles: widget.category.group,
                              haveIcons: false,
                              haveExit: false,
                              isNavigation: false,
                              textStyles: mainGroupTextStyles,
                              selectedIndex: (int index) {
                                setState(() {
                                  selectedGroup = index;
                                });
                                subCategoryPanelController.open();
                              },
                              backgroundColor: Colors.white,
                              screenSize: _screenSize,
                            ),
                            CheckBoxInMainFilterWidget(
                              title: "جنسیت",
                              titleTextStyle: TextStyle(
                                color: Colors.black87,
                                fontSize:
                                    0.0444 * widget.screenSize.width, //16,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxTitles: widget.category.gender,
                              checkBoxTitlesTextStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxValue: genderCheckBoxValue,
                              updateCheckBoxValue: (int index, bool newValue) {
                                setState(() {
                                  genderCheckBoxValue[index] = newValue;
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
                                    0.0444 * widget.screenSize.width, //16,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxTitles: widget.category.ageGroup,
                              checkBoxTitlesTextStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              checkBoxValue: ageGroupCheckBoxValue,
                              updateCheckBoxValue: (int index, bool newValue) {
                                setState(() {
                                  ageGroupCheckBoxValue[index] = newValue;
                                });
                              },
                            ),
                            Divider(
                              color: Colors.grey,
                              thickness: 0.001 * _screenSize.width, //0.3,
                              height: 2,
                            ),
                            MenuListViewWidget(
                              titles: optionGroup,
                              haveIcons: false,
                              haveExit: false,
                              isNavigation: false,
                              textStyles: mainGroupTextStyles,
                              selectedIndex: (int index) {
                                setState(() {
                                  selectedGroup = index +
                                      (widget.category.group.length + 2);
                                });
                                subCategoryPanelController.open();
                              },
                              backgroundColor: Colors.white,
                              screenSize: _screenSize,
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
