// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/branch/constants.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/ui/branch/widgets/google_map_widget.dart';

class BranchesMapWidget extends StatefulWidget {
  final List<Branch> branches;
  final Branch selectedBranch;
  final bool isSelectedBranch;

  BranchesMapWidget(
      {@required this.branches, this.selectedBranch, this.isSelectedBranch});
  @override
  State<StatefulWidget> createState() => BranchesMapWidgetState();
}

class BranchesMapWidgetState extends State<BranchesMapWidget> {
  @override
  Widget build(BuildContext context) {
    var dpiSize = MediaQuery.of(context).devicePixelRatio;
    if (myGoogleMapWidget == null) {
      myGoogleMapWidget = GoogleMapWidget(
        getedBranches: widget.branches,
        initSelectedBranch: widget.selectedBranch,
        initIsSelectedBranch: widget.isSelectedBranch,
        dpiSize: dpiSize,
      );
    }
    return Container(
      child: Center(
        child: SizedBox(child: myGoogleMapWidget),
      ),
    );
  }
}
