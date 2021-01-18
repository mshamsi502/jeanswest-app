// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/user/user.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/ui/profile/widgets/global/edit_friend_info_widget.dart';
import 'package:jeanswest/src/ui/profile/screens/friends/edit_info_friend.dart';
import 'package:jeanswest/src/constants/test_data/friends.dart';

class UserFriendsListPage extends StatefulWidget {
  final List<User> friends;

  const UserFriendsListPage({Key key, this.friends}) : super(key: key);

  @override
  _UserFriendsListPageState createState() => _UserFriendsListPageState();
}

class _UserFriendsListPageState extends State<UserFriendsListPage> {
  bool currentLevelWidgetAnimation = true;
  ScrollController _scrollController = ScrollController();
  PanelController editingPanel = PanelController();
  int selectedFriend;
  bool isNew;
  @override
  void initState() {
    selectedFriend = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height,
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: SlidingUpPanel(
            controller: editingPanel,
            minHeight: 0,
            maxHeight: _screenSize.height,
            // defaultPanelState: widget.initPanelState,
            defaultPanelState: PanelState.CLOSED,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            panel: Container(
              color: Colors.white,
              height: _screenSize.height,
              child: EditFriendInfoWidget(
                title: 'ویرایش دوست',
                name: widget.friends[selectedFriend].perName,
                dayOfBirth: widget.friends[selectedFriend].dayOfBirth,
                monthOfBirth: widget.friends[selectedFriend].monthOfBirth,
                yearOfBirth: widget.friends[selectedFriend].yearOfBirth,
                isNew: false,
                // closePanel: () {
                //   setState(() {
                //     isNew = false;
                //     editingPanel.close();
                //   });
                // },
                // confirmInfo: confirmInfo,
              ),
            ),
            body: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    height: _screenSize.height - 20,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 160,
                            width: _screenSize.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: new AssetImage(
                                    'assets/images/png_images/profile/friends.png'),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1.5,
                            color: MAIN_BLUE_COLOR,
                            height: 1.5,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.friends.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 45,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.blueGrey,
                                            radius: 50,
                                            backgroundImage: AssetImage(
                                                'assets/images/png_images/global/profile_avatar.png'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.friends[index].perName,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'تاریخ تولد : ${widget.friends[index].yearOfBirth}/${widget.friends[index].monthOfBirth}/${widget.friends[index].dayOfBirth}',
                                                style: TextStyle(fontSize: 10),
                                              )
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Container(
                                              padding: EdgeInsets.all(5),
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                // color: Color(0xfff2f2f2),
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  color: Colors.grey[200],
                                                ),
                                              ),
                                              child: GlobalSvgImages
                                                  .editIconForLeft),
                                          onTap: () async {
                                            setState(() {
                                              selectedFriend = index;
                                              isNew = true;
                                              // editingPanel.open();
                                            });

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditInfoFriendPage(
                                                  friend: widget.friends[index],
                                                  addFriend: addFriend,
                                                ),
                                              ),
                                            );

                                            await Future.delayed(
                                                Duration(milliseconds: 500));
                                            setState(() {
                                              isNew = false;
                                            });
                                          },
                                        ),
                                        // SizedBox(
                                        //   width: 25,
                                        // )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Divider(
                                    thickness: 0.3,
                                    color: MAIN_BLUE_COLOR,
                                    height: 2,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      // color: Colors.red,
                      width: _screenSize.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: AvakatanButtonWidget(
                        backgroundColor: MAIN_BLUE_COLOR,
                        textColor: Colors.white,
                        title: 'افزودن دوست جدید',
                        height: 40,
                        // this.icon,
                        width: _screenSize.width * 0.8,
                        radius: 5,
                        fontSize: 15,
                        borderColor: MAIN_BLUE_COLOR,
                        onTap: () {
                          setState(() {
                            selectedFriend = null;
                            print('selectedFriend: nulll');
                            editingPanel.open();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  confirmInfo(
    String name,
    String dayOfBirth,
    String monthOfBirth,
    String yearOfBirth,
  ) {
    setState(() {
      widget.friends[selectedFriend] = new User(
        perName: name,
        dayOfBirth: dayOfBirth,
        monthOfBirth: monthOfBirth,
        yearOfBirth: yearOfBirth,
      );
    });
  }

  addFriend(User friend) {
    setState(() {
      friends[selectedFriend] = friend;
    });
  }
}
