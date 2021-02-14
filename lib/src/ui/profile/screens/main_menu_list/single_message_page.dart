// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-06  ,  16:00 AM
// ****************************************************************************

import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/profile/message/user_noti/noti_message.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';

class SingleMessagePage extends StatefulWidget {
  final NotificationMessage notificationMessage;

  const SingleMessagePage({Key key, this.notificationMessage})
      : super(key: key);
  @override
  _SingleMessagePageState createState() => _SingleMessagePageState();
}

class _SingleMessagePageState extends State<SingleMessagePage> {
  ScrollController scrollController = new ScrollController();
  @override
  void initState() {
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
                AppBarWithBackWidget(title: widget.notificationMessage.sender),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.0156 * _screenSize.height, //10
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(width: 0.028 * _screenSize.width //10
                              ),
                          Container(
                            height: 0.111 * _screenSize.width, //40,
                            width: 0.111 * _screenSize.width, //40,
                            padding:
                                EdgeInsets.all(0.0166 * _screenSize.width //6,
                                    ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.0083 * _screenSize.width, //3,
                                color: MAIN_BLUE_COLOR,
                              ),
                              borderRadius: BorderRadius.circular(
                                  0.138 * _screenSize.width //50
                                  ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/png_images/global/logo/${widget.notificationMessage.engSender}.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.0138 * _screenSize.width, //5
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Bubble(
                                  margin: BubbleEdges.only(
                                      top: 0.028 * _screenSize.width //10
                                      ),
                                  nipOffset: 0.0078 * _screenSize.height, //5,
                                  alignment: Alignment.bottomLeft,
                                  nipWidth: 0.03125 * _screenSize.height, //20,
                                  nipHeight: 0.0156 * _screenSize.height, //10,
                                  nip: BubbleNip.rightBottom,
                                  color: BLUE_SKY_COLOR,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.notificationMessage.title,
                                          style: TextStyle(
                                              fontSize: 0.038 *
                                                  _screenSize.width, //14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height:
                                              0.0156 * _screenSize.height, //10
                                        ),
                                        Container(
                                          height: 0.2812 *
                                              _screenSize.height, //180,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.contain,
                                              image: new AssetImage(
                                                  'assets/images/png_images/profile/big_jeanswest_shop.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              0.0156 * _screenSize.height, //10
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                widget.notificationMessage.text,
                                                style: TextStyle(
                                                    fontSize: 0.033 *
                                                        _screenSize.width, //12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              0.0156 * _screenSize.height, //10
                                        ),
                                        ListView.builder(
                                            itemCount: widget
                                                .notificationMessage
                                                .conditions
                                                .length,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (BuildContext context,
                                                int conditionsIndex) {
                                              return Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                          child: Text(
                                                        widget.notificationMessage
                                                                .conditions[
                                                            conditionsIndex],
                                                        style: TextStyle(
                                                          fontSize: 0.028 *
                                                              _screenSize
                                                                  .width, //10
                                                          color:
                                                              MAIN_BLUE_COLOR,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 0.0078 *
                                                        _screenSize.height, //5
                                                  ),
                                                ],
                                              );
                                            }),
                                        SizedBox(
                                          height:
                                              0.0078 * _screenSize.height, //5
                                        ),
                                        Text(
                                          'مبلغ ${widget.notificationMessage.price} تومان',
                                          style: TextStyle(
                                            fontSize:
                                                0.03 * _screenSize.width, //11
                                            color: MAIN_BLUE_COLOR,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${widget.notificationMessage.hourOfSend}:${widget.notificationMessage.minOfSend}',
                                                style: TextStyle(
                                                  fontSize: 0.028 *
                                                      _screenSize.width, //10
                                                  color: MAIN_BLUE_COLOR,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              )
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.0156 * _screenSize.height, //10
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
