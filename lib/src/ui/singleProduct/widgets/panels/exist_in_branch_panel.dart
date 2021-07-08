// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/models/branch/branch-for-product.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:intent/action.dart' as android_action;
import 'package:intent/intent.dart' as android_intent;

class ExistInBranchPanel extends StatefulWidget {
  final List<BranchForProduct> availableInBranches;
  final Function() close;
  final Function(BranchForProduct) openBranchDetail;
  const ExistInBranchPanel({
    Key key,
    @required this.close,
    @required this.availableInBranches,
    @required this.openBranchDetail,
  }) : super(key: key);
  @override
  _ExistInBranchPanelState createState() => _ExistInBranchPanelState();
}

class _ExistInBranchPanelState extends State<ExistInBranchPanel> {
  ScrollController scrollController = new ScrollController();

  List<BranchForProduct> _availableInBranches = [];
  @override
  void initState() {
    updateAvailableInBranches();
    super.initState();
  }

  updateAvailableInBranches() {
    setState(() {
      _availableInBranches = [];
      widget.availableInBranches.forEach((element) {
        if (element.stockStatus != "OutOfStock")
          _availableInBranches.add(element);
      });
      // _availableInBranches = widget.availableInBranches;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    if (_availableInBranches == null ||
        _availableInBranches.length != widget.availableInBranches.length)
      updateAvailableInBranches();
    print(
        ";;;;;;;;;;;;;;;;;;;;;;;;; _availableInBranches.length : ${widget.availableInBranches.length}");
    return Container(
      // color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "موجودی شعب",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                child: Container(
                  height: 0.138 * _screenSize.width, //50,
                  width: 0.138 * _screenSize.width, //50,
                  padding: EdgeInsets.all(
                    0.047 * _screenSize.width, //17,
                  ),
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
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: _availableInBranches.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    SizedBox(height: index == 0 ? 10 : 0),
                    Row(
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/svg_images/global/new/fi-sr-marker.svg',
                              color: MAIN_BLUE_COLOR,
                              width: 18,
                              height: 18,
                            ),
                            SizedBox(height: 5),
                            Text("1.7 KM",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            _availableInBranches[index].depName,
                            // textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AvakatanButtonWidget(
                          width: 100,
                          backgroundColor:
                              _availableInBranches[index].stockStatus ==
                                      "IsAvailable"
                                  ? MAIN_BLUE_COLOR
                                  : Colors.white,
                          borderColor: MAIN_BLUE_COLOR,
                          textColor: _availableInBranches[index].stockStatus ==
                                  "IsAvailable"
                              ? Colors.white
                              : MAIN_BLUE_COLOR,
                          title: _availableInBranches[index].stockStatus ==
                                  "IsAvailable"
                              ? "موجود"
                              : "تماس",
                          onTap: () {
                            if (_availableInBranches[index].stockStatus ==
                                "CallCheck") {
                              android_intent.Intent()
                                ..setAction(android_action.Action.ACTION_VIEW)
                                ..setData(Uri(
                                    scheme: "tel",
                                    path: _availableInBranches[index].depTel))
                                ..startActivity().catchError((e) => print(e));
                            } else if (_availableInBranches[index]
                                    .stockStatus ==
                                "IsAvailable")
                              widget.openBranchDetail(
                                  _availableInBranches[index]);
                          },
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
