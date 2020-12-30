//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/test_data/user_tickets.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/single_ticket_page.dart';

class MainTicketWidget extends StatefulWidget {
  final Function() openNewTicketPanel;
  final String headerAsset;

  const MainTicketWidget({Key key, this.openNewTicketPanel, this.headerAsset})
      : super(key: key);
  State<StatefulWidget> createState() => _MainTicketWidgetState();
}

class _MainTicketWidgetState extends State<MainTicketWidget> {
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: MAIN_GOLD_COLOR,
            // mini: true,
            child: Container(
              padding: EdgeInsets.all(1),
              child: GlobalSvgImages.editIconForLeft,
              height: 25,
              width: 25,
            ),
            onPressed: () => widget.openNewTicketPanel()),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 200,
                width: _screenSize.width,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: new AssetImage(widget.headerAsset),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: userTickets.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                      width: _screenSize.width,
                      // height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey[200],
                        ),
                        boxShadow: <BoxShadow>[
                          userTickets[userTickets.length - 1 - index].isClosed
                              ? BoxShadow(
                                  spreadRadius: 0.2,
                                  blurRadius: 0.5,
                                  color: Colors.grey[100],
                                )
                              : BoxShadow(
                                  spreadRadius: 0.8,
                                  blurRadius: 4,
                                  color: Colors.grey[300],
                                  offset: Offset(5, 5),
                                )
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      padding: EdgeInsets.all(userTickets[
                                                  userTickets.length -
                                                      1 -
                                                      index]
                                              .isClosed
                                          ? 2.5
                                          : 0),
                                      child: userTickets[userTickets.length -
                                                  1 -
                                                  index]
                                              .isClosed
                                          ? GlobalSvgImages.greenTickIcon
                                          : GlobalSvgImages.loadingIcon,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        userTickets[
                                                userTickets.length - 1 - index]
                                            .title,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 15,
                                      height: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        userTickets[
                                                userTickets.length - 1 - index]
                                            .message[userTickets[
                                                        userTickets.length -
                                                            1 -
                                                            index]
                                                    .message
                                                    .length -
                                                1]
                                            .text,
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        // ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            width: 30,
                            height: 15,
                            // color: Colors.red,
                            child: GlobalSvgImages.leftIcon,
                          ),
                        ],
                      ),
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleTicketPage(
                                  ticket: userTickets[
                                      userTickets.length - 1 - index],
                                  screenSize: _screenSize,
                                  numberOfTicket:
                                      userTickets.length - 1 - index,
                                ))),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
