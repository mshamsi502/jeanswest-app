// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOutPanelWidget extends StatefulWidget {
  final double height;
  final Function() closeLogOutPanel;

  const LogOutPanelWidget({
    Key key,
    this.closeLogOutPanel,
    this.height,
  }) : super(key: key);
  @override
  _LogOutPanelWidgetState createState() => _LogOutPanelWidgetState();
}

class _LogOutPanelWidgetState extends State<LogOutPanelWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            0.03 * _screenSize.width, //11
          ),
          topRight: Radius.circular(
            0.03 * _screenSize.width, //11
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0.039 * _screenSize.height, //25,
          horizontal: 0.054 * _screenSize.width, //20
        ),
        child: Column(
          children: [
            Expanded(
              child: Text(
                'آیا مطمئن هستید که میخواهید از حساب کاربری خود خارج شوید؟',
                style: TextStyle(
                  fontSize: 0.038 * _screenSize.width, //14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvakatanButtonWidget(
                  backgroundColor: Colors.white,
                  textColor: MAIN_BLUE_COLOR,
                  borderColor: MAIN_BLUE_COLOR,
                  title: 'خیر',
                  height: 0.0625 * _screenSize.height, //40
                  width: (_screenSize.width / 2) -
                      (0.083 * _screenSize.width //30
                      ),
                  onTap: () => widget.closeLogOutPanel(),
                  radius: 0.008 * _screenSize.height, //5
                  fontSize: 0.0444 * _screenSize.width, //16,
                ),
                SizedBox(
                  width: 0.041 * _screenSize.width, //15,
                ),
                AvakatanButtonWidget(
                  backgroundColor: MAIN_BLUE_COLOR,
                  textColor: Colors.white,
                  borderColor: MAIN_BLUE_COLOR,
                  title: 'بله',
                  height: 0.0625 * _screenSize.height, //40
                  width: (_screenSize.width / 2) -
                      (0.083 * _screenSize.width //30
                      ),
                  onTap: () => logOutAccount(),
                  radius: 0.008 * _screenSize.height, //5
                  fontSize: 0.0444 * _screenSize.width, //16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
    //
  }

  logOutAccount() async {
    print('exiting ...');
    // if (sharedPrefs == null) {
    sharedPrefs = await SharedPreferences.getInstance();
    // } else {
    sharedPrefs.clear();
    sharedPrefs.setString(TOKEN, "");
    // }
    print(
        '........................................token : ${globalLocator<SharedPreferences>().getString(TOKEN)}');
    Phoenix.rebirth(context); // ! restart the app
  }
}
