// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/branch/svg_images/branch_svg_images.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_label_widget.dart';
import 'package:jeanswest/src/utils/helper/branch/helper_map.dart';

class BranchListWidget extends StatefulWidget {
  final List<Branch> branches;
  final CameraPosition userCameraPosition;
  final Function(bool, BuildContext) changeBranchListPanelState;
  final Function(Branch) changeSelectedBranch;

  const BranchListWidget(
      {Key key,
      this.branches,
      this.changeBranchListPanelState,
      this.changeSelectedBranch,
      this.userCameraPosition})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => BranchListWidgetState();
}

class BranchListWidgetState extends State<BranchListWidget> {
  ScrollController scrollController;
  Branch closerBranch = new Branch();

  @override
  void initState() {
    closerBranch = getCloserBranch(widget.branches, widget.userCameraPosition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: scrollController,
        primary: true,
        itemCount: widget.branches.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 8,
          thickness: 0.2,
        ),
        itemBuilder: (BuildContext context, int i) {
          return Material(
              color: Colors.white,
              child: InkWell(
                child: ListTile(
                  title: Row(
                    children: [
                      BranchSvgImages.distanceBranchIcon,
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.branches[i].depName,
                                  // textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: MAIN_BLUE_COLOR,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                AvakatanLabelWidget(
                                  text:
                                      '${(widget.branches[i].distance / 1000).toString().substring(0, (widget.branches[i].distance / 1000).toString().substring(0, 2).endsWith('.') ? 3 : (widget.branches[i].distance / 1000).toString().substring(0, 3).endsWith('.') ? 4 : 3)} ' +
                                          "branch_screen.kilometer".tr(),
                                  textColor: Color(0xaa2c3d73),
                                  backgroundColor: Color(0x2f2B3E73),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                closerBranch.departmentInfoID ==
                                        widget.branches[i].departmentInfoID
                                    ? AvakatanLabelWidget(
                                        text:
                                            "branch_screen.closer_branch".tr(),
                                        textColor: Colors.white,
                                        backgroundColor: Color(0xaa2c3d73),
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              widget.branches[i].depAddress,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'IRANSansLight',
                                color: MAIN_BLUE_COLOR,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    // change selected branch and true is for open info branch panel
                    widget.changeSelectedBranch(widget.branches[i]);
                    // close Branch-List-Widget Panel
                    widget.changeBranchListPanelState(false, context);
                  },
                ),
              ));
        },
      ),
    );
  }
}
