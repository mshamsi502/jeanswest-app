// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
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
    var _screenSize = MediaQuery.of(context).size;
    return Container(
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
          Center(
            child: SizedBox(
              width: 0.069 * _screenSize.width, //25,
              height: 0.00138 * _screenSize.height, //0.5,
              child: Divider(
                height: 0.00138 * _screenSize.height, //0.5,
                thickness: 0.003125 * _screenSize.height, //2,
                color: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(
            height: 0.016 * _screenSize.height, //10
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  widget.selectedBranch.depName,
                  style: TextStyle(
                    fontFamily: 'IRANSansBold',
                    fontSize: 0.0444 * _screenSize.width, //16,
                    color: MAIN_BLUE_COLOR,
                  ),
                ),
              ),
              SizedBox(
                width: 0.027 * _screenSize.width, //10,
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
                // selectedBranch: widget.selectedBranch,
                changeCameraPosition: changeCameraPosition,
                lat: double.parse(widget.selectedBranch.lat),
                lng: double.parse(widget.selectedBranch.lng),
              ),
              SizedBox(
                width: 0.041 * _screenSize.width, //15,
              ),
              ShareLocationButtonWidget(
                // selectedBranch: widget.selectedBranch,
                depAddress: widget.selectedBranch.depAddress,
                depName: widget.selectedBranch.depName,
                lat: double.parse(widget.selectedBranch.lat),
                lng: double.parse(widget.selectedBranch.lng),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 0.093 * _screenSize.height, //60,
                  child: Text(
                    widget.selectedBranch.depAddress,
                    style: TextStyle(
                        color: MAIN_BLUE_COLOR,
                        fontSize: 0.0333 * _screenSize.width, //12,
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
              width: 0.0138 * _screenSize.width, //5,
            ),
            Text(
              widget.selectedBranch.isActive == 1
                  ? widget.selectedBranch.workTime
                  : 'در حال حاضر این شعبه غیر فعال است.',
              style: TextStyle(
                color: widget.selectedBranch.isActive == 1
                    ? MAIN_BLUE_COLOR
                    : Colors.red,
                fontSize: 0.027 * _screenSize.width, //10,
              ),
            ),
          ]),
          SizedBox(
            height: 0.016 * _screenSize.height, //10
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
                width: 0.027 * _screenSize.width, //10,
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
