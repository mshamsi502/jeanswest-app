// ! *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// ! *   Project Name :  avakatan_branches
// ! *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ! ****************************************************************************

import 'dart:ui';

import 'package:jeanswest/src/constants/global/api_respones.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/global/size_constants.dart';
import 'package:jeanswest/src/constants/login/country_code_list.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:jeanswest/src/ui/login/widgets/confirm_code_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/confirm_button_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/login_app_bar_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/login_body_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/login/helper.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginPage extends StatefulWidget {
  // final Function(int, int) updateProp;
  final Size screenSize;
  final Function(BuildContext) navigatorPop;

  const LoginPage({
    Key key,
    // this.updateProp,
    this.screenSize,
    this.navigatorPop,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // PanelController keyboardPanelController = new PanelController();
  // bool keyboardIsOpen = false;
  PanelController preTelCodePanelController = new PanelController();
  bool preTelCodeIsOpen = false;
  String inputPhone = '';
  String inputCode = '';
  bool hasError = false;
  bool isInputPhoneStep = true;
  // int selectedCodeChar = 0;
  ScrollController scrollController = new ScrollController();
  //
  String minuteTimer;
  String secondTimer;
  //
  bool check;
  String errorMsg;
  bool resendCode;

  FocusNode phoneInputNode = FocusNode();
  FocusNode codeConfirmInputNode = FocusNode();
  TextEditingController phoneTextEditingController =
      new TextEditingController();
  FocusNode searchInputNode = FocusNode();
  TextEditingController searchTextEditingController =
      new TextEditingController();
  // ignore: deprecated_member_use
  List<Country> allCountries = new List<Country>();
  // ignore: deprecated_member_use
  List<Country> searchedCountries = new List<Country>();
  Map<String, dynamic> map = CountriesCodeList.PERSIAN_GULF_COUNTRY_LIST;
  Country selectedCountry;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    check = false;
    resendCode = false;
    errorMsg = '';
    getConteries(widget.screenSize);
    minuteTimer = '00';
    secondTimer = '00';
    //

    scrollJumpAfterKeyborad(
      scrollController: scrollController,
      screenSize: widget.screenSize,
    );

    super.initState();
  }

  getConteries(Size _screenSize) async {
    selectedCountry = Country(
      name: map['countries_code'][0]['name_per'],
      dialCode: map['countries_code'][0]['dial_code'],
      code: map['countries_code'][0]['code'],
      flag: Container(
        width: 0.05468 * _screenSize.height, //35,
        height: 0.05468 * _screenSize.height, //35,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              map['countries_code'][0]['flag'],
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(
            0.138 * widget.screenSize.width, //50,
          )),
        ),
      ),
    );

    await Future.delayed(Duration.zero, () {
      for (var i = 0; i < map['countries_code'].length; i++) {
        Country country = Country(
          name: map['countries_code'][i][context.locale.toString() == 'fa_IR'
              ? 'name_per'
              : context.locale.toString() == 'ar_UA'
                  ? 'name_arb'
                  : 'name_eng'],
          dialCode: map['countries_code'][i]['dial_code'],
          code: map['countries_code'][i]['code'],
          flag: new Container(
            width: 0.05468 * _screenSize.height,
            height: 0.05468 * _screenSize.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(
                  map['countries_code'][i]['flag'],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(
                0.138 * widget.screenSize.width, //50,
              )),
            ),
          ),
        );
        setState(() {
          allCountries.add(country);
          if (country.code == 'IR') selectedCountry = country;
        });
      }
    });
    searchedCountries = allCountries;
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      width: _screenSize.width,
      height: _screenSize.height,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () => backPanelClose(
            [preTelCodePanelController],
            context,
          ),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              child: Container(
                // color: Colors.red,
                width: _screenSize.width,
                height: (isInputPhoneStep ? 0.65 : 0.75) * _screenSize.height,
                child: Container(
                  width: _screenSize.width,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 0.234 * _screenSize.height, //150,
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.041 * _screenSize.width, //15,
                                vertical: 0.016 * _screenSize.height //10
                                ),
                            child: LoginAppBarWidget(
                              phoneTextEditingController:
                                  phoneTextEditingController,
                              navigatorPop: (BuildContext context) =>
                                  Navigator.pop(context),
                            ),
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                isInputPhoneStep
                                    ? LoginBodyWidget(
                                        focusNode: phoneInputNode,
                                        phoneTextEditingController:
                                            phoneTextEditingController,
                                        inputPhone: inputPhone,
                                        hasError: hasError,
                                        check: check,
                                        changeHasError:
                                            (List<dynamic> checkPhone) {},
                                        // hasError: true,
                                        selectedCountry: selectedCountry,
                                        changeTextFieldSearch:
                                            (String newValue) {
                                          hasError = false;
                                          print('update check');
                                          setState(() {
                                            inputPhone = newValue;
                                            print('inputPhone : $inputPhone');
                                            check = inputPhone.length == 10;
                                            errorMsg = '';
                                          });
                                        },
                                      )
                                    : ConfirmCodeWidget(
                                        focusNode: codeConfirmInputNode,
                                        phoneTextEditingController:
                                            phoneTextEditingController,
                                        inputPhone: inputPhone,
                                        hasError: hasError,
                                        backToInputPhoneStep:
                                            changeInputPhoneStep,
                                        updateInputCode: updateInputCode,
                                        minuteTimer: minuteTimer,
                                        secondTimer: secondTimer,
                                        resendCodeToAlreadyPhone: () =>
                                            checkPhoneInput(
                                          context: context,
                                          phoneNumber: inputPhone,
                                          statusCodes: statusCodes,
                                          changeHasError: (bool newHasError) {
                                            setState(() {
                                              hasError = newHasError;
                                            });
                                          },
                                          changeErrorMsg: (String msg) =>
                                              setState(() {
                                            errorMsg = msg;
                                          }),
                                          changeInputPhoneStep:
                                              changeInputPhoneStep,
                                          startDownTimer: () =>
                                              startDownTimer(_screenSize),
                                          apiResponse:
                                              (Map<String, dynamic> response) =>
                                                  setState(() {
                                            print(
                                                'statusCode : ${response['statusCode']}');
                                            print(
                                                'msg : ${statusCodes[response['statusCode']]['perMessage']}');
                                            if (response['statusCode'] == 200) {
                                              hasError = false;
                                              errorMsg = '';
                                            } else {
                                              hasError = true;
                                              errorMsg = statusCodes[
                                                      response['statusCode']]
                                                  ['perMessage'];
                                            }
                                          }),
                                        ),
                                        updateHasError: (bool newHasError) {
                                          setState(() {
                                            hasError = newHasError;
                                          });
                                        },
                                        startDownTimer: () =>
                                            startDownTimer(_screenSize),
                                      ),
                                SizedBox(
                                    height: 0.0078 * _screenSize.height //5,
                                    ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0.45608 * _screenSize.height, //270,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.069 * _screenSize.width, //25,
                              ),
                              child: Text(
                                inputPhone == '' || inputPhone == null
                                    ? ''
                                    : errorMsg,
                                style: TextStyle(
                                  color: RED_LABEL_TEXT_COLOR,
                                  fontSize: 0.038 * _screenSize.width, //14,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 0.031 * _screenSize.height, //20,
                            ),
                            ConfirmButtonWidget(
                              check: check,
                              phoneNumber: inputPhone,
                              verifyCode: inputCode,
                              // selectedCountry: selectedCountry,
                              isInputPhoneStep: isInputPhoneStep,
                              changeInputPhoneStep: changeInputPhoneStep,
                              hasError: hasError,
                              changeErrorMessage: (String newErrorMsg) =>
                                  setState(() {
                                errorMsg = newErrorMsg;
                                hasError = true;
                              }),
                              changeHasError: (bool newHasError) =>
                                  setState(() {
                                hasError = newHasError;
                              }),

                              checkCorrectCode: () =>
                                  checkCorrectCode(inputVerifyCode: inputCode),
                              checkCorrectPhone: () => checkCorrectPhone(
                                  inputPhone: inputPhone, startWithZero: false),

                              startDownTimer: () => startDownTimer(_screenSize),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  changeInputPhoneStep(bool _isInputPhoneStep) {
    setState(() {
      isInputPhoneStep = _isInputPhoneStep;
      print('aaaaaaa isInputPhoneStep : $isInputPhoneStep');
      hasError = false;
      errorMsg = '';
    });
  }
  //

  updatePhoneString(String updatedString) {
    setState(() {
      inputPhone = updatedString;
    });
  }

  updateInputCode(String newInputCode) {
    setState(() {
      inputCode = newInputCode;
      hasError = false;
      errorMsg = '';
      // selectedCodeChar = 0;
    });
  }

  startDownTimer(Size _screenSize) async {
    setState(() {
      minuteTimer = LOGIN_LIMIT_MIN_TIMEOUT;
      secondTimer = LOGIN_LIMIT_SEC_TIMEOUT;
    });
    print('1timer : $minuteTimer:$secondTimer');
    while (!(minuteTimer == '00' && secondTimer == '00')) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        minuteTimer = secondTimer == '00'
            ? minuteTimer[1] == '0'
                ? '${int.parse(minuteTimer[0]) - 1}9'
                : '${int.parse(minuteTimer[0])}${int.parse(minuteTimer[1]) - 1}'
            : minuteTimer;
        secondTimer = secondTimer == '00'
            ? '59'
            : secondTimer[1] == '0'
                ? '${int.parse(secondTimer[0]) - 1}9'
                : '${int.parse(secondTimer[0])}${int.parse(secondTimer[1]) - 1}';
      });
      print('2timer : $minuteTimer:$secondTimer');
    }
  }
}
