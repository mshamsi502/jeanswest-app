import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/dropDown/drop-list-model.dart';

class SelectDropList extends StatefulWidget {
  final Widget selectedIcon;
  final OptionItem itemSelected;
  final DropListModel dropListModel;
  final Function(OptionItem optionItem) onOptionSelected;
  final Function(bool) changeIsShow;

  SelectDropList({
    this.itemSelected,
    this.dropListModel,
    this.onOptionSelected,
    this.selectedIcon,
    this.changeIsShow,
  });

  @override
  _SelectDropListState createState() =>
      _SelectDropListState(itemSelected, dropListModel);
}

class _SelectDropListState extends State<SelectDropList>
    with SingleTickerProviderStateMixin {
  OptionItem optionItemSelected;
  final DropListModel dropListModel;

  AnimationController expandController;
  Animation<double> animation;

  bool isShow = false;

  // AnimationController arrowAnimationController;

  _SelectDropListState(this.optionItemSelected, this.dropListModel);

  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
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
              color: isShow ? Colors.white : F2_BACKGROUND_COLOR,
              border: Border.all(
                  color: isShow ? MAIN_BLUE_COLOR : F2_BACKGROUND_COLOR),
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
                    this.isShow = !this.isShow;
                    widget.changeIsShow(isShow);
                    _runExpandCheck();
                    setState(() {});
                  },
                  child: Text(
                    optionItemSelected.title,
                    style: TextStyle(
                      fontSize: 0.0444 * _screenSize.width, //16,
                    ),
                  ),
                )),
                Align(
                  alignment: Alignment(1, 0),
                  child: RotationTransition(
                    turns:
                        Tween(begin: 0.0, end: 0.5).animate(expandController),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: isShow ? MAIN_BLUE_COLOR : Colors.black,
                      size: 0.069 * _screenSize.width, //25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                  margin: EdgeInsets.only(
                    bottom: 0.016 * _screenSize.height, //10
                    left: 0.0333 * _screenSize.width, //12,
                    right: 0.0333 * _screenSize.width, //12,
                  ),
                  padding:
                      EdgeInsets.only(bottom: 0.016 * _screenSize.height //10
                          ),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          0.0138 * _screenSize.width, //5
                        ),
                        bottomRight: Radius.circular(
                          0.0138 * _screenSize.width, //5
                        )),
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
                  ),
                  child: _buildDropListOptions(
                      widget.dropListModel.listOptionItems,
                      context,
                      _screenSize))),
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
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                  top: 0.008 * _screenSize.height, //5
                ),
                child: Text(item.title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        onTap: () {
          this.optionItemSelected = item;
          isShow = false;
          widget.changeIsShow(isShow);
          expandController.reverse();
          widget.onOptionSelected(item);
        },
      ),
    );
  }
}
