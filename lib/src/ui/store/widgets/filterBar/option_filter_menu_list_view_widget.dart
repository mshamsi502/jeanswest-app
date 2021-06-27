// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class OptionFilterMenuListViewWidget extends StatefulWidget {
  final List<String> titles;
  final List<String> colorSubtitlesName;
  final List<Widget> colorSubtitlesWidget;
  final Map<String, List<String>> sizeSubtitlesName;
  final String priceSubtitlesName;
  final List<bool> showName;
  final Function(int) selectedIndex;
  final Size screenSize;

  const OptionFilterMenuListViewWidget({
    Key key,
    @required this.titles,
    @required this.colorSubtitlesName,
    @required this.colorSubtitlesWidget,
    @required this.sizeSubtitlesName,
    @required this.priceSubtitlesName,
    //
    @required this.selectedIndex,
    @required this.screenSize,
    @required this.showName,
  }) : super(key: key);

  State<StatefulWidget> createState() => _OptionFilterMenuListViewWidgetState();
}

class _OptionFilterMenuListViewWidgetState
    extends State<OptionFilterMenuListViewWidget> {
  ScrollController _scrollController;
  List<bool> tempShowName;

  //
  List<String> sub = ["", "", ""];
  bool haveColorMore = false;
  int tempIndex;

  @override
  void initState() {
    if (widget.showName == null || widget.showName.length < 0)
      tempShowName = List.filled(widget.titles.length, true);
    else
      tempShowName = widget.showName;

    _scrollController = new ScrollController();
    super.initState();
  }

  updateVar({@required int index, @required Size screenSize}) {
    sub[0] = prepareColorSub();
    haveColorMore = prepareHaveColorMore(screenSize: screenSize);
    sub[1] = prepareSizeSub();
    sub[2] = widget.priceSubtitlesName;

    tempIndex = index;
  }

  String prepareColorSub() {
    String colorSub = "";
    for (int index = 0; index < widget.colorSubtitlesName.length; index++) {
      colorSub = index == 0
          ? widget.colorSubtitlesName[index]
          : colorSub + "، " + widget.colorSubtitlesName[index];
    }
    return colorSub;
  }

  bool prepareHaveColorMore({@required Size screenSize}) {
    double maxColorWidget = (((0.6 * screenSize.width) - 30) / 30);
    return widget.colorSubtitlesWidget.length >= maxColorWidget;
  }

  String prepareSizeSub() {
    // print(widget.sizeSubtitlesName);
    String sizeSub = "";
    bool addesEXT = false;
    for (int index = 0; index < widget.sizeSubtitlesName.keys.length; index++) {
      String keySize = widget.sizeSubtitlesName.keys.elementAt(index);
      if (widget.sizeSubtitlesName[keySize].length > 0) {
        if (index == 0) {
          sizeSub = sizeSub + "$keySize : ";
          bool isFirst = true;
          widget.sizeSubtitlesName[keySize].forEach((activedSubSize) {
            sizeSub = isFirst
                ? sizeSub + activedSubSize
                : sizeSub + "، $activedSubSize ";
            isFirst = false;
          });
        } else if (!addesEXT) {
          sizeSub = sizeSub + " ...";
          addesEXT = true;
        }
      }
    }
    // print("aaaaaaaa :  $sizeSub");
    return sizeSub;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (mounted)
      setState(() {
        updateVar(screenSize: _screenSize, index: 0);
      });

    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: widget.titles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                widget.selectedIndex(index);
              },
              child: Container(
                height: 0.166 * _screenSize.width, //60,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(color: Colors.transparent),
                    ),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: (widget.showName[index] &&
                                        (sub[index] != null &&
                                            sub[index] != "")) ||
                                    (!widget.showName[index] &&
                                        (widget.colorSubtitlesWidget != null &&
                                            widget.colorSubtitlesWidget.length >
                                                0))
                                ? 5
                                : 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.titles[index],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(),
                                ),
                                SizedBox(width: 5),
                                (widget.showName[index] &&
                                            (sub[index] != null &&
                                                sub[index] != "")) ||
                                        (!widget.showName[index] &&
                                            (widget.colorSubtitlesWidget !=
                                                    null &&
                                                widget.colorSubtitlesWidget
                                                        .length >
                                                    0))
                                    ? Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: MAIN_GOLD_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ))
                                    : SizedBox(),
                              ],
                            ),
                            (widget.showName[index] &&
                                        (sub[index] != null &&
                                            sub[index] != "")) ||
                                    (!widget.showName[index] &&
                                        (widget.colorSubtitlesWidget != null &&
                                            widget.colorSubtitlesWidget.length >
                                                0))
                                ? Expanded(
                                    child: Container(
                                      // color: Colors.amber,
                                      width: 0.6 * _screenSize.width,
                                      child: widget.showName[index]
                                          ? Text(
                                              sub[index],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                            )
                                          : Row(
                                              children: [
                                                ListView.builder(
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount: haveColorMore
                                                        ? 6
                                                        : widget
                                                            .colorSubtitlesWidget
                                                            .length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (BuildContext
                                                            context,
                                                        int colorWidgetIndex) {
                                                      return Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            child: widget
                                                                    .colorSubtitlesWidget[
                                                                colorWidgetIndex],
                                                          ),
                                                          SizedBox(width: 5),
                                                        ],
                                                      );
                                                    }),
                                                haveColorMore
                                                    ? Container(
                                                        width: 30,
                                                        height: 30,
                                                        child: Icon(
                                                            Icons.more_horiz))
                                                    : SizedBox()
                                              ],
                                            ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 5, child: SizedBox()),
                    Container(
                      width: 0.041 * _screenSize.width,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 0.041 * _screenSize.width, //15,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: Colors.transparent),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.001 * _screenSize.width, //0.3,
              height: 2,
            ),
          ],
        );
      },
    );
  }
}
