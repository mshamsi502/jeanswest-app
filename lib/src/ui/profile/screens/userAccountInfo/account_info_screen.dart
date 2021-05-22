// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAccountInfo/edit-account-panel-widget.dart';
import 'package:jeanswest/src/utils/helper/getInfos/getUserInfo/getUserMainInfo/get-user-main-info.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/ui/profile/widgets/userAccountInfo/account-info-widget.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';

class AccountInfoScreen extends StatefulWidget {
  final String title;
  final UserMainInfo userAccountInfo;
  final Function(UserMainInfo) updateUser;

  const AccountInfoScreen({
    Key key,
    this.userAccountInfo,
    this.title,
    this.updateUser,
  }) : super(key: key);
  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  PanelController editingPanel;
  // ignore: deprecated_member_use
  List<dynamic> userData = new List<dynamic>();
  int selectedOption;
  @override
  void initState() {
    // isNew = true;
    if (user.firstName != null)
      print('user.firstName : ${user.firstName}');
    else
      print('user.firstName is null');
    //
    editingPanel = new PanelController();
    buildUserData(userInfo: widget.userAccountInfo);
    selectedOption = 0;
    super.initState();
  }

  buildUserData({UserMainInfo userInfo}) {
    userData = [
      // name: [
      //   key, value, isLock,
      // ],
      [
        'نام',
        userInfo.firstName ?? "",
        false,
      ],
      [
        'نام خانوادگی',
        userInfo.lastName ?? "",
        false,
      ],
      [
        'شماره تماس',
        userInfo.phoneNumber ?? "",
        true,
      ],
      [
        'ایمیل',
        userInfo.email ?? "",
        false,
      ],
      [
        'جنسیت',
        userInfo.gender ?? 1,
        false,
      ],
      [
        'تاریخ تولد',
        {
          'yearOfBirth': userInfo.yearOfBirthShamsi,
          'monthOfBirth': userInfo.monthOfBirthShamsi,
          'dayOfBirth': userInfo.dayOfBirthShamsi,
        },
        false,
      ],
      5,
    ];
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () => backPanelClose(
            [editingPanel],
            context,
          ),
          child: Scaffold(
            body: SlidingUpPanel(
              color: Colors.transparent,
              controller: editingPanel,
              minHeight: 0,
              maxHeight: _screenSize.height,
              panel: EditAccountPanelWidget(
                userData: userData,
                selectedUserData: selectedOption,
                closePanel: () => editingPanel.close(),
                confirmChanges: (
                  String firstName,
                  String lastName,
                  String email,
                  int gender,
                  String dayOfBirth,
                  String monthOfBirth,
                  String yearOfBirth,
                ) async {
                  UserMainInfo _userInfo = new UserMainInfo(
                    firstName: firstName,
                    lastName: lastName,
                    phoneNumber: widget.userAccountInfo.phoneNumber,
                    email: email,
                    gender: gender,
                    dayOfBirthShamsi: dayOfBirth,
                    monthOfBirthShamsi: monthOfBirth,
                    yearOfBirthShamsi: yearOfBirth,
                  );

                  user = await editUserMainInfo(_userInfo);
                  widget.updateUser(_userInfo);
                  setState(() {
                    buildUserData(userInfo: _userInfo);
                  });
                },
              ),
              body: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0.008 * _screenSize.height, //5
                    ),
                    AppBarWithBackWidget(
                      title: widget.title,
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(
                      height: 0.008 * _screenSize.height, //5
                    ),
                    Divider(
                      height: 0.000078 * _screenSize.height, //0.05,
                      thickness: 0.003125 * _screenSize.height, //2,
                      color: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 0.016 * _screenSize.height, //10
                    ),
                    Expanded(
                      child: Container(
                        width: _screenSize.width,
                        child: InfoWidget(
                          userData: userData,
                          selectedOption: selectedOption,
                          changeSelectedOptions: (int value) => setState(() {
                            selectedOption = value;
                            editingPanel.open();
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.023 * _screenSize.height, //15
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
