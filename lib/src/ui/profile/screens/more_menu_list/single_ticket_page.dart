// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/profile/svg_images/profile_svg_images.dart';
import 'package:jeanswest/src/models/profile/gender/gender.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/send_message_bar_widget.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_more.dart';

import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';

class SingleTicketPage extends StatefulWidget {
  final UserMainInfo user;
  final DataTicket ticket;
  final int numberOfTicket;
  final Size screenSize;
  final Function() closeTicket;

  const SingleTicketPage({
    Key key,
    this.ticket,
    this.screenSize,
    this.numberOfTicket,
    this.closeTicket,
    this.user,
  }) : super(key: key);
  State<StatefulWidget> createState() => _SingleTicketPageState();
}

class _SingleTicketPageState extends State<SingleTicketPage> {
  ScrollController scrollController;
  // bool userHasClosed = false;
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
                child: AppBarWithBackWidget(
                  title: widget.ticket.title,
                  option: widget.ticket.status == 1
                      ? PopupMenuButton(
                          onSelected: (value) {
                            // setState(() {
                            //   userHasClosed = true;
                            // });
                            widget.closeTicket();
                            Navigator.pop(context);
                            // setState(() {
                            //   userHasClosed = true;
                            //   print('closing ticket..');
                            // });
                          },
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Icon(Icons.exit_to_app_outlined),
                                    ),
                                    Text(
                                      'پایان گفتگو',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                )),
                          ],
                        )
                      : SizedBox(),
                  onTap: () => Navigator.pop(context),
                ),
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
                                margin: EdgeInsets.only(
                                  top: 50,
                                ),
                                height: _screenSize.height -
                                    0.195 * _screenSize.height, //125,
                                color: F7_BACKGROUND_COLOR,
                                child: ListView.builder(
                                  reverse: true,
                                  controller: scrollController,
                                  itemCount: widget.ticket.context.length,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    bool isCustomer = widget
                                            .ticket
                                            .context[
                                                widget.ticket.context.length -
                                                    1 -
                                                    index]
                                            // widget.ticket.message[index]
                                            .owner ==
                                        'customer';
                                    return Column(
                                      children: [
                                        Container(
                                            height: index ==
                                                    widget.ticket.context
                                                            .length -
                                                        1
                                                ? 20
                                                : 0),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 5,
                                              left: 0.0416 *
                                                  _screenSize.width, //15,
                                              right: 0.0416 *
                                                  _screenSize.width, //15,
                                              bottom: 10),
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
                                                color: Colors.grey[200],
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
                                              Container(
                                                color: BLUE_SKY_FADE_COLOR,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3, vertical: 5),
                                                child: Row(
                                                  children: [
                                                    SizedBox(width: 5),
                                                    isCustomer
                                                        ? Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color:
                                                                  TURQUOISE_BLUE_COLOR,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .contain,
                                                                image:
                                                                    new AssetImage(
                                                                  (widget.user.gender == null ||
                                                                          widget.user.gender.engName ==
                                                                              null ||
                                                                          widget.user.gender.engName ==
                                                                              '')
                                                                      ? 'assets/images/png_images/global/userProfile/user-unknown.png'
                                                                      : widget.user.gender == male ||
                                                                              widget.user.gender.engName == 'male'
                                                                          ? 'assets/images/png_images/global/userProfile/user-male.png'
                                                                          : widget.user.gender == female || widget.user.gender.engName == 'female'
                                                                              ? 'assets/images/png_images/global/userProfile/user-female.png'
                                                                              : 'assets/images/png_images/global/userProfile/user-unknown.png',
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : SizedBox(),
                                                    SizedBox(width: 10),
                                                    Expanded(
                                                      child: Text(
                                                        isCustomer
                                                            ? '${widget.user.firstName} ${widget.user.lastName}'
                                                            : 'پاسخ پشتیبانی',
                                                        textAlign: isCustomer
                                                            ? TextAlign.right
                                                            : TextAlign.left,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10),
                                                    !isCustomer
                                                        ? Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color:
                                                                  TURQUOISE_BLUE_COLOR,
                                                            ),
                                                            child: ProfileSvgImages
                                                                .profileOperator,
                                                          )
                                                        : SizedBox(),
                                                    SizedBox(width: 5),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 10),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      widget
                                                          .ticket
                                                          .context[widget
                                                                  .ticket
                                                                  .context
                                                                  .length -
                                                              1 -
                                                              index]
                                                          // widget.ticket.message[index]
                                                          .text,
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        (index == 0) &&
                                                (widget.ticket.status == 0)
                                            ? Container(
                                                height: 300,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 200,
                                                      decoration: BoxDecoration(
                                                        // color: Colors.red,
                                                        image: DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: new AssetImage(
                                                            'assets/images/png_images/profile/more/ticket-is-closed.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 30),
                                                        child: Text(
                                                          'این گفتگو پایان یافته است برای ایجاد گفتگو جدید به صحفه قبل مراجعه کنید',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color:
                                                                MAIN_BLUE_COLOR,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SendMessageBarWidget(
                                isEnable: !(widget.ticket.status == 0),
                                hintText: 'پیام خود را وارد کنید ...',
                                disableText: 'گفتگو پایان یافته است',
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
