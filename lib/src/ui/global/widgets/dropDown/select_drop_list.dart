import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/dropDown/drop-list-model.dart';

class SelectDropList extends StatefulWidget {
  final Widget selectedIcon;
  final String selectedTile;
  final OptionItem itemSelected;
  final DropListModel dropListModel;
  final Function(OptionItem optionItem) onOptionSelected;
  final Function(bool) changeIsShow;
  final bool isShow;
  final double optionsHeight;
  final bool hasCheckBox;
  final AnimationController expandController;
  final Animation<double> animation;
  final Map<String, bool> initialCheckBoxValue;
  final Function(Map<String, bool>) updateCheckBoxValue;

  SelectDropList({
    this.itemSelected,
    @required this.selectedTile,
    this.dropListModel,
    this.onOptionSelected,
    this.selectedIcon,
    this.isShow,
    this.changeIsShow,
    this.optionsHeight,
    this.hasCheckBox = false,
    @required this.expandController,
    @required this.animation,
    this.initialCheckBoxValue,
    this.updateCheckBoxValue,
  });

  @override
  _SelectDropListState createState() =>
      _SelectDropListState(itemSelected, dropListModel);
}

class _SelectDropListState extends State<SelectDropList>
// with SingleTickerProviderStateMixin
{
  ScrollController scrollController = new ScrollController();
  OptionItem optionItemSelected;
  final DropListModel dropListModel;

  // AnimationController expandController;
  // Animation<double> animation;

  bool _tempIsShow;
  //
  Map<String, bool> tempCheckBoxValue = {};

  // AnimationController arrowAnimationController;

  _SelectDropListState(this.optionItemSelected, this.dropListModel);

  @override
  void initState() {
    _tempIsShow = widget.isShow;
    tempCheckBoxValue = widget.initialCheckBoxValue;
    print("*-*-*-*-*-*-*-*-*-*-*-* tempCheckBoxValue  : $tempCheckBoxValue");
    print(
        "*-*-*-*-*-*-*-*-*-*-*-*  widget.dropListModel.listOptionItems  : ${widget.dropListModel.listOptionItems.first.title}");
    super.initState();
    // expandController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    // animation = CurvedAnimation(
    //   parent: expandController,
    //   curve: Curves.fastOutSlowIn,
    // );
    _runExpandCheck(_tempIsShow);
  }

  void _runExpandCheck(bool toShow) {
    if (toShow) {
      widget.expandController.forward();
    } else {
      widget.expandController.reverse();
    }
  }

  // @override
  // void dispose() {
  //   widget.expandController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    // if (widget.optionsHeight != null)
    setState(() {
      _tempIsShow = widget.isShow;
    });

    return Container(
      width: _screenSize.width,
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 0.027 * _screenSize.width, //10,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 0.041 * _screenSize.width, //15,
                vertical: 0.016 * _screenSize.height //10
                ),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(
                0.0138 * _screenSize.width, //5
              ),
              color: _tempIsShow ? Colors.white : F2_BACKGROUND_COLOR,
              border: Border.all(
                  color: _tempIsShow ? MAIN_BLUE_COLOR : F2_BACKGROUND_COLOR),
            ),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.selectedIcon ?? SizedBox,
                SizedBox(
                  width: 0.027 * _screenSize.width, //10,
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    // this.isShow = !this.isShow;

                    _runExpandCheck(!_tempIsShow);
                    widget.changeIsShow(_tempIsShow);

                    setState(() {
                      //   _tempIsShow = widget.isShow;
                    });
                  },
                  // TODO: one of
                  child: Text(
                    // optionItemSelected.title,
                    widget.selectedTile,
                    style: TextStyle(
                      fontSize: 0.0444 * _screenSize.width, //16,
                    ),
                  ),
                )),
                Align(
                  alignment: Alignment(1, 0),
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 0.5)
                        .animate(widget.expandController),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: _tempIsShow ? MAIN_BLUE_COLOR : Colors.black,
                      size: 0.069 * _screenSize.width, //25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _tempIsShow
                ? widget.optionsHeight == null ||
                        widget.optionsHeight >
                            0.24166 * _screenSize.height //145
                    ? 0.24166 * _screenSize.height //145
                    : widget.optionsHeight
                : 0,
            // decoration: BoxDecoration(
            color: Colors.transparent,
            // ),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 0.0333 * _screenSize.width, //12,
              ),
              decoration: BoxDecoration(
                // color: Colors.red,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.0138 * _screenSize.width, //5
                      color: Colors.black26,
                      offset: Offset(
                        0.00555 * _screenSize.width, //2,
                        0.011 * _screenSize.width, //4,
                      ))
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    0.0333 * _screenSize.width, //12,
                  ),
                  bottomRight: Radius.circular(
                    0.0333 * _screenSize.width, //12,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: SizeTransition(
                        axisAlignment: 1.0,
                        sizeFactor: widget.animation,
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 0.016 * _screenSize.height, //10
                          ),
                          padding: EdgeInsets.only(
                              bottom: 0.016 * _screenSize.height //10
                              ),
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                  0.0138 * _screenSize.width, //5
                                ),
                                bottomRight: Radius.circular(
                                  0.0138 * _screenSize.width, //5
                                )),
                            // color: Colors.red,
                            color: Colors.white,
                          ),
                          child: _buildDropListOptions(
                              widget.dropListModel.listOptionItems,
                              context,
                              _screenSize),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.027 * _screenSize.width, //10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildDropListOptions(
      List<OptionItem> items, BuildContext context, Size _screenSize) {
    return Column(
      children: items
          .map((item) => _buildSubMenu(item, context, _screenSize))
          .toList(),
    );
  }

  Widget _buildSubMenu(
      OptionItem item, BuildContext context, Size _screenSize) {
    return Padding(
      padding: EdgeInsets.only(
        right: 0.011 * _screenSize.width, //4,
        top: 0.008 * _screenSize.height, //5
        bottom: 0.008 * _screenSize.height, //5
      ),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 0.027 * _screenSize.width, //10,
            ),
            widget.hasCheckBox
                ? Row(
                    children: [
                      SizedBox(
                        width: 0.0138 * _screenSize.width, //5,
                      ),
                      Container(
                        width: 0.083 * _screenSize.width, //30,
                        height: 0.083 * _screenSize.width, //30,
                        decoration: BoxDecoration(
                          boxShadow: tempCheckBoxValue[item.title]
                              ? []
                              : [
                                  BoxShadow(
                                      color: Colors.grey[100],
                                      blurRadius: 3,
                                      // spreadRadius: 0.05,
                                      offset: Offset(2, 1))
                                ],
                        ),
                        child: Stack(
                          children: [
                            Container(
                                color: tempCheckBoxValue[item.title]
                                    ? Colors.white
                                    : Colors.grey,
                                margin: EdgeInsets.all(
                                  0.0138 * _screenSize.width, //5,
                                )),
                            Icon(
                              Icons.check_box,
                              size: 0.083 * _screenSize.width, //30,
                              color: tempCheckBoxValue[item.title]
                                  ? GREEN_TEXT_COLOR
                                  : Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                  top: 0.008 * _screenSize.height, //5
                  left: 0.027 * _screenSize.width, //10,
                  right: 0.027 * _screenSize.width, //10,
                ),
                child: Text(item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 0.038 * _screenSize.width, //14,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        onTap: () {
          if (widget.hasCheckBox) {
            changeColorsStatus(item.id);
          } else {
            this.optionItemSelected = item;
            widget.changeIsShow(true);
            widget.expandController.reverse();
            widget.onOptionSelected(item);
          }
        },
      ),
    );
  }

  // initializeValues() {
  //   setState(() {
  //     tempCheckBoxValue = widget.initialCheckBoxValue;
  //   });
  // }

  changeColorsStatus(String selectedID) {
    // int index = 0;
    widget.dropListModel.listOptionItems.forEach((element) {
      if (element.id == selectedID)
        setState(() {
          tempCheckBoxValue[element.title] = !tempCheckBoxValue[element.title];
          //
          widget.updateCheckBoxValue(tempCheckBoxValue);
          // tempCheckBoxValue[index] = !tempCheckBoxValue[index];
        });
      // index++;
    });
    // widget.dropListModel.listOptionItems.every((element) => element.id == selectedID)
    // tempCheckBoxValue.every((element) => element. == selectedID)
  }
}
