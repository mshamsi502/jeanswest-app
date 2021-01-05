// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/message/user_ticket/user_ticket.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/send_message_bar_widget.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_more.dart';

class SingleTicketPage extends StatefulWidget {
  final UserTicket ticket;
  final int numberOfTicket;
  final Size screenSize;

  const SingleTicketPage({
    Key key,
    this.ticket,
    this.screenSize,
    this.numberOfTicket,
  }) : super(key: key);
  State<StatefulWidget> createState() => _SingleTicketPageState();
}

class _SingleTicketPageState extends State<SingleTicketPage> {
  ScrollController scrollController;
  @override
  void initState() {
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: _screenSize.width,
                child: AppBarWithBackWidget(title: widget.ticket.title),
              ),
              Expanded(
                child: Container(
                  width: _screenSize.width,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: _screenSize.width,
                          child: Column(
                            children: [
                              Container(
                                height: _screenSize.height -
                                    0.195 * _screenSize.height, //125,
                                color: F7_BACKGROUND_COLOR,
                                child: ListView.builder(
                                  reverse: true,
                                  controller: scrollController,
                                  itemCount: widget.ticket.message.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 0.015 *
                                                _screenSize.height, //10,
                                            left: 0.0416 *
                                                _screenSize.width, //15,
                                            right: 0.0416 *
                                                _screenSize.width, //15,
                                            bottom: index == 0
                                                ? 0.03125 *
                                                    _screenSize.height //20
                                                : 0.0078 *
                                                    _screenSize.height, //5
                                          ),
                                          padding: EdgeInsets.all(
                                            0.015 * _screenSize.height, //10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              0.011 * _screenSize.width, //4,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey[200],
                                            ),
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                spreadRadius: 0.8,
                                                blurRadius: 4,
                                                color: Colors.grey[300],
                                                offset: Offset(
                                                  0.0078 *
                                                      _screenSize.height, //5

                                                  0.0078 *
                                                      _screenSize.height, //5
                                                ),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 0.083 *
                                                        _screenSize.width, //30
                                                    height: 0.083 *
                                                        _screenSize.width, //30
                                                    child: Icon(
                                                      widget
                                                              .ticket
                                                              .message[widget
                                                                      .ticket
                                                                      .message
                                                                      .length -
                                                                  1 -
                                                                  index]
                                                              // widget.ticket.message[index]
                                                              .isUser
                                                          ? Icons.account_circle
                                                          : Icons.support_agent,
                                                      color: widget
                                                              .ticket
                                                              .message[widget
                                                                      .ticket
                                                                      .message
                                                                      .length -
                                                                  1 -
                                                                  index]
                                                              // widget.ticket.message[index]
                                                              .isUser
                                                          ? Colors.green
                                                          : MAIN_BLUE_COLOR,
                                                      size: 0.069 *
                                                          _screenSize
                                                              .width, //25,
                                                    ),
                                                  ),
                                                  // SizedBox(width: 5),
                                                  Expanded(
                                                    child: Text(
                                                      widget
                                                          .ticket
                                                          .message[widget
                                                                  .ticket
                                                                  .message
                                                                  .length -
                                                              1 -
                                                              index]
                                                          // widget
                                                          //     .ticket.message[index]
                                                          .title,
                                                      style: TextStyle(
                                                        fontSize: 0.036 *
                                                            _screenSize
                                                                .width, //13,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Text(
                                                    widget
                                                        .ticket
                                                        .message[widget
                                                                .ticket
                                                                .message
                                                                .length -
                                                            1 -
                                                            index]
                                                        // widget.ticket.message[index]
                                                        .text,
                                                    style: TextStyle(
                                                      fontSize: 0.03 *
                                                          _screenSize
                                                              .width, //11,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SendMessageBarWidget(
                                isEnable: !widget.ticket.isClosed,
                                hintText: 'پیام خود را وارد کنید ...',
                                disableText:
                                    'برای پیام دادن یک تیکت جدید باز کنید',
                                sendText: (String text) => setState(() {
                                  addNewMessageInTicket(
                                      widget.numberOfTicket, text);
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
