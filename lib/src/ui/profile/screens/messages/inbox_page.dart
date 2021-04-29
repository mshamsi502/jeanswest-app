// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-06  ,  16:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-message-info.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/main_message_details.dart';

class InboxPage extends StatefulWidget {
  final Function changeHaveUnreadMessage;

  const InboxPage({Key key, this.changeHaveUnreadMessage}) : super(key: key);
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: _screenSize.height,
            width: _screenSize.width,
            color: Colors.white,
            child: Column(
              children: [
                AppBarWithBackWidget(
                  title: 'پیام ها',
                  onTap: () => Navigator.pop(context),
                ),
                Divider(
                  height: 0.00138 * _screenSize.height, //0.5,
                  thickness: 0.00138 * _screenSize.height, //0.5,
                  color: Colors.grey[300],
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: userMessages.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int messageIndex) {
                          return Column(
                            children: [
                              MainMessageDetails(
                                height: 0.234 * _screenSize.height, //150,
                                messageIndex:
                                    userMessages.length - messageIndex - 1,
                                message: userMessages[messageIndex],
                                changeHaveUnreadMessage:
                                    widget.changeHaveUnreadMessage,
                              ),
                              Divider(
                                height: 0.00138 * _screenSize.height, //0.5,
                                thickness: 0.00138 * _screenSize.height, //0.5,
                                color: Colors.grey[300],
                              ),
                            ],
                          );
                        }),
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
