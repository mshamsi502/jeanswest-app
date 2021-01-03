// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

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
        floatingActionButton: GestureDetector(
          child: Container(
            height: 0.14 * _screenSize.width, //55
            width: 0.14 * _screenSize.width, //55
            decoration: BoxDecoration(
              color: MAIN_GOLD_COLOR,
              borderRadius: BorderRadius.circular(
                0.14 * _screenSize.width, // 50
              ),
            ),
            padding: EdgeInsets.all(
              0.023 * _screenSize.height, //15
            ),
            child: GlobalSvgImages.editIconForLeft,
          ),
          onTap: () => widget.openNewTicketPanel(),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Container(
                height: 0.3125 * _screenSize.height, //200
                width: _screenSize.width,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: new AssetImage(widget.headerAsset),
                  ),
                ),
              ),
              SizedBox(
                height: 0.015 * _screenSize.height, //10
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: userTickets.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(
                        0.015 * _screenSize.height, //10
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 0.027 * _screenSize.width, //10
                        vertical: 0.011 * _screenSize.height, //7
                      ),
                      width: _screenSize.width,
                      // height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          0.015 * _screenSize.height, //10
                        ),
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
                                  blurRadius: 0.00625 * _screenSize.height, //10
                                  color: Colors.grey[300],
                                  offset: Offset(
                                    0.0078 * _screenSize.height, //5

                                    0.0078 * _screenSize.height, //5
                                  ),
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
                                      width: 0.055 * _screenSize.width, //20
                                      height: 0.055 * _screenSize.width, //20
                                      padding: EdgeInsets.all(userTickets[
                                                  userTickets.length -
                                                      1 -
                                                      index]
                                              .isClosed
                                          ? 0.0069 * _screenSize.width //2.5
                                          : 0),
                                      child: userTickets[userTickets.length -
                                                  1 -
                                                  index]
                                              .isClosed
                                          ? GlobalSvgImages.greenTickIcon
                                          : GlobalSvgImages.loadingIcon,
                                    ),
                                    SizedBox(
                                      width: 0.0078 * _screenSize.height, //5
                                    ),
                                    Expanded(
                                      child: Text(
                                        userTickets[
                                                userTickets.length - 1 - index]
                                            .title,
                                        style: TextStyle(
                                          fontSize:
                                              0.03 * _screenSize.width, //11,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 0.023 * _screenSize.height, //15

                                      height: 0.023 * _screenSize.height, //15
                                    ),
                                    SizedBox(
                                      width: 0.0078 * _screenSize.height, //5
                                    ),
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
                                          fontSize:
                                              0.025 * _screenSize.width, //9
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
                            width: 0.046 * _screenSize.height, //30
                            height: 0.023 * _screenSize.height, //15
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
