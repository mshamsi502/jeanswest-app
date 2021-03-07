// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';
import 'package:jeanswest/src/utils/helper/global/call-apis-helper.dart';

class SendNewTicketWidget extends StatefulWidget {
  final Function() closePanel;
  final Function(String, String) sendMessage;
  final bool canSendMessage;
  final Function(String, String) checkIsValid;
  final List<Map<String, dynamic>> resCheckIsValid;

  const SendNewTicketWidget({
    Key key,
    this.closePanel,
    this.sendMessage,
    this.checkIsValid,
    this.resCheckIsValid,
    this.canSendMessage = false,
  }) : super(key: key);
  State<StatefulWidget> createState() => _SendNewTicketWidgetState();
}

class _SendNewTicketWidgetState extends State<SendNewTicketWidget> {
  TextEditingController titleEditingController;
  TextEditingController textEditingController;

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
    print('00 canSendMessage : ${widget.canSendMessage}');

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
                    titleEditingController.clear();
                    textEditingController.clear();
                  }),
            ],
          ),
          SizedBox(
            height: 0.015 * _screenSize.height, //10
          ),
          Container(
            height: 0.54054 * _screenSize.height, //320,

            //  0.7 * _screenSize.height //450
            //         >
            //         _screenSize.height
            //     ? _screenSize.height - 0.023 * _screenSize.height //450
            //     : 0.52 * _screenSize.height, //330,
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                          title: 'عنوان',
                          textEditingController: titleEditingController,
                          titleColor: MAIN_BLUE_COLOR,
                          mediaQuery: MediaQuery.of(context),
                          hasValidation: true,
                          validationError: widget.resCheckIsValid[0]
                              ['errorMessage'],
                          isValid: widget.resCheckIsValid[0]['isValid'],
                        ),
                        SizedBox(
                          height: 0.015 * _screenSize.height, //10
                        ),
                        CustomTextFieldWidget(
                          title: 'متن',
                          textEditingController: textEditingController,
                          titleColor: MAIN_BLUE_COLOR,
                          mediaQuery: MediaQuery.of(context),
                          lines: 7,
                          hasValidation: true,
                          validationError: widget.resCheckIsValid[1]
                              ['errorMessage'],
                          isValid: widget.resCheckIsValid[1]['isValid'],
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
            radius: 0.011 * _screenSize.width, //4,
            fontSize: 0.042 * _screenSize.width, //15
            onTap: () async {
              widget.checkIsValid(
                  titleEditingController.text, textEditingController.text);
              await Future.delayed(Duration(milliseconds: 100));
              setState(() {});
              await Future.delayed(Duration(milliseconds: 100))
                  .then((value) async {
                if (widget.canSendMessage) {
                  setState(() {});
                  bool res = await callAPIsProvider(callApi: () {
                    // ! call api
                  });
                  if (res ?? true // ! true is for test
                      ) {
                    widget.sendMessage(titleEditingController.text,
                        textEditingController.text);
                    widget.closePanel();
                    titleEditingController.clear();
                    textEditingController.clear();
                    FocusScope.of(context).unfocus();
                  }
                }
              });
              // setState(() {

              // });
            },
          ),
        ],
      ),
    );
  }
}
