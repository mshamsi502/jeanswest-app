// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/branch/branch-for-product.dart';
import 'package:jeanswest/src/ui/branch/widgets/info_branch_widgets/call_button_widget.dart';
import 'package:jeanswest/src/ui/branch/widgets/info_branch_widgets/direction_button_widget.dart';

class BranchDetailPanel extends StatefulWidget {
  final BranchForProduct selectedBranch;
  final Function close;

  const BranchDetailPanel({
    Key key,
    @required this.selectedBranch,
    @required this.close,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _BranchDetailPanelState();
}

class _BranchDetailPanelState extends State<BranchDetailPanel>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    print("widget.selectedBranch : ${widget.selectedBranch}");
    var _screenSize = MediaQuery.of(context).size;
    return widget.selectedBranch == null ||
            widget.selectedBranch.kBarcode == null ||
            widget.selectedBranch.kBarcode == ""
        ? SizedBox()
        : Container(
            padding: EdgeInsets.symmetric(
              vertical: 0.016 * _screenSize.height, //10
              horizontal: 0.041 * _screenSize.width, //15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                0.011 * _screenSize.width, //4,
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    GestureDetector(
                      child: Container(
                        // color: Colors.red,
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(8),
                        child: SvgPicture.asset(
                          'assets/images/svg_images/global/new/fi-rr-cross.svg',
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        widget.close();
                      },
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        widget.selectedBranch.depName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        widget.selectedBranch.depAddress,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    // )
                  ],
                ),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  // GlobalSvgImages.blueTimeIcon,
                  SvgPicture.asset(
                    'assets/images/svg_images/global/new/fi-rr-clock.svg',
                    color: Colors.black,
                    width: 18,
                    height: 18,
                  ),
                  SizedBox(
                    width: 0.0138 * _screenSize.width, //5,
                  ),
                  Text(
                    widget.selectedBranch.workTime ?? DEFAULT_BRANCH_WORK_TIME,
                    style: TextStyle(
                      // color: MAIN_BLUE_COLOR,
                      fontSize: 14,
                    ),
                  ),
                ]),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: DirectionButtonWidget(
                        lat: widget.selectedBranch.lat,
                        lng: widget.selectedBranch.lng,
                        depName: widget.selectedBranch.depName,
                      ),
                    ),
                    SizedBox(
                      width: 0.027 * _screenSize.width, //10,
                    ),
                    CallButtonWidget(depTel: widget.selectedBranch.depTel),
                  ],
                ),
              ],
            ),
          );
  }
}
