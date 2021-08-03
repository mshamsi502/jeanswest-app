// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/svg_images/global_svg_images.dart';
import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';
import 'package:jeanswest/src/utils/helper/global/call-apis-helper.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class SendNewTicketWidget extends StatefulWidget {
  final Function() closePanel;
  final Function(String, String) sendMessage;
  final bool canSendMessage;
  final Function(String, String) checkIsValid;
  final List<Map<String, dynamic>> resCheckIsValid;
  final MediaQueryData mediaQuery;

  const SendNewTicketWidget({
    Key key,
    this.closePanel,
    this.sendMessage,
    this.checkIsValid,
    this.resCheckIsValid,
    @required this.mediaQuery,
    this.canSendMessage = false,
  }) : super(key: key);
  State<StatefulWidget> createState() => _SendNewTicketWidgetState();
}

class _SendNewTicketWidgetState extends State<SendNewTicketWidget> {
  TextEditingController titleEditingController;
  TextEditingController textEditingController;
  var keyboardVisibilityController = KeyboardVisibilityController();
  ScrollController scrollController;
  @override
  void initState() {
    titleEditingController = new TextEditingController();
    textEditingController = new TextEditingController();
    scrollController = new ScrollController();
    scrollJumpAfterKeyborad(
      keyboardVisibilityController: keyboardVisibilityController,
      scrollController: scrollController,
      screenSize: widget.mediaQuery.size,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    EdgeInsets viewInsets = EdgeInsets.fromWindowPadding(
        WidgetsBinding.instance.window.viewInsets,
        WidgetsBinding.instance.window.devicePixelRatio);
    print('00 canSendMessage : ${widget.canSendMessage}');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: _screenSize.width,
        color: Colors.white,
        height: _screenSize.height - viewInsets.bottom,
        padding: EdgeInsets.symmetric(
          horizontal: 0.0416 * _screenSize.width, //15,
          vertical: 0.015 * _screenSize.height, //10
        ),
        child: Column(
          children: [
            Container(
              height: 0.046 * _screenSize.height, //30
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ایجاد گفتگو',
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
            ),
            SizedBox(
              height: 0.015 * _screenSize.height, //10
            ),
            Divider(color: Colors.grey, height: 0.0078 * _screenSize.height //5,
                ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.083 * _screenSize.width, //10
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    height: viewInsets.bottom == 0
                        ? _screenSize.height -
                            (0.093 * _screenSize.height) //60,
                        : (_screenSize.height -
                                    viewInsets.bottom -
                                    (0.093 * _screenSize.height) //60,
                                ) <
                                445
                            ? 445
                            : (_screenSize.height -
                                viewInsets.bottom -
                                (0.093 * _screenSize.height) //60,
                            ),
                    //
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              CustomTextFieldWidget(
                                title: 'موضوع تیکت',
                                textEditingController: titleEditingController,
                                titleColor: MAIN_BLUE_COLOR,
                                mediaQuery: MediaQuery.of(context),
                                width: MediaQuery.of(context).size.width,
                                hasValidation: true,
                                validationError: widget.resCheckIsValid[0]
                                    ['errorMessage'],
                                isValid: widget.resCheckIsValid[0]['isValid'],
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              CustomTextFieldWidget(
                                title: 'متن',
                                textEditingController: textEditingController,
                                titleColor: MAIN_BLUE_COLOR,
                                mediaQuery: MediaQuery.of(context),
                                width: MediaQuery.of(context).size.width,
                                lines: 6,
                                hasValidation: true,
                                validationError: widget.resCheckIsValid[1]
                                    ['errorMessage'],
                                isValid: widget.resCheckIsValid[1]['isValid'],
                              ),
                              // SizedBox(height: keyboardHeight),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.015 * _screenSize.height, //10
                        ),
                        AvakatanButtonWidget(
                          title: 'تایید و ادامه',
                          backgroundColor: MAIN_BLUE_COLOR,
                          textColor: Colors.white,
                          borderColor: MAIN_BLUE_COLOR,
                          height: 0.075 * _screenSize.height, //48
                          // 0.0625 * _screenSize.height, //40,
                          width: _screenSize.width -
                              (0.19 * _screenSize.width), //70,
                          radius: 0.011 * _screenSize.width, //4,
                          fontSize: 0.042 * _screenSize.width, //15
                          onTap: () async {
                            widget.checkIsValid(titleEditingController.text,
                                textEditingController.text);
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
                                  widget.sendMessage(
                                      titleEditingController.text,
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
                        SizedBox(
                          height: 0.05468 * _screenSize.height, //35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ),
      // ),
    );
  }
}
