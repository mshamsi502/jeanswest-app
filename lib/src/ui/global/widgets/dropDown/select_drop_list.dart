import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/dropDown/drop-list-model.dart';

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
    // arrowAnimationController = AnimationController(
    //     duration: const Duration(milliseconds: 500), vsync: this);

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
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: isShow ? Colors.white : F2_BACKGROUND_COLOR,
              border: Border.all(
                  color: isShow ? MAIN_BLUE_COLOR : F2_BACKGROUND_COLOR),
              // boxShadow: [
              //   BoxShadow(
              //       blurRadius: 10, color: Colors.black26, offset: Offset(0, 2))
              // ],
            ),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.selectedIcon ?? SizedBox,
                SizedBox(
                  width: 10,
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
                    style: TextStyle(fontSize: 16),
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
                      size: 25,
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
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          color: Colors.black26,
                          offset: Offset(0, 4))
                    ],
                  ),
                  child: _buildDropListOptions(
                      widget.dropListModel.listOptionItems, context))),
        ],
      ),
    );
  }

  Column _buildDropListOptions(List<OptionItem> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(OptionItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 5),
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
