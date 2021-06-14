// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;
import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class CallButtonWidget extends StatefulWidget {
  final String depTel;

  const CallButtonWidget({Key key, this.depTel}) : super(key: key);

  State<StatefulWidget> createState() => _CallButtonWidgetState();
}

class _CallButtonWidgetState extends State<CallButtonWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        height: 36,
        width: screenSize.width * 0.3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(const Radius.circular(5)),
            border: Border.all(
              color: MAIN_BLUE_COLOR,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.depTel,
              style: TextStyle(
                  color: MAIN_BLUE_COLOR,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 2,
            ),
            BranchSvgImages.callIcon,
          ],
        ),
      ),
      onTap: () => android_intent.Intent()
        ..setAction(android_action.Action.ACTION_VIEW)
        ..setData(Uri(
            scheme: "tel",
            path: "+98${(widget.depTel).substring(1, widget.depTel.length)}"))
        ..startActivity().catchError((e) => print(e)),
    );
  }
}
