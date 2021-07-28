// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/categorySubGroup/category-sub-group.dart';
import 'package:jeanswest/src/utils/helper/store/helper.dart';

class GroupFilterMenuListViewWidget extends StatefulWidget {
  final List<String> titles;
  final List<List<bool>> subtitlesValue;
  // final Map<String, List<String>> subtitlesName;
  final List<CategorySubGroupRes> subtitlesName;
  final Map<String, List<Widget>> subtitlesWidget;
  // final List<bool> showName;
  final Function(int) selectedIndex;
  final Size screenSize;

  const GroupFilterMenuListViewWidget({
    Key key,
    @required this.titles,
    @required this.subtitlesName,
    @required this.subtitlesValue,
    this.selectedIndex,
    @required this.screenSize,
    // @required this.showName,
    @required this.subtitlesWidget,
  }) : super(key: key);

  State<StatefulWidget> createState() => _GroupFilterMenuListViewWidgetState();
}

class _GroupFilterMenuListViewWidgetState
    extends State<GroupFilterMenuListViewWidget> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = new ScrollController();
    super.initState();
  }

  List<String> createSubTitle() {
    List<String> subtitleList = [];
    if (widget.subtitlesValue != null && widget.subtitlesValue.length > 0) {
      for (int indexOfGroup = 0;
          indexOfGroup < widget.titles.length;
          indexOfGroup++) {
        String subtitle = "";
        if (checkValueListStatus(widget.subtitlesValue[indexOfGroup]) == 1) {
          subtitle = "همه ی ${widget.titles[indexOfGroup]} ها";
        } else {
          bool isFirst = true;
          // int counter = 0;
          // int indexTitleInSubtitle;

          // widget.subtitlesName.keys.forEach((subElement) {
          //   if (subElement == widget.titles[indexOfGroup])
          //     indexTitleInSubtitle = counter;
          //   else
          //     counter++;
          // });

          for (int indexOfSub = 0;
              indexOfSub < widget.subtitlesValue[indexOfGroup].length;
              indexOfSub++) {
            String newSub = "";

            if (widget.subtitlesValue[indexOfGroup][indexOfSub]) {
              newSub = widget
                  .subtitlesName[indexOfGroup]
                  .value[indexOfSub]
                  .translation[widget
                      .subtitlesName[indexOfGroup].value[indexOfSub].translation
                      .indexWhere(
                          (_trans) => _trans.language == FARSI_LANGUAGE)]
                  .value;
              if (indexOfSub == 0 || isFirst) {
                subtitle = subtitle + newSub;
                isFirst = false;
              } else {
                subtitle = subtitle + "، " + newSub;
                isFirst = false;
              }
            }
          }
          // print(
          //     "77777 subtitleList ${widget.titles[indexOfGroup]} : $subtitle");
        }
        subtitleList.add(subtitle);
      }
    }
    return subtitleList;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      itemCount: widget.titles.length,
      itemBuilder: (BuildContext context, int index) {
        List<String> subtitleList = createSubTitle();
        return Column(
          children: [
            GestureDetector(
              onTap: () async {
                widget.selectedIndex(index);
              },
              child: Container(
                height: 0.166 * _screenSize.width, //60,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 10,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: (subtitleList[index] != null &&
                                    subtitleList[index] != "")
                                ? 0.0078 * _screenSize.height //5,

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
                                  // style: tempTextStyles[index],
                                ),
                                SizedBox(
                                  width: 0.0138 * _screenSize.width, //5,
                                ),
                                subtitleList.length > 0 &&
                                        subtitleList[index] != null &&
                                        subtitleList[index].length > 0
                                    ? Container(
                                        width: 0.0138 * _screenSize.width, //5,

                                        height: 0.0138 * _screenSize.width, //5,

                                        decoration: BoxDecoration(
                                          color: MAIN_GOLD_COLOR,
                                          borderRadius: BorderRadius.circular(
                                            0.138 * _screenSize.width, //50,
                                          ),
                                        ))
                                    : SizedBox(),
                                Expanded(child: SizedBox()),
                              ],
                            ),

                            (subtitleList[index] != null &&
                                    subtitleList[index] != "")
                                ? Expanded(
                                    child: Container(
                                      // color: Colors.amber,
                                      width: 0.6 * _screenSize.width,
                                      child: Text(
                                        subtitleList[index],
                                        style: TextStyle(
                                          fontSize:
                                              0.0333 * _screenSize.width, //12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       subtitleList[index] ?? "",
                            //       textAlign: TextAlign.start,
                            //       style: TextStyle(
                            //         fontSize: 12,
                            //         fontWeight: FontWeight.w400,
                            //         color: Colors.grey,
                            //       ),
                            //       maxLines: 1,
                            //       overflow: TextOverflow.ellipsis,
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 5, child: SizedBox()),
                    Container(
                      width: 0.041 * _screenSize.width,
                      // color: Colors.greenAccent,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 0.041 * _screenSize.width, //15,
                        color: Colors.grey[400],
                      ),
                    ),
                    Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.001 * _screenSize.width, //0.3,

              height: 0.003125 * _screenSize.height, //2,
            ),
          ],
        );
      },
    );
  }
}
