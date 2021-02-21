// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/profile/gender/gender.dart';
import 'package:jeanswest/src/models/profile/user/user-main-info.dart';
import 'package:jeanswest/src/ui/profile/widgets/global/edit_info_widget.dart';
import 'package:jeanswest/src/ui/profile/widgets/user_account_info/info_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_back_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/constants/global/userAllInfo/user-main-info.dart';

class AccountInfoScreen extends StatefulWidget {
  final PanelState initPanelState;

  const AccountInfoScreen({Key key, this.initPanelState}) : super(key: key);
  @override
  _AccountInfoScreenState createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  PanelController editingPanel = new PanelController();
  bool isNew;

  @override
  void initState() {
    isNew = true;
    if (user.firstName != null)
      print('user.firstName : ${user.firstName}');
    else
      print('user.firstName is null');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: SlidingUpPanel(
            controller: editingPanel,
            minHeight: 0,
            maxHeight: _screenSize.height,
            defaultPanelState: widget.initPanelState,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            panel: Container(
              color: Colors.white,
              height: _screenSize.height,
              child: EditInfoWidget(
                  title: 'ویرایش حساب کاربری',
                  firstName: user.firstName,
                  lastName: user.lastName,
                  email: user.email,
                  phoneNumber: user.phoneNumber,
                  gender: user.gender,
                  dayOfBirth: user.dayOfBirth,
                  monthOfBirth: user.monthOfBirth,
                  yearOfBirth: user.yearOfBirth,
                  isNew: isNew,
                  closePanel: () {
                    setState(() {
                      isNew = false;
                      editingPanel.close();
                    });
                  },
                  confirmInfo: confirmInfo),
            ),
            body: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarWithBackWidget(
                        title: 'جزئیات حساب کاربری',
                        onTap: () => Navigator.pop(context),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: InfoWidget(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 20,
                    right: 25,
                    left: 25,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: _screenSize.height,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: AvakatanButtonWidget(
                              backgroundColor: MAIN_BLUE_COLOR,
                              textColor: Colors.white,
                              borderColor: Colors.transparent,
                              title: 'ویرایش حساب',
                              height: 40,
                              onTap: () async {
                                setState(() {
                                  isNew = true;
                                  editingPanel.open();
                                });
                                await Future.delayed(
                                    Duration(milliseconds: 500));
                                setState(() {
                                  isNew = false;
                                });
                              },
                              radius: 5,
                              fontSize: 14,
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
        ),
      ),
    );
  }

  confirmInfo(
    String firstName,
    String lastName,
    String email,
    String phoneNumber,
    Gender gender,
    String dayOfBirth,
    String monthOfBirth,
    String yearOfBirth,
  ) {
    setState(() {
      user = new UserMainInfo(
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        gender: gender,
        dayOfBirth: dayOfBirth,
        monthOfBirth: monthOfBirth,
        yearOfBirth: yearOfBirth,
      );
    });
  }
}
