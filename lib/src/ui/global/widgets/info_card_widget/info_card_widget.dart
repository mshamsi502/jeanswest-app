// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-03  ,  17:25 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/constants.dart';

class InfoCardWidget extends StatefulWidget {
  final List<String> text;
  final List<Widget> icon;
  final String imagePAth;
  final TextDirection customDirection;
  final Size screenSize;

  InfoCardWidget({
    Key key,
    this.text,
    this.imagePAth,
    this.customDirection,
    this.icon,
    this.screenSize,
  }) : super(key: key);

  State<StatefulWidget> createState() => _InfoCardWidgetState();
}

class _InfoCardWidgetState extends State<InfoCardWidget> {
  double imageSize;
  GlobalKey widgetKey = GlobalKey();
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
      print('++ widgetKey is NOOOOT NULLLL');
      RenderBox box = widgetKey.currentContext.findRenderObject() as RenderBox;
      size = box.size;
      if (size != null) {
        print('height : ${size.height}');
        print('width : ${size.width}');
        print('++ size is NOOOOT NULLLL');
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
            spreadRadius: -8,
            blurRadius: 13,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Directionality(
        textDirection: widget.customDirection,
        // textDirection: ltrTextDirection,
        // textDirection: rtlTextDirection,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  ListView.builder(
                    itemCount: widget.text.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: 0.0078 * _screenSize.height //5,
                            ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.icon == null ||
                                    index >= widget.icon.length ||
                                    widget.icon[index] == null
                                ? Container()
                                : Row(
                                    children: [
                                      widget.icon[index],
                                      SizedBox(
                                          width: 0.0138 * _screenSize.width //5,
                                          ),
                                    ],
                                  ),
                            Expanded(
                              child: Text(
                                widget.text[index],
                                style: TextStyle(
                                  fontSize: 0.027 * _screenSize.width, //10
                                ),
                                textDirection: rtlTextDirection,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 0.027 * _screenSize.width, //10,
            ),
            Container(
              height: imageSize,
              width: imageSize,
              // child: SvgPicture.asset(
              //   'assets/images/svg_images/profile/more/family_trust.svg',
              // ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  0.22 * _screenSize.width, //80,
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: new AssetImage(
                    widget.imagePAth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
