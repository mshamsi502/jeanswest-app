// ! *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// ! *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// ! *   Created Date & Time:  2021-01-14  ,  11:43 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/constants/global/constValues/constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest_client_global.dart';
import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';

import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';

class InviteFriendPanelWidget extends StatefulWidget {
  final Function() closePanel;
  final String inviteLink;

  final ScrollController scrollController;
  final Size screenSize;

  const InviteFriendPanelWidget({
    Key key,
    this.closePanel,
    this.inviteLink,
    this.scrollController,
    this.screenSize,
  }) : super(key: key);

  @override
  _InviteFriendPanelWidgetState createState() =>
      _InviteFriendPanelWidgetState();
}

class _InviteFriendPanelWidgetState extends State<InviteFriendPanelWidget> {
  TextEditingController textEditingController = new TextEditingController();
  ScrollController scrollController = new ScrollController();

  var keyboardVisibilityController = KeyboardVisibilityController();
  String textLink;
  // ignore: deprecated_member_use
  List<dynamic> validationResult = new List<dynamic>();
  // FToast fToast;
  @override
  void initState() {
    validationResult = [true, ''];
    textLink =
        '''دوست عزیز سلام. شما میتونی با ثبت نام در لینک زیر تا سقف ${toPriceStyle(20000)} تومن خرید رو مهمان برند جینوست باشی🤩
        ${widget.inviteLink}
        ''';
    scrollJumpAfterKeyborad(
      keyboardVisibilityController: keyboardVisibilityController,
      scrollController: scrollController,
      screenSize: widget.screenSize,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      width: _screenSize.width,
      // // height: 150,
      padding: EdgeInsets.symmetric(
        horizontal: 0.027 * _screenSize.width, //10,
        vertical: 0.016 * _screenSize.height, //10
      ),
      decoration: BoxDecoration(
        // color: Colors.white,
        // color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            0.03 * _screenSize.width, //11,
          ),
          topRight: Radius.circular(
            0.03 * _screenSize.width, //11,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'دعوت دوستان',
                style: TextStyle(
                  fontSize: 0.0444 * _screenSize.width, //16,
                ),
              ),
              Expanded(child: SizedBox()),
              GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(
                    0.0138 * _screenSize.width, //5
                  ),
                  child: Icon(
                    Icons.close,
                    size: 0.069 * _screenSize.width, //25,
                    color: Colors.black,
                  ),
                ),
                onTap: () => widget.closePanel(),
              ),
            ],
          ),
          SizedBox(
            height: 0.023 * _screenSize.height, //15
          ),
          Expanded(
            child: Container(
              // height: 2,
              // color: Colors.red,
              // height: 0.4898 * _screenSize.height, //290
              child: SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  // height: 0.5 * _screenSize.height, //320,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(
                        title: 'اشتراک گذاری لینک دانلود',
                        isEnable: false,
                        initText: textLink,
                        titleColor: Colors.black,
                        textColor: Colors.grey,
                        // customBackColor: Colors.red,
                        hintTextColor: Colors.grey[600],
                        mediaQuery: MediaQuery.of(context),
                        width: MediaQuery.of(context).size.width,
                        internalIcon: GestureDetector(
                            child: Container(
                              // color: Colors.green,
                              padding: EdgeInsets.only(
                                top: 0.0078 * _screenSize.height, //5,
                                bottom: 0.0078 * _screenSize.height, //5,
                                left: 0.027 * _screenSize.width, //10,
                              ),
                              child: Icon(
                                Icons.copy_outlined,
                                size: 0.069 * _screenSize.width, //25,
                                color: MAIN_BLUE_COLOR,
                              ),
                            ),
                            onTap: () {
                              Clipboard.setData(
                                      new ClipboardData(text: textLink))
                                  .then((_) {
                                showToast(
                                  message: "لینک با موفقیت کپی شد.",
                                  textColor: Colors.white,
                                  backgroundColor: NERO_GREY_COLOR,
                                );
                              });
                            }),
                        externalIcon: GestureDetector(
                          child: Container(
                            // color: Colors.red,
                            padding: EdgeInsets.only(
                              top: 0.0078 * _screenSize.height, //5,
                              bottom: 0.0078 * _screenSize.height, //5,
                              left: 0.027 * _screenSize.width, //10,
                            ),
                            child: Icon(
                              Icons.share_outlined,
                              size: 0.069 * _screenSize.width, //25,
                              color: MAIN_BLUE_COLOR,
                            ),
                          ),
                          onTap: () => shareATextLink(textLink),
                        ),
                      ),
                      SizedBox(
                        height: 0.023 * _screenSize.height, //15
                      ),
                      Divider(
                        height: 0.000078 * _screenSize.height, //0.05,
                        thickness: 1,
                        indent: 0.027 * _screenSize.width, //10,,
                        endIndent: 0.027 * _screenSize.width, //10,,
                        color: Colors.grey[300],
                      ),
                      SizedBox(
                        height: 0.023 * _screenSize.height, //15
                      ),
                      CustomTextFieldWidget(
                        title: 'شماره موبایل',
                        isEnable: true,
                        textEditingController: textEditingController,
                        textInputType: TextInputType.number,
                        initText: 'مثال : 09365337279',
                        titleColor: Colors.black,
                        // customBackColor: Colors.green,
                        // lines: 1,
                        inputFormatters: [
                          new LengthLimitingTextInputFormatter(11),
                        ],
                        textColor: Colors.black,
                        hintTextColor: Colors.grey[400],
                        mediaQuery: MediaQuery.of(context),
                        width: _screenSize.width,
                        hasValidation: true,
                        isValid: validationResult[0],
                        validationError: validationResult[1],
                      ),
                      SizedBox(
                        height: 0.023 * _screenSize.height, //15
                      ),
                      AvakatanButtonWidget(
                          backgroundColor: MAIN_BLUE_COLOR,
                          textColor: Colors.white,
                          borderColor: MAIN_BLUE_COLOR,
                          hasShadow: false,
                          title: 'ارسال دعوت نامه',
                          height: 0.07 * _screenSize.height, //45,
                          width: _screenSize.width -
                              (0.111 * _screenSize.width //40,
                              ),
                          fontSize: 0.05 * _screenSize.width, //18,
                          radius: 0.011 * _screenSize.width, //4,
                          onTap: () async {
                            validationResult.clear();
                            setState(() {
                              validationResult = checkCorrectPhone(
                                  inputPhone: textEditingController.text,
                                  startWithZero: true);
                            });
                            if (validationResult[0]) {
                              print('phone is valid ');
                              Map<String, dynamic> friendMobile = {
                                "mobile": textEditingController.text
                              };
                              // ! send message kavengegar api
                              try {
                                GeneralRespons res =
                                    await globalLocator<GlobalRestClient>()
                                        .sendInviteFriendLink(friendMobile);
                                if (res.statusCode == 200) {
                                  widget.closePanel();
                                  print('send invite success');
                                  textEditingController.clear();
                                  showToast(
                                    message: "دعوت نامه با موفقیت ارسال شد",
                                    textColor: Colors.white,
                                    backgroundColor: GREEN_TEXT_COLOR,
                                  );
                                }
                              } catch (e) {
                                print('catch error on send invite link');
                                printErrorMessage(e);
                              }
                            } else
                              print('not valid : ${validationResult[1]}');
                          }),
                      // SizedBox(
                      //   height: 0.016 * _screenSize.height, //10
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
