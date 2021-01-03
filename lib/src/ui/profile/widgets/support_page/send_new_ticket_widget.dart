// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/constants/test_data/department.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_dropdown_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

class SendNewTicketWidget extends StatefulWidget {
  final Function() closePanel;
  final Function(String, String, String) sendMessage;

  const SendNewTicketWidget({
    Key key,
    this.closePanel,
    this.sendMessage,
  }) : super(key: key);
  State<StatefulWidget> createState() => _SendNewTicketWidgetState();
}

class _SendNewTicketWidgetState extends State<SendNewTicketWidget> {
  TextEditingController titleEditingController;
  TextEditingController textEditingController;
  String selectedDep;
  int initSelectDep;

  ScrollController scrollController;
  @override
  void initState() {
    titleEditingController = new TextEditingController();
    textEditingController = new TextEditingController();
    scrollController = new ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          0.042 * _screenSize.width, //15
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 0.039 * _screenSize.height, //25
        vertical: 0.015 * _screenSize.height, //10
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ارسال پیام',
                style: TextStyle(
                  fontSize: 0.042 * _screenSize.width, //15
                ),
              ),
              GestureDetector(
                  child: Container(
                    width: 0.083 * _screenSize.width, //25
                    height: 0.083 * _screenSize.width, //10
                    child: GlobalSvgImages.closeIcon,
                  ),
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    widget.closePanel();
                  }),
            ],
          ),
          SizedBox(
            height: 0.015 * _screenSize.height, //10
          ),
          Container(
            height: 0.7 * _screenSize.height //450
                    >
                    _screenSize.height
                ? _screenSize.height - 0.023 * _screenSize.height //450
                : 0.52 * _screenSize.height, //330,
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        CustomDropdownButtonWidget(
                            title: 'دپارتمان',
                            hintTitle: "انتخاب دپارتمان ...",
                            options: departments,
                            mediaQuery: MediaQuery.of(context),
                            selected: (String department) => setState(() {
                                  selectedDep = department;
                                })),
                        SizedBox(
                          height: 0.015 * _screenSize.height, //10
                        ),
                        CustomTextFieldWidget(
                          title: 'عنوان',
                          textEditingController: titleEditingController,
                          screenSize: _screenSize,
                        ),
                        SizedBox(
                          height: 0.015 * _screenSize.height, //10
                        ),
                        CustomTextFieldWidget(
                          title: 'متن',
                          textEditingController: textEditingController,
                          screenSize: _screenSize,
                          lines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.015 * _screenSize.height, //10
          ),
          AvakatanButtonWidget(
            title: 'ثبت پیام',
            backgroundColor: MAIN_BLUE_COLOR,
            textColor: Colors.white,
            borderColor: MAIN_BLUE_COLOR,
            height: 0.0625 * _screenSize.height, //40,
            width: _screenSize.width - 0.19 * _screenSize.width, //70,
            radius: 4,
            fontSize: 0.042 * _screenSize.width, //15
            onTap: () async {
              if (selectedDep != null) {
                widget.sendMessage(selectedDep, titleEditingController.text,
                    textEditingController.text);
                widget.closePanel();
                titleEditingController.clear();
                textEditingController.clear();
                FocusScope.of(context).unfocus();
              }
            },
          ),
        ],
      ),
    );
  }
}
