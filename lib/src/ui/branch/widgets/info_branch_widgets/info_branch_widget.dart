//*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
//*  Project Name:  avakatan_branches
//*  Created on:    7th October - 07/10/2020     _     15:23:37
//****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/ui/branch/widgets/info_branch_widgets/call_button_widget.dart';
import 'package:jeanswest/src/ui/branch/widgets/info_branch_widgets/direction_button_widget.dart';
import 'package:jeanswest/src/ui/branch/widgets/info_branch_widgets/share_location_button_widget.dart';
import 'package:jeanswest/src/ui/branch/widgets/info_branch_widgets/user_location_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_label_widget.dart';

class InfoBranchWidget extends StatefulWidget {
  final GoogleMapController mapController;
  final Branch selectedBranch;
  final bool isCloserBranch;

  const InfoBranchWidget({
    Key key,
    this.mapController,
    this.selectedBranch,
    this.isCloserBranch,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _InfoBranchWidgetState();
}

class _InfoBranchWidgetState extends State<InfoBranchWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    print('((((((( selectedBranch : ' + widget.selectedBranch.depName);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              width: 25,
              height: 0.1,
              child: Divider(
                height: 0.05,
                thickness: 2,
                color: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GestureDetector(
              //   child:
              Container(
                child: Text(
                  widget.selectedBranch.depName,
                  style: TextStyle(
                    fontFamily: 'IRANSansBold',
                    fontSize: 16,
                    color: MAIN_BLUE_COLOR,
                  ),
                ),
              ),
              // onTap: () {
              // widget.mapController.animateCamera(
              //     CameraUpdate.newCameraPosition(CameraPosition(
              //         target: LatLng(double.parse(_selectedBranch.lat),
              //             double.parse(_selectedBranch.lng)),
              //         zoom: 22)));
              //   },
              // ),
              SizedBox(
                width: 10,
              ),
              widget.isCloserBranch
                  ? AvakatanLabelWidget(
                      text: "branch_screen.closer_branch".tr(),
                      textColor: Colors.white,
                      backgroundColor: Color(0xaa2c3d73),
                    )
                  : Container(),
              Expanded(
                child: Container(),
              ),
              UserLocationButtonWidget(
                selectedBranch: widget.selectedBranch,
                changeCameraPosition: changeCameraPosition,
              ),
              SizedBox(
                width: 15,
              ),
              ShareLocationButtonWidget(
                selectedBranch: widget.selectedBranch,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: Text(
                    widget.selectedBranch.depAddress,
                    style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 12,
                        fontFamily: 'IRANSansLight'),
                  ),
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            widget.selectedBranch.isActive == 1
                ? GlobalSvgImages.blueTimeIcon
                : GlobalSvgImages.redTimeIcon,
            SizedBox(
              width: 5,
            ),
            Text(
              widget.selectedBranch.isActive == 1
                  ? widget.selectedBranch.workTime
                  : 'در حال حاضر این شعبه غیر فعال است.',
              style: TextStyle(
                  color: widget.selectedBranch.isActive == 1
                      ? MAIN_BLUE_COLOR
                      : Colors.red,
                  fontSize: 10),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
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
                width: 10,
              ),
              CallButtonWidget(depTel: widget.selectedBranch.depTel),
            ],
          ),
        ],
      ),
    );
  }

  changeCameraPosition(CameraPosition cameraPosition) {
    widget.mapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
