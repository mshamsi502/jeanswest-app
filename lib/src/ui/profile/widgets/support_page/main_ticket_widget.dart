// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-tickets-info.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/ui/profile/screens/more_menu_list/single_ticket_page.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/dataTickets/data-ticket.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserTicketsInfo/get-user-tickets-info.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_more.dart';

class MainTicketWidget extends StatefulWidget {
  final String headerAsset;
  final String emptyTicketAsset;
  final List<DataTicket> ticket;
  final Function(List<DataTicket>) updateTickets;

  const MainTicketWidget({
    Key key,
    this.headerAsset,
    this.ticket,
    this.emptyTicketAsset,
    this.updateTickets,
  }) : super(key: key);
  State<StatefulWidget> createState() => _MainTicketWidgetState();
}

class _MainTicketWidgetState extends State<MainTicketWidget> {
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
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
              Divider(
                thickness: 0.001689 * _screenSize.height, //1,
                height: 0.00138 * _screenSize.height, //0.5,
                color: MAIN_BLUE_COLOR,
              ),
              SizedBox(
                height: widget.ticket.length <= 0
                    ? 0
                    : 0.031 * _screenSize.height, //20,
              ),
              widget.ticket.length <= 0
                  ? Container(
                      height: 0.47297 * _screenSize.height, //280,
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: new AssetImage(widget.emptyTicketAsset),
                        ),
                      ),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.ticket.length,
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
                                widget.ticket[widget.ticket.length - 1 - index]
                                            .status ==
                                        0
                                    ? BoxShadow(
                                        spreadRadius:
                                            0.00055 * _screenSize.width, //0.2,
                                        blurRadius:
                                            0.00138 * _screenSize.height, //0.5,
                                        color: Colors.grey[100],
                                      )
                                    : BoxShadow(
                                        spreadRadius:
                                            0.00222 * _screenSize.width, //0.8,
                                        blurRadius:
                                            0.00625 * _screenSize.height, //10
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:
                                                0.055 * _screenSize.width, //20
                                            height:
                                                0.055 * _screenSize.width, //20
                                            padding: EdgeInsets.all(widget
                                                        .ticket[widget
                                                                .ticket.length -
                                                            1 -
                                                            index]
                                                        .status ==
                                                    0
                                                ? 0.0069 *
                                                    _screenSize.width //2.5
                                                : 0),
                                            child: widget
                                                        .ticket[widget
                                                                .ticket.length -
                                                            1 -
                                                            index]
                                                        .status ==
                                                    0
                                                ? GlobalSvgImages.greenTickIcon
                                                : GlobalSvgImages.loadingIcon,
                                          ),
                                          SizedBox(
                                            width:
                                                0.0078 * _screenSize.height, //5
                                          ),
                                          Expanded(
                                            child: Text(
                                              widget
                                                  .ticket[widget.ticket.length -
                                                      1 -
                                                      index]
                                                  .title,
                                              style: TextStyle(
                                                fontSize: 0.03 *
                                                    _screenSize.width, //11,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width:
                                                0.023 * _screenSize.height, //15

                                            height:
                                                0.023 * _screenSize.height, //15
                                          ),
                                          SizedBox(
                                            width:
                                                0.0078 * _screenSize.height, //5
                                          ),
                                          Expanded(
                                            child: Text(
                                              widget
                                                  .ticket[widget.ticket.length -
                                                      1 -
                                                      index]
                                                  .context[widget
                                                          .ticket[widget.ticket
                                                                  .length -
                                                              1 -
                                                              index]
                                                          .context
                                                          .length -
                                                      1]
                                                  .text,
                                              style: TextStyle(
                                                fontSize: 0.025 *
                                                    _screenSize.width, //9
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
                                user: user,
                                ticket: widget
                                    .ticket[widget.ticket.length - 1 - index],
                                screenSize: _screenSize,
                                numberOfTicket:
                                    widget.ticket.length - 1 - index,
                                closeTicket: (int indexCloseTicket) async {
                                  // ! send close ticket api
                                  Map<String, String> code = {
                                    "code": widget.ticket[indexCloseTicket].code
                                  };
                                  await closeATicket(code);
                                  List<DataTicket> userTempTickets =
                                      await getUserTicketsInfo();
                                  List<DataTicket> sortedUserTempTickets =
                                      sortTickets(userTempTickets);
                                  widget.updateTickets(sortedUserTempTickets);
                                  setState(() {
                                    userTickets = userTempTickets;
                                  });
                                  setState(() {
                                    widget.ticket[
                                            widget.ticket.length - 1 - index] =
                                        //
                                        DataTicket(
                                            code: widget
                                                .ticket[widget.ticket.length -
                                                    1 -
                                                    index]
                                                .code,
                                            title: widget
                                                .ticket[widget.ticket.length -
                                                    1 -
                                                    index]
                                                .title,
                                            context: widget
                                                .ticket[widget.ticket.length -
                                                    1 -
                                                    index]
                                                .context,
                                            status: 0);
                                  });
                                },
                                updateTicket:
                                    (int indexEditTicket, DataTicket ticket) {
                                  setState(() {
                                    // userTickets[indexEditTicket] = ticket;
                                    List<DataTicket> userTempTickets =
                                        // ignore: deprecated_member_use
                                        List<DataTicket>();
                                    for (int i = 0; i < indexEditTicket; i++)
                                      userTempTickets.add(userTickets[i]);
                                    userTempTickets.add(DataTicket(
                                      code: ticket.code,
                                      title: ticket.title ??
                                          userTickets[indexEditTicket].title,
                                      context: ticket.context,
                                      status: ticket.status,
                                    ));
                                    for (int i = indexEditTicket + 1;
                                        i < userTickets.length;
                                        i++)
                                      userTempTickets.add(userTickets[i]);
                                    List<DataTicket> sortedUserTempTickets =
                                        sortTickets(userTempTickets);
                                   
                                    widget.updateTickets(sortedUserTempTickets);
                                  });
                                },
                              ),
                            ),
                          ),
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
