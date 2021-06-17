// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-08  ,  13:11 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

import 'package:jeanswest/src/constants/global/globalInstances/profile/userAllInfo/user-message-info.dart';
import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/profile/message/single-message.dart';
import 'package:jeanswest/src/ui/profile/screens/messages/single_message_page.dart';
import 'package:jeanswest/src/utils/time_ago.dart';

class MainMessageDetails extends StatefulWidget {
  final double height;
  final int messageIndex;
  final SingleMessage message;
  // final UserMessageResult message;
  final Function changeHaveUnreadMessage;

  const MainMessageDetails({
    Key key,
    this.height,
    this.messageIndex,
    this.changeHaveUnreadMessage,
    this.message,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MainMessageDetailsState();
}

class _MainMessageDetailsState extends State<MainMessageDetails> {
  bool haveUnreadMessage;

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        child: Container(
          height: widget.height,
          width: _screenSize.width,
          color: Colors.transparent,
          padding: EdgeInsets.all(0.028 * _screenSize.width //10
              ),
          child: Row(
            children: [
              SizedBox(
                width: 0.0138 * _screenSize.width, //5
              ),
              SizedBox(width: 0.0138 * _screenSize.width //5
                  ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      // height: 0.111 * _screenSize.width, //40,
                      child: Text(
                        // '${widget.message.perTitle} (${widget.message.perSender})',
                        widget.message.title,
                        style: TextStyle(
                          fontSize: 0.038 * _screenSize.width, //14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.0078 * _screenSize.height //5,
                        ),
                    Container(
                      // color: Colors.red,
                      height: widget.height - 70,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Html(
                          data: widget.message.body,
                          style: {
                            "p": Style.fromTextStyle(
                              TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                            "table": Style.fromTextStyle(
                              TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          },
                          // customTextStyle: (node, style) {
                          //   return TextStyle(
                          //     fontSize: 12,
                          //     fontWeight: FontWeight.w400,
                          //     fontFamily: "IRANSans",
                          //     color: Colors.black87,
                          //   );
                          // },
                          // customRender: (node, children) {
                          //   if (node is dom.Element) {
                          //     switch (node.localName) {
                          //       case "custom_tag": // using this, you can handle custom tags in your HTML
                          //         return Column(children: children);
                          //     }
                          //   }
                          //   return null;
                          // },
                          // customTextAlign: (node) {
                          //   return TextAlign.right;
                          // }
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      TimeAgo.timeAgoSinceDate(
                        widget.message.datetime.createdAt,
                        30,
                        dateFormat: STANDARD_DATE_FORMAT,
                      ),
                      style: TextStyle(
                        fontSize: 0.0333 * _screenSize.width, //12,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 0.138 * _screenSize.width, //50
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.023 * _screenSize.height //15
                        ),
                    widget.message.isReaded != null && widget.message.isReaded
                        ? Container()
                        : Container(
                            height: 0.022 * _screenSize.width, //8,
                            width: 0.022 * _screenSize.width, //8,
                            margin: EdgeInsets.symmetric(
                                horizontal: 0.027 * _screenSize.width, //10,
                                vertical: 0.0078 * _screenSize.height //5,
                                ),
                            decoration: BoxDecoration(
                              color: MAIN_GOLD_COLOR,
                              borderRadius: BorderRadius.circular(
                                  0.138 * _screenSize.width //50
                                  ),
                            ),
                          ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                      child: Icon(
                        Icons.chevron_right_rounded,
                        color: DARK_GREY,
                        size: 0.07777 * _screenSize.width, //28
                      ),
                    ),
                    SizedBox(height: 0.0078 * _screenSize.height //5,
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            widget.message.isReaded = true;

            haveUnreadMessage = false;
            for (int index = 0; index < userMessages.length; index++) {
              if (!userMessages[index].isReaded) {
                haveUnreadMessage = true;
                break;
              }
            }

            if (!haveUnreadMessage) widget.changeHaveUnreadMessage();
          });

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleMessagePage(
                        message: widget.message,
                        title:
                            // '${widget.message.perTitle} (${widget.message.perSender})',
                            widget.message.title,
                      )));
        });
  }
}
