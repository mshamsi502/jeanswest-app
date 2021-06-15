// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-06  ,  16:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:jeanswest/src/constants/global/option.dart';
import 'package:jeanswest/src/models/api_body/PagenationFilter/page-filter-req-body.dart';
import 'package:jeanswest/src/models/api_body/PagenationFilter/page-option-req-body.dart';
import 'package:jeanswest/src/models/api_body/PagenationFilter/page-req-body.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-int.dart';
import 'package:jeanswest/src/models/api_body/operator/operator-string.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMessage/user-message-result.dart';

import 'package:jeanswest/src/models/profile/message/single-message.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/main_profile_page/main_message_details.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserMessagesInfo/get-user-messages-info.dart';

class InboxMessagePage extends StatefulWidget {
  final Function changeHaveUnreadMessage;

  const InboxMessagePage({Key key, this.changeHaveUnreadMessage})
      : super(key: key);
  @override
  _InboxMessagePageState createState() => _InboxMessagePageState();
}

class _InboxMessagePageState extends State<InboxMessagePage> {
  List<SingleMessage> _messages = [];
  int _currentPage = 1;
  int _total;
  bool _isLoading = true;
  ScrollController _listScrollController = new ScrollController();
  //

  @override
  void initState() {
    super.initState();
    _getMessaeges();
    _listScrollController.addListener(() {
      double maxScroll = _listScrollController.position.maxScrollExtent;
      double currentScroll = _listScrollController.position.pixels;

      if (maxScroll - currentScroll <= 200 &&
          _messages.length < _total) if (!_isLoading)
        _getMessaeges(page: _currentPage + 1);
    });
  }

  _getMessaeges({int page: 1, bool refresh: false}) async {
    setState(() => _isLoading = true);
    PageReqBody body = PageReqBody(
        filter: PageFilterReqBody(
            createdAt: OperationString(oGT: "2021-01-01 00:00:00")),
        option: PageOptionReqBody(
            page: OperationInt(oEQ: page),
            limit: OperationInt(oEQ: SOME_OF_IN_PAGENATION_LIST)));
    var response = await userMessagesInfo(body: body.map);
    setState(() {
      if (refresh) _messages.clear();

      List<UserMessageResult> resMessage = response['messages'];
      if (resMessage != null) {
        resMessage.forEach((message) {
          _messages.add(
            SingleMessage(
              id: message.id,
              active: message.active,
              title: message.title,
              body: message.body,
              image: message.image,
              version: message.version,
              datetime: message.datetime,
            ),
          );
        });
      }
      _total = response['total'];
      print("total : $_total ");
      _currentPage = response['currentPage'];
      print("currentPage : $_currentPage ");
      _isLoading = false;
    });
  }

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
                  onTapBack: () => Navigator.pop(context),
                ),
                Divider(
                  height: 0.00138 * _screenSize.height, //0.5,
                  thickness: 0.00138 * _screenSize.height, //0.5,
                  color: Colors.grey[300],
                ),
                Expanded(
                  child: Container(
                    // color: Colors.amber,
                    child: ListView.builder(
                        controller: _listScrollController,
                        itemCount: _messages.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int messageIndex) {
                          return Column(
                            children: [
                              MainMessageDetails(
                                // height: 0.29 * _screenSize.height, //171,
                                height: 140,
                                messageIndex:
                                    _messages.length - messageIndex - 1,
                                message: _messages[messageIndex],
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
