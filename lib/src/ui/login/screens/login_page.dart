// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:33 PM
// ****************************************************************************

import 'dart:ui';

import 'package:jeanswest/src/constants/login/country_code_list.dart';
import 'package:jeanswest/src/constants/login/svg_images/login_svg_images.dart';
import 'package:jeanswest/src/models/country/country.dart';
import 'package:jeanswest/src/ui/global/widgets/app_bars/real_search_appbar_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/confirm_code_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/country_list_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/login_app_bar_widget.dart';
import 'package:jeanswest/src/ui/login/widgets/login_body_widget.dart';
import 'package:jeanswest/src/utils/helper/search/helper_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LoginPage extends StatefulWidget {
  final Function(int, int) updateProp;

  const LoginPage({Key key, this.updateProp}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PanelController keyboardPanelController = new PanelController();
  bool keyboardIsOpen = false;
  PanelController preTelCodePanelController = new PanelController();
  bool preTelCodeIsOpen = false;
  String inputPhone = '9176509634';
  String inputCode = '-----';
  bool hasError = false;
  bool isInputPhoneStep = true;
  int selectedCodeChar = 0;
  //
  String minuteTimer;
  String secondTimer;
  //
  FocusNode inputNode = FocusNode();
  TextEditingController textEditingController = new TextEditingController();
  List<Country> allCountries = new List<Country>();
  List<Country> searchedCountries = new List<Country>();
  Map<String, dynamic> map = CountriesCodeList.PERSIAN_GULF_COUNTRY_LIST;
  Country selectedCountry;

  @override
  void initState() {
    selectedCountry = Country(
      name: map['countries_code'][0]['name_per'],
      // name: map['countries_code'][i]['name_eng'],
      dialCode: map['countries_code'][0]['dial_code'],
      code: map['countries_code'][0]['code'],
      flag: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              map['countries_code'][0]['flag'],
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
      ),
    );
    Future.delayed(Duration.zero, () {
      for (var i = 0; i < map['countries_code'].length; i++) {
        Country country = Country(
          name: map['countries_code'][i][context.locale.toString() == 'fa_IR'
              ? 'name_per'
              : context.locale.toString() == 'ar_UA'
                  ? 'name_arb'
                  : 'name_eng'],
          // name: map['countries_code'][i]['name_eng'],
          dialCode: map['countries_code'][i]['dial_code'],
          code: map['countries_code'][i]['code'],
          flag: new Container(
            width: 35,
            height: 35,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image:
                    // AssetImage('assets/images/invite_friends.png'),
                    new NetworkImage(
                  map['countries_code'][i]['flag'],
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
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
    setState(() {
      minuteTimer = '00';
      secondTimer = '00';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: SlidingUpPanel(
            minHeight: 0,
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0),
              )
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
              // height: _screenSize.height,,
              color: Colors.white,
              child: Column(
                children: [
                  RealSearchAppBarWidget(
                    title: '${"login_screen.country_code".tr()} ...',
                    changeListPanelState: changeCountryListPanelState,
                    changeTextFieldSearch: changeTextFieldSearch,
                    inputNode: inputNode,
                    textEditingController: textEditingController,
                  ),
                  CountryListWidget(
                    countries: searchedCountries,
                    selectedCountry: selectedCountry,
                    changeCountryListPanelState: changeCountryListPanelState,
                    changeSelectedCountry: changeSelectedCountry,
                  ),
                ],
              ),
            ),
            body: Stack(
              children: [
                Container(
                  color: Colors.grey,
                  width: _screenSize.width,
                  child: SlidingUpPanel(
                    minHeight: 0,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 0,
                        color: Color.fromRGBO(0, 0, 0, 0),
                      )
                    ],
                    maxHeight: 250,
                    backdropEnabled: false,
                    backdropOpacity: 0,
                    backdropColor: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 90),
                    color: Colors.transparent,
                    controller: keyboardPanelController,
                    onPanelOpened: () {
                      setState(() {
                        keyboardIsOpen = true;
                      });
                    },
                    onPanelClosed: () {
                      setState(() {
                        keyboardIsOpen = false;
                      });
                    },
                    panel: Container(),
                    // CustomKeyboardWidget(
                    //   inputString: isInputPhoneStep ? inputPhone : inputCode,
                    //   updateString: isInputPhoneStep
                    //       ? updatePhoneString
                    //       : updateCodeString,
                    // ),

                    body: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      color: Colors.white,
                      child: Stack(
                        // child: Stack(
                        children: [
                          LoginAppBarWidget(
                            keyboardPanelController: keyboardPanelController,
                            preTelCodePanelController:
                                preTelCodePanelController,
                            updateProp: widget.updateProp,
                          ),
                          isInputPhoneStep
                              ? LoginBodyWidget(
                                  keyboardPanelController:
                                      keyboardPanelController,
                                  keyboardIsOpen: keyboardIsOpen,
                                  preTelCodePanelController:
                                      preTelCodePanelController,
                                  inputPhone: inputPhone,
                                  hasError: hasError,
                                  // hasError: true,
                                  selectedCountry: selectedCountry,
                                )
                              : ConfirmCodeWidget(
                                  keyboardPanelController:
                                      keyboardPanelController,
                                  keyboardIsOpen: keyboardIsOpen,
                                  inputPhone: inputPhone,
                                  inputCode: inputCode,
                                  hasError: hasError,
                                  // hasError: true,
                                  selectedCountry: selectedCountry,
                                  backToInputPhoneStep: changeToInputPhoneStep,
                                  updateSelectedChar: updateSelectedCodeChar,
                                  selectedChar: selectedCodeChar,
                                  updateInputCode: updateInputCode,
                                  minuteTimer: minuteTimer,
                                  secondTimer: secondTimer,
                                  startDownTimer: startDownTimer,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: _screenSize.width,
                    height: 80,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                            onTap: () {
                              List response = isInputPhoneStep
                                  ? checkCorrectPhone()
                                  : checkCorrectCode();
                              bool check = response[0];
                              String msg = response[1];
                              setState(() {
                                if (isInputPhoneStep) {
                                  if (check) {
                                    hasError = false;
                                    preTelCodePanelController.close();
                                    keyboardPanelController.close();
                                    isInputPhoneStep = false;
                                    startDownTimer();
                                    selectedCodeChar = 0;
                                  } else {
                                    hasError = true;
                                    showSnackBarError(msg);
                                  }
                                } else {
                                  if (check) {
                                    hasError = false;
                                    preTelCodePanelController.close();
                                    keyboardPanelController.close();
                                    print('Code Is OK...');
                                  } else {
                                    hasError = true;
                                    showSnackBarError(msg);
                                    selectedCodeChar = 0;
                                  }
                                }
                              });
                            },
                            child: LoginSvgImages.confirmIcon),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //

  showSnackBarError(String msg) {
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: GestureDetector(
          // ignore: deprecated_member_use
          onTap: () => Scaffold.of(context).hideCurrentSnackBar(),
          child: Container(
            height: 110,
            color: Colors.transparent,
            padding: EdgeInsets.only(
              bottom: 65,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            // height: 10,
                            // color: Colors.blue,
                            ),
                      ),
                      Container(
                        width: (msg.length > 25)
                            ? MediaQuery.of(context).size.width * 0.7
                            : MediaQuery.of(context).size.width * 0.55,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              // Icons.warning_amber_outlined,
                              size: 16,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                msg,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'IRANSans', fontSize: 12),
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            // height: 10,
                            // color: Colors.blue,
                            ),
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

  List checkCorrectPhone() {
    return inputPhone == null
        ? [false, "login_screen.phone_number_is_incorrect".tr()]
        : inputPhone.startsWith('0')
            ? [false, "login_screen.enter_phone_number_without_first_zero".tr()]
            : inputPhone.length != 10
                ? [false, "login_screen.phone_number_must_be_ten_number".tr()]
                : !inputPhone.startsWith('9')
                    ? [
                        false,
                        "login_screen.phone_number_must_be_start_with_nine".tr()
                      ]
                    : [true, ''];
  }

  List checkCorrectCode() {
    return inputCode == null || inputCode.length != 5 || inputCode.contains('-')
        ? [false, "login_screen.enter_the_code_more_carefully".tr()]
        : inputCode != '23456'
            ? [false, "login_screen.code_is_incorrect".tr()]
            : [true, ''];
  }

  //

  changeToInputPhoneStep() async {
    setState(() {
      isInputPhoneStep = true;
      inputPhone = '';
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

  startDownTimer() async {
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
    showSnackBarError(warningMsg);
  }

  //

  changeCountryListPanelState(bool opt) async {
    if (opt) {
      setState(() {
        changeTextFieldSearch('');
        preTelCodePanelController.animatePanelToPosition(1.0,
            duration: Duration(milliseconds: 500));
        // panelController.open();
        FocusScope.of(context).requestFocus(inputNode);
      });
    } else {
      // panelController.close();
      await preTelCodePanelController.animatePanelToPosition(0.0,
          duration: Duration(milliseconds: 500));
      setState(() {
        changeTextFieldSearch('');
        if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
      });
    }
  }

  changeTextFieldSearch(String textFieldSearchValue) {
    setState(() {
      if (textFieldSearchValue == null ||
          textFieldSearchValue.isEmpty ||
          textFieldSearchValue == '') {
        textEditingController.clear();
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
