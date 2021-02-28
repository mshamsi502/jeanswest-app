// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/profile/helper_main_profile.dart';

class InviteFriendPanelWidget extends StatefulWidget {
  final Function() closePanel;
  final String inviteLink;

  const InviteFriendPanelWidget({
    Key key,
    this.closePanel,
    this.inviteLink,
  }) : super(key: key);

  @override
  _InviteFriendPanelWidgetState createState() =>
      _InviteFriendPanelWidgetState();
}

class _InviteFriendPanelWidgetState extends State<InviteFriendPanelWidget> {
  TextEditingController textEditingController = new TextEditingController();
  String textLink;
  @override
  void initState() {
    textLink =
        '''دوست عزیز سلام. شما میتونی با ثبت نام در لینک زیر تا سقف ${toPriceStyle(20000)} 🤩تومن خرید رو مهمان برند جینوست باشی
        ${widget.inviteLink}
        ''';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Text(
                  'دعوت دوستان',
                  style: TextStyle(
                    fontSize: 0.038 * _screenSize.width, //14,
                  ),
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(
                      0.0138 * _screenSize.width, //5
                    ),
                    child: Icon(
                      Icons.close,
                      size: 0.069 * _screenSize.width, //25,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => widget.closePanel(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.023 * _screenSize.height, //15
          ),
          CustomTextFieldWidget(
            title: 'اشتراک گذاری لینک دانلود',
            isEnable: false,
            textEditingController: textEditingController,
            initText: textLink,
            titleColor: Colors.black,
            lines: 1,
            textColor: Colors.grey,
            hintTextColor: Colors.grey,
            mediaQuery: MediaQuery.of(context),
            internalIcon: GestureDetector(
              child: Container(
                // color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Icon(
                  Icons.copy_outlined,
                  size: 25,
                  color: MAIN_BLUE_COLOR,
                ),
              ),
              onTap: () {},
            ),
            externalIcon: GestureDetector(
              child: Container(
                // color: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Icon(
                  Icons.share_outlined,
                  size: 25,
                  color: MAIN_BLUE_COLOR,
                ),
              ),
              onTap: () => bottomButtonFunction(textLink),
            ),
          ),
        ],
      ),
    );
  }
}
