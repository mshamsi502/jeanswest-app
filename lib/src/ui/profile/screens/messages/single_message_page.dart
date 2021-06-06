// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-06  ,  16:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'package:jeanswest/src/models/profile/message/single-message.dart';

import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';
class SingleMessagePage extends StatefulWidget {
  final String title;
  final SingleMessage message;

  const SingleMessagePage({Key key, this.message, this.title})
      : super(key: key);
  @override
  _SingleMessagePageState createState() => _SingleMessagePageState();
}

class _SingleMessagePageState extends State<SingleMessagePage> {
  ScrollController scrollController = new ScrollController();

  String categoryText;
  @override
  void initState() {
    // categoryText = widget.message.perCategory.length == 1
    //     ? 'خرید در دسته بندی '
    //     : 'خرید در دسته بندی های ';
    // for (int index = 0; index < widget.message.perCategory.length; index++) {
    //   categoryText = categoryText + widget.message.perCategory[index];
    //   if (index != widget.message.perCategory.length - 1)
    //     categoryText = categoryText + ' - ';
    // }
    // widget.message.perCategory.forEach((element) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.white,
            height: _screenSize.height,
            child: Column(
              children: [
                AppBarWithCloseWidget(
                  title: widget.title,
                  closeOnTap: () => Navigator.pop(context),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          widget.message.image,
                          width: _screenSize.width,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(
                          height: 0.016 * _screenSize.height, //10
                        ),
                        Html(
                          data: widget.message.body,
                          style: {
                            "p": Style(
                              fontSize: FontSize(14),
                            ),
                            "table": Style(
                              backgroundColor:
                                  Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                              border:
                                  Border.all(color: Colors.black87, width: 0.5),
                            ),
                            // some other granular customizations are also possible
                            "tr": Style(
                              border:
                                  Border.all(color: Colors.black87, width: 0.5),
                            ),

                            "th": Style(
                              padding: EdgeInsets.all(6),
                              backgroundColor: Colors.grey,
                            ),
                            "td": Style(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.topLeft,
                            ),
                          },
                        
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
