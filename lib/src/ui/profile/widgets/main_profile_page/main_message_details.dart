// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-08  ,  13:11 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-message-info.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMessages/dataFavorite/message-data.dart';

import 'package:jeanswest/src/ui/profile/screens/messages/single_message_page.dart';
import 'package:jeanswest/src/utils/time_ago.dart';

class MainMessageDetails extends StatefulWidget {
  final double height;
  final int messageIndex;
  final MessageData message;
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
  // List<bool> readMessages;
  bool haveUnreadMessage;
  // @override
  // void initState() {
  //   // ignore: deprecated_member_use
  //   readMessages = new List<bool>();
  //   for (var i = 0; i < userMessages.length; i++) {
  //     readMessages.add(false);
  //   }
  //   for (var i = 0; i < userMessages.length; i++) {
  //     if (!userMessages[i].isReaded) {
  //       readMessages[i] = true;
  //       break;
  //     } else {
  //       readMessages[i] = false;
  //     }
  //   }
  //   super.initState();
  // }

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
              Container(
                width: 0.111 * _screenSize.width, //40,
                height: widget.height,
                child: Column(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: BLUE_SKY_COLOR,
                          ),
                          borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: DARK_GREY,
                        backgroundImage: AssetImage(
                          'assets/images/png_images/global/logo/${widget.message.engSender}.png',
                        ),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(width: 0.0138 * _screenSize.width //5
                  ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      height: 0.111 * _screenSize.width, //40,
                      child: Text(
                        '${widget.message.perTitle} (${widget.message.perSender})',
                        style: TextStyle(
                          fontSize: 0.0361 * _screenSize.width, //13
                        ),
                      ),
                    ),
                    widget.message.price == null || widget.message.price == 0
                        ? SizedBox()
                        : Text(
                            'مدت اعتبار از تاریخ ${widget.message.startShamsiYear}/${widget.message.startGeoYear}/${widget.message.startShamsiDay} تا تاریخ ${widget.message.endShamsiYear}/${widget.message.endShamsiMonth}/${widget.message.endShamsiDay}',
                            style: TextStyle(
                              fontSize: 0.03 * _screenSize.width, //11
                              color: MAIN_BLUE_COLOR,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    widget.message.price == null || widget.message.price == 0
                        ? SizedBox()
                        : Text(
                            'مبلغ ${widget.message.price} تومان',
                            style: TextStyle(
                              fontSize: 0.03 * _screenSize.width, //11
                              color: MAIN_BLUE_COLOR,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    // SizedBox(height: 5),
                    Expanded(
                      child: Container(
                        height: 0.03125 * _screenSize.height, //20
                        child: Text(
                          widget.message.text,
                          maxLines: 3,
                          // overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 0.027 * _screenSize.width, //10
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      TimeAgo.timeAgoSinceDate(
                        widget.message.sendDate,
                        30,
                      ),
                      style: TextStyle(
                        fontSize: 12,
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
                                horizontal: 10, vertical: 5),
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
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                  builder: (context) =>
                      SingleMessagePage(notificationMessage: widget.message)));
        });
  }
}
