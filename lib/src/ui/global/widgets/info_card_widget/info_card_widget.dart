// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:drop_cap_text/drop_cap_text.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';

class InfoCardWidget extends StatefulWidget {
  final String text;
  final List<Widget> icon;
  final String imagePAth;
  final TextDirection customDirection;
  final Size screenSize;
  final bool isEven;

  InfoCardWidget({
    Key key,
    this.text,
    this.imagePAth,
    this.customDirection,
    this.icon,
    this.screenSize,
    this.isEven,
  }) : super(key: key);

  State<StatefulWidget> createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  double imageSize;
  GlobalKey<FormState> widgetKey = GlobalKey<FormState>();
  Widget body;
  Size size;
  var keyContext;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSize());
    imageSize = 0.27 * widget.screenSize.width; //100,
    super.initState();
  }

  getSize() {
    if (widgetKey != null && widgetKey.currentContext != null) {
      RenderBox box = widgetKey.currentContext.findRenderObject() as RenderBox;
      size = box.size;
      if (size != null) {
        print('height : ${size.height}');
        print('width : ${size.width}');
      } else
        print('-- size is NULLLL');
    } else
      print('-- widgetKey is NULLLL');
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      key: widgetKey,
      padding: EdgeInsets.all(
        0.027 * _screenSize.width, //10,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: 0.027 * _screenSize.width, //10,
          vertical: 0.0078 * _screenSize.height //5,
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0078 * _screenSize.height //5,
            ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.0138 * _screenSize.width, //5,
            blurRadius: 0.022 * _screenSize.width, //8,
            color: Colors.grey[200],
            offset: Offset(
              0,
              0.0083 * _screenSize.width, //3,
            ), // changes position of shadow
          ),
        ],
      ),
      child: Directionality(
        textDirection: widget.customDirection,
        child: DropCapText(
          // totalText,
          widget.text,
          // textAlign: TextAlign.justify,
          mode: DropCapMode.baseline,
          style: TextStyle(
            fontFamily: 'IRANSans',
            fontSize: 0.038 * _screenSize.width, //14,
            height: 1.5, //0.0023 * _screenSize.height, //1.5,
          ),
          textDirection: rtlTextDirection,
          dropCapPosition:
              widget.isEven ? DropCapPosition.end : DropCapPosition.start,
          dropCapPadding: EdgeInsets.all(
            0.0138 * _screenSize.width, //5,
          ),
          dropCap: DropCap(
            width: 0.27 * _screenSize.width, //100,
            //0.33333 * _screenSize.width, //120,
            height: 0.27 * _screenSize.width, //100,
            //0.33333 * _screenSize.width, //120,
            child: Container(
              padding: EdgeInsets.all(
                0.027 * _screenSize.width, //10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  0.27 * _screenSize.width, //100,
                ),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                    widget.imagePAth,
                  ),
                ),
              ),
            ),
          ),
          //   );
          // },
        ),
      ),
    );
  }
}
