// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final Color titleColor;
  final int lines;
  final String initText;
//
  final Color customBackColor;
//
  final Color textColor;
  final Color hintTextColor;
  final bool isEnable;
  final MediaQueryData mediaQuery;
  final double width;
  //
  final Widget internalIcon;
  final Widget externalIcon;
  //
  final List<LengthLimitingTextInputFormatter> inputFormatters;
  final TextInputType textInputType;
  final bool hasValidation;
  final bool isValid;
  final String validationError;
  final EdgeInsetsGeometry customPadding;

  const CustomTextFieldWidget({
    Key key,
    this.textEditingController,
    this.title,
    this.initText,
    this.lines,
    this.mediaQuery,
    this.titleColor = MAIN_BLUE_COLOR,
    this.isEnable = true,
    this.hintTextColor = Colors.grey,
    this.textColor = Colors.black,
    this.customBackColor = Colors.white,
    this.internalIcon,
    this.externalIcon,
    this.hasValidation = false,
    this.isValid = true,
    this.validationError = '',
    this.inputFormatters = const [],
    this.textInputType = TextInputType.multiline,
    @required this.width,
    this.customPadding,
  }) : super(key: key);
  State<StatefulWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  double totalHeigth;
  //
  String tempTitle;
  bool tempHasValidation;
  bool tempIsValid;
  double heightTextField;
  double heightTitle;
  double heightError;

  @override
  void initState() {
    tempTitle = widget.title;
    tempHasValidation = widget.hasValidation;
    tempIsValid = widget.isValid;
    Map<String, double> heights = updateHeigths(
      screenHeight: widget.mediaQuery.size.height,
      lines: widget.lines,
      title: widget.title,
      hasValidation: widget.hasValidation,
      isValid: widget.isValid,
    );
    heightTitle = heights["heightTitle"];
    heightTextField = heights["heightTextField"];
    heightError = heights["heightError"];
    totalHeigth = heights["totalHeigth"];
    // print("totalHeigth ---- : $totalHeigth");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (tempTitle != widget.title ||
        tempHasValidation != widget.hasValidation ||
        tempIsValid != widget.isValid) {
      setState(() {
        Map<String, double> heights = updateHeigths(
          screenHeight: widget.mediaQuery.size.height,
          lines: widget.lines,
          title: widget.title,
          hasValidation: widget.hasValidation,
          isValid: widget.isValid,
        );
        heightTitle = heights["heightTitle"];
        heightTextField = heights["heightTextField"];
        heightError = heights["heightError"];
        totalHeigth = heights["totalHeigth"];
        print("cahnge totalHeigth ---- : $totalHeigth");
        tempTitle = widget.title;
        tempHasValidation = widget.hasValidation;
        tempIsValid = widget.isValid;
      });
    }

    return Container(
      color: widget.customBackColor,
      padding: widget.customPadding ??
          EdgeInsets.only(
            left: 0.027 * widget.mediaQuery.size.width,
            right: 0.027 * widget.mediaQuery.size.width,
            top: 0.0078 * widget.mediaQuery.size.height,
          ),
      height: totalHeigth,
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title == null || widget.title == ""
              ? SizedBox()
              : Column(
                  children: [
                    Container(
                      height: (
                              // ! heightTitle
                              (0.093 * widget.mediaQuery.size.height) //60
                          ) -
                          0.054 * widget.mediaQuery.size.height, //30
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.027 * widget.mediaQuery.size.width, //10,
                      ),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 0.038 * widget.mediaQuery.size.width, //14,
                          color: widget.hasValidation
                              ? widget.isValid
                                  ? widget.titleColor
                                  : Colors.red
                              : widget.titleColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0.0078 * widget.mediaQuery.size.height, // 5,
                    ),
                  ],
                ),
          Container(
            width: widget.mediaQuery.size.width,
            // color: Colors.amber,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: widget.hasValidation
                            ? widget.isValid
                                ? F2_BACKGROUND_COLOR
                                : RED_ERROR_COLOR
                            : F2_BACKGROUND_COLOR,
                        borderRadius: BorderRadius.circular(
                          0.0078 * widget.mediaQuery.size.height, // 5,
                        ),
                        border: Border.all(
                          color: widget.hasValidation
                              ? widget.isValid
                                  ? F2_BACKGROUND_COLOR
                                  : Colors.red
                              : F2_BACKGROUND_COLOR,
                        )),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            enabled: widget.isEnable,
                            keyboardType: widget.textInputType,
                            inputFormatters: widget.inputFormatters,
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize:
                                  0.0388 * widget.mediaQuery.size.width, // 14,
                            ),
                            maxLines: widget.lines ?? 1,
                            controller: widget.textEditingController,
                            cursorColor: MAIN_BLUE_COLOR,
                            showCursor: true,
                            decoration: InputDecoration(
                              hintText: widget.initText ?? '',
                              hintStyle: TextStyle(color: widget.hintTextColor),
                              contentPadding: EdgeInsets.symmetric(
                                vertical:
                                    0.0078 * widget.mediaQuery.size.height, //5,
                                horizontal:
                                    0.055 * widget.mediaQuery.size.width, // 20,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        widget.internalIcon ?? SizedBox(),
                      ],
                    ),
                  ),
                ),
                widget.externalIcon != null
                    ? Row(children: [
                        SizedBox(
                          width: 0.027 * widget.mediaQuery.size.width, //10,
                        ),
                        widget.externalIcon
                      ])
                    : SizedBox(),
              ],
            ),
          ),
          Container(
            height: heightError,
            // width: widget.width,
            child: widget.hasValidation
                ? Column(
                    children: [
                      SizedBox(
                        height: 0.01182 * widget.mediaQuery.size.height, // 7,
                      ),
                      Expanded(
                        child: Text(
                          widget.validationError,
                          style: TextStyle(
                            fontSize:
                                0.034 * widget.mediaQuery.size.width, //12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
