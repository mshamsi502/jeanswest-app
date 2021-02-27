// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-08  ,  13:11 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/user_messages.dart';
import 'package:jeanswest/src/ui/profile/screens/main_menu_list/single_message_page.dart';
import 'package:jeanswest/src/utils/time_ago.dart';

class MainMessageDetails extends StatefulWidget {
  final double height;
  final int messageIndex;
  final Function changeHaveUnreadMessage;

  const MainMessageDetails({
    Key key,
    this.height,
    this.messageIndex,
    this.changeHaveUnreadMessage,
  }) : super(key: key);

  State<StatefulWidget> createState() => _MainMessageDetailsState();
}

class _MainMessageDetailsState extends State<MainMessageDetails> {
  List<bool> readMessages;
  bool haveUnreadMessage;
  @override
  void initState() {
    // ignore: deprecated_member_use
    readMessages = new List<bool>();
    for (var i = 0; i < userMessages.length; i++) {
      readMessages.add(false);
    }
    for (var i = 0; i < userMessages.length; i++) {
      if (!userMessages[i].readed) {
        readMessages[i] = true;
        break;
      } else {
        readMessages[i] = false;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        child: Container(
          height: widget.height,
          width: _screenSize.width,
          padding: EdgeInsets.all(0.028 * _screenSize.width //10
              ),
          child: Row(
            children: [
              Container(
                width: 0.022 * _screenSize.width, //8,
                height: widget.height,
                child: Column(
                  children: [
                    SizedBox(height: 0.023 * _screenSize.height //15
                        ),
                    userMessages[userMessages.length - widget.messageIndex - 1]
                            .readed
                        ? Container()
                        : Container(
                            height: 0.022 * _screenSize.width, //8,
                            width: 0.022 * _screenSize.width, //8,
                            decoration: BoxDecoration(
                              color: MAIN_GOLD_COLOR,
                              borderRadius: BorderRadius.circular(
                                  0.138 * _screenSize.width //50
                                  ),
                            ),
                          ),
                    Expanded(child: SizedBox()),
                  ],
                ),
              ),
              SizedBox(
                width: 0.0138 * _screenSize.width, //5
              ),
              Container(
                width: 0.111 * _screenSize.width, //40,
                height: widget.height,
                child: Column(
                  children: [
                    Container(
                      height: 0.111 * _screenSize.width, //40,
                      width: 0.111 * _screenSize.width, //40,
                      padding: EdgeInsets.all(0.0166 * _screenSize.width //6,
                          ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.0083 * _screenSize.width, //3,
                          color: MAIN_BLUE_COLOR,
                        ),
                        borderRadius:
                            BorderRadius.circular(0.138 * _screenSize.width //50
                                ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/png_images/global/logo/${userMessages[userMessages.length - widget.messageIndex - 1].engSender}.png'),
                            fit: BoxFit.cover,
                          ),
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
                        '${userMessages[userMessages.length - widget.messageIndex - 1].title} (${userMessages[userMessages.length - widget.messageIndex - 1].sender})',
                        style: TextStyle(
                          fontSize: 0.0361 * _screenSize.width, //13
                        ),
                      ),
                    ),
                    ListView.builder(
                        itemCount: userMessages[
                                userMessages.length - widget.messageIndex - 1]
                            .conditions
                            .length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder:
                            (BuildContext context, int conditionsIndex) {
                          return Row(
                            children: [
                              Expanded(
                                  child: Text(
                                userMessages[userMessages.length -
                                        widget.messageIndex -
                                        1]
                                    .conditions[conditionsIndex],
                                style: TextStyle(
                                  fontSize: 0.027 * _screenSize.width, //10
                                  color: MAIN_BLUE_COLOR,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                            ],
                          );
                        }),
                    Text(
                      'مبلغ ${userMessages[userMessages.length - widget.messageIndex - 1].price} تومان',
                      style: TextStyle(
                        fontSize: 0.03 * _screenSize.width, //11
                        color: MAIN_BLUE_COLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      height: 0.03125 * _screenSize.height, //20
                      child: Text(
                        userMessages[
                                userMessages.length - widget.messageIndex - 1]
                            .text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 0.027 * _screenSize.width, //10
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
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
                    Text(
                      TimeAgo.timeAgoSinceDate(
                          '${userMessages[userMessages.length - widget.messageIndex - 1].yearOfSend}-${userMessages[userMessages.length - widget.messageIndex - 1].monthOfSend}-${userMessages[userMessages.length - widget.messageIndex - 1].dayOfSend} ${userMessages[userMessages.length - widget.messageIndex - 1].hourOfSend}:${userMessages[userMessages.length - widget.messageIndex - 1].minOfSend}'),
                      style: TextStyle(
                        fontSize: 0.023 * _screenSize.width, //9,
                        color: MAIN_BLUE_COLOR,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      width: 0.054 * _screenSize.width, //20
                      height: 0.054 * _screenSize.width, //20
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: MAIN_BLUE_COLOR,
                        size: 0.0416 * _screenSize.width, //15
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            userMessages[userMessages.length - widget.messageIndex - 1].readed =
                true;
            readMessages[userMessages.length - widget.messageIndex - 1] = false;
            setState(() {
              haveUnreadMessage = false;
            });
            readMessages.forEach((element) {
              if (element)
                setState(() {
                  haveUnreadMessage = true;
                });
            });
            if (!haveUnreadMessage) widget.changeHaveUnreadMessage();
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleMessagePage(
                      notificationMessage: userMessages[
                          userMessages.length - widget.messageIndex - 1])));
        });
  }
}
