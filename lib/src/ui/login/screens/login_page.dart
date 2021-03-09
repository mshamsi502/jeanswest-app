// ! *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// ! *   Project Name :  avakatan_branches
// ! *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ! ****************************************************************************

import 'dart:ui';

import 'package:jeanswest/src/constants/login/country_code_list.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/real_search_appbar_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/confirm_code_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/confirm_button_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/country_list_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/login_app_bar_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/login_body_widget.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';
import 'package:jeanswest/src/utils/helper/search/helper_search.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

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
  bool keyboardIsOpen = false;
  PanelController preTelCodePanelController = new PanelController();
  bool preTelCodeIsOpen = false;
  String inputPhone = '9176509634';
  String inputCode = '-----';
  bool hasError = false;
  bool isInputPhoneStep = true;
  int selectedCodeChar = 0;
  ScrollController scrollController = new ScrollController();
  //
  String minuteTimer;
  String secondTimer;
  //
  bool check;

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

    getConteries(widget.screenSize);
    minuteTimer = '00';
    secondTimer = '00';
    //

    KeyboardVisibilityNotification().addNewListener(
      onHide: () {
        scrollController.jumpTo(0);
      },
      onShow: () {
        scrollController.jumpTo(widget.screenSize.width);
      },
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
          onWillPop: () => backPanelClose(preTelCodePanelController, context),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              child: Container(
                width: _screenSize.width,
                height: 0.8 * _screenSize.height,
                child: SlidingUpPanel(
                  minHeight: 0,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 0,
                      color: Color.fromRGBO(0, 0, 0, 0),
                    ),
                  ],
                  maxHeight: _screenSize.height,
                  backdropEnabled: false,
                  backdropOpacity: 0,
                  backdropColor: Colors.transparent,
                  color: Colors.transparent,
                  defaultPanelState: PanelState.CLOSED,
                  controller: preTelCodePanelController,
                  onPanelOpened: () {
                    setState(() {
                      preTelCodeIsOpen = true;
                    });
                  },
                  onPanelClosed: () {
                    setState(() {
                      preTelCodeIsOpen = false;
                    });
                  },
                  panel: Container(
                    height: _screenSize.height,
                    color: Colors.white,
                    child: Column(
                      children: [
                        RealSearchAppBarWidget(
                          title: '${"login_screen.country_code".tr()} ...',
                          changeListPanelState: changeCountryListPanelState,
                          changeTextFieldSearch: changeTextFieldSearch,
                          inputNode: searchInputNode,
                          textEditingController: searchTextEditingController,
                        ),
                        CountryListWidget(
                          countries: searchedCountries,
                          selectedCountry: selectedCountry,
                          changeCountryListPanelState:
                              changeCountryListPanelState,
                          changeSelectedCountry: changeSelectedCountry,
                        ),
                      ],
                    ),
                  ),
                  body: Container(
                    width: _screenSize.width,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 0.15625 * _screenSize.height, //100,
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
                        ),
                        Positioned(
                          top: isInputPhoneStep
                              ? 0.2812 * _screenSize.height //180,
                              : 0.34 * _screenSize.height, //217
                          child: Container(
                            child: Column(
                              children: [
                                isInputPhoneStep
                                    ? LoginBodyWidget(
                                        focusNode: phoneInputNode,
                                        phoneTextEditingController:
                                            phoneTextEditingController,
                                        keyboardIsOpen: keyboardIsOpen,
                                        preTelCodePanelController:
                                            preTelCodePanelController,
                                        inputPhone: inputPhone,
                                        hasError: hasError,
                                        // hasError: true,
                                        selectedCountry: selectedCountry,
                                        changeTextFieldSearch:
                                            (String newValue) {
                                          print('update check');
                                          setState(() {
                                            inputPhone = newValue;
                                            print('inputPhone : $inputPhone');
                                          });
                                          List response = checkCorrectPhone(
                                              inputPhone: inputPhone,
                                              startWithZero: false);
                                          setState(() {
                                            check = response[0];
                                            print('check : $check');
                                          });
                                        },
                                      )
                                    : ConfirmCodeWidget(
                                        focusNode: codeConfirmInputNode,
                                        phoneTextEditingController:
                                            phoneTextEditingController,
                                        keyboardIsOpen: keyboardIsOpen,
                                        inputPhone: inputPhone,
                                        inputCode: inputCode,
                                        hasError: hasError,
                                        selectedCountry: selectedCountry,
                                        backToInputPhoneStep:
                                            changeInputPhoneStep,
                                        updateSelectedChar:
                                            updateSelectedCodeChar,
                                        selectedChar: selectedCodeChar,
                                        updateInputCode: updateInputCode,
                                        minuteTimer: minuteTimer,
                                        secondTimer: secondTimer,
                                        startDownTimer: () =>
                                            startDownTimer(_screenSize),
                                      ),
                                SizedBox(
                                  height: 0.039 * _screenSize.height, //25,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0.6 * _screenSize.height, //355,
                          left: 0,
                          right: 0,
                          child: ConfirmButtonWidget(
                            check: check,
                            phoneNumber: inputPhone,
                            verifyCode: inputCode,
                            selectedCountry: selectedCountry,
                            isInputPhoneStep: isInputPhoneStep,
                            changeInputPhoneStep: changeInputPhoneStep,
                            hasError: hasError,
                            changeHasError: (bool newHasError) {
                              setState(() {
                                hasError = newHasError;
                              });
                            },
                            checkCorrectCode: () =>
                                checkCorrectCode(inputVerifyCode: inputCode),
                            checkCorrectPhone: () => checkCorrectPhone(
                                inputPhone: inputPhone, startWithZero: false),
                            closePreTelCodePanelController: () {
                              preTelCodePanelController.close();
                            },
                            startDownTimer: () => startDownTimer(_screenSize),
                            changeSelectedCodeChar: updateSelectedCodeChar,
                            showSnackBarError: (String msg,
                                    BuildContext context) =>
                                showSnackBarError(msg, context, _screenSize),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  showSnackBarError(String msg, BuildContext _context, Size _screenSize) {
    // ignore: deprecated_member_use
    // Scaffold.of(_context).showSnackBar(
    // ignore: deprecated_member_use
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        elevation: 0,
        content: GestureDetector(
          // ignore: deprecated_member_use
          onTap: () => scaffoldKey.currentState.hideCurrentSnackBar(),
          child: Container(
            height: 0.172 * _screenSize.height, //110,
            color: Colors.transparent,
            padding: EdgeInsets.only(bottom: 0.1 * _screenSize.height //65,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        width: (msg.length > 25)
                            ? MediaQuery.of(_context).size.width * 0.7
                            : MediaQuery.of(_context).size.width * 0.55,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.054 * _screenSize.width, //20
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              0.138 * _screenSize.width, //50,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              // Icons.warning_amber_outlined,
                              size: 0.0444 * _screenSize.width, //16,
                            ),
                            SizedBox(
                              width: 0.0138 * _screenSize.width, //5,
                            ),
                            Expanded(
                              child: Text(
                                msg,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'IRANSans',
                                  fontSize: 0.034 * _screenSize.width, //12,
                                ),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        duration: Duration(milliseconds: 3000),
      ),
    );
  }

  //

  changeInputPhoneStep(bool _isInputPhoneStep) async {
    setState(() {
      isInputPhoneStep = _isInputPhoneStep;

      // check = false;
      // inputPhone = '';
      updateInputCode('-----');
      selectedCodeChar = 0;
    });
  }
  //

  updatePhoneString(String updatedString) {
    setState(() {
      inputPhone = updatedString;
    });
  }
  //

  updateCodeString(String updatedString) {
    String updateChar = updatedString.substring(updatedString.length - 1);
    setState(() {
      bool isRemove = updatedString.length < 5;

      inputCode =
          '${inputCode.substring(0, selectedCodeChar)}${isRemove ? '-' : updateChar}${inputCode.substring(selectedCodeChar + 1)}';
      selectedCodeChar = isRemove
          ? selectedCodeChar == 0
              ? 0
              : selectedCodeChar - 1
          : selectedCodeChar == 4
              ? 0
              : selectedCodeChar + 1;
    });
  }

  updateSelectedCodeChar(int selectedChar) {
    print('selectedChar: $selectedChar');
    setState(() {
      selectedCodeChar = selectedChar;
    });
  }

  updateInputCode(String newInputCode) {
    setState(() {
      inputCode = newInputCode;
      hasError = false;
      selectedCodeChar = 0;
    });
  }

  startDownTimer(Size _screenSize) async {
    setState(() {
      minuteTimer = '00';
      secondTimer = '10';
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
    String warningMsg =
        "login_screen.your_code_has_expired_please_click_on_resend".tr();
    showSnackBarError(warningMsg, context, _screenSize);
  }

  changeCountryListPanelState(bool opt, BuildContext _context) async {
    changeInputPhoneStep(true);
    if (opt) {
      setState(() {
        changeTextFieldSearch('');
        preTelCodePanelController.animatePanelToPosition(1.0,
            duration: Duration(milliseconds: 500));
        // panelController.open();
        FocusScope.of(_context).requestFocus(phoneInputNode);
      });
    } else {
      // panelController.close();
      await preTelCodePanelController.animatePanelToPosition(0.0,
          duration: Duration(milliseconds: 500));
      setState(() {
        changeTextFieldSearch('');
        if (FocusScope.of(_context).hasFocus) FocusScope.of(_context).unfocus();
      });
    }
  }

  changeTextFieldSearch(String textFieldSearchValue) {
    setState(() {
      if (textFieldSearchValue == null ||
          textFieldSearchValue.isEmpty ||
          textFieldSearchValue == '') {
        searchTextEditingController.clear();
        // searchedCountries = countries;
        searchedCountries = allCountries;
      } else {
        searchedCountries = getListOfObjectsStatic(
                query: textFieldSearchValue,
                // objects: countries,
                objects: allCountries,
                modelName: 'Country')
            ?.cast<Country>();
      }
      print(
          '.+..+..+.. searchedCountries Length : ${searchedCountries.length}');
    });
  }

  changeSelectedCountry(Country selectedCountry) async {
    setState(() {
      this.selectedCountry = selectedCountry;
    });
  }
  //

}
