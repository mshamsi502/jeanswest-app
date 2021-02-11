// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/models/user/userInfo/user-main-info.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/ui/profile/widgets/global/edit_friend_info_widget.dart';

class EditInfoFriendPage extends StatefulWidget {
  final UserMainInfo friend;
  final Function(UserMainInfo) addFriend;

  const EditInfoFriendPage({Key key, this.friend, this.addFriend})
      : super(key: key);

  @override
  _EditInfoFriendPageState createState() => _EditInfoFriendPageState();
}

class _EditInfoFriendPageState extends State<EditInfoFriendPage> {
  bool currentLevelWidgetAnimation = true;
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
          body: Container(
            color: Colors.white,
            height: _screenSize.height,
            child: EditFriendInfoWidget(
              title: 'ویرایش اطلاعات دوست',
              name: widget.friend.firstName,
              dayOfBirth: widget.friend.dayOfBirth,
              monthOfBirth: widget.friend.monthOfBirth,
              yearOfBirth: widget.friend.yearOfBirth,
              confirmInfo: confirmInfo,
            ),
          ),
        ),
      ),
    );
  }

  confirmInfo(
    String fistName,
    String lastName,
    String dayOfBirth,
    String monthOfBirth,
    String yearOfBirth,
  ) {
    setState(() {
      widget.addFriend(UserMainInfo(
        firstName: fistName,
        lastName: lastName,
        dayOfBirth: dayOfBirth,
        monthOfBirth: monthOfBirth,
        yearOfBirth: yearOfBirth,
      ));
    });
  }
}
