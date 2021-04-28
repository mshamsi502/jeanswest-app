// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/ui/profile/widgets/global/expansion-tile_widget.dart';

class QuestionsWidget extends StatefulWidget {
  final String headerAsset;

  const QuestionsWidget({Key key, this.headerAsset}) : super(key: key);
  State<StatefulWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: 0.31 * _screenSize.height, //200,
              width: _screenSize.width,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: new AssetImage(widget.headerAsset),
                ),
              ),
            ),
            Divider(
              thickness: 0.001689 * _screenSize.height, //1,
              height: 0.00138 * _screenSize.height, //0.5,
              color: MAIN_BLUE_COLOR,
            ),
            SizedBox(
              height: 0.031 * _screenSize.height, //20,
            ),
            ExpansionTileWidget(
              faq: faqData,
            ),
          ],
        ),
      ),
    );
  }
}
