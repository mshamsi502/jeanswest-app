// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jeanswest/src/constants/global/constValues/colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final Color titleColor;
  final int lines;
  final String initText;

  final Color textColor;
  final Color hintTextColor;
  final bool isEnable;
  final MediaQueryData mediaQuery;
  //
  final Widget internalIcon;
  final Widget externalIcon;
  //
  final bool hasValidation;
  final bool isValid;
  final String validationError;

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
    this.internalIcon,
    this.externalIcon,
    this.hasValidation = false,
    this.isValid = false,
    this.validationError = '',
  }) : super(key: key);
  State<StatefulWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      padding: EdgeInsets.symmetric(
        horizontal: 0.027 * widget.mediaQuery.size.width, //10,
      ),
      height: ( // ! heightTextField

              (widget.lines == null || widget.lines == 1)
                  ? (0.03125 * widget.mediaQuery.size.height) //20
                  : (0.0355 *
                      widget.mediaQuery.size.height // 21
                      *
                      widget.lines.toInt())) +
          ( // ! heightTitle
              (0.093 * widget.mediaQuery.size.height) //60
          ) +
          ( // ! heightError
              ((!widget.hasValidation || widget.isValid) ? 0 : 20)) +
          0.033 * widget.mediaQuery.size.height, //15,
      width: widget.mediaQuery.size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                            keyboardType: TextInputType.multiline,
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
                                vertical: 0.015 *
                                    widget.mediaQuery.size.height, // 10,
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
                SizedBox(
                  width: 0.027 * widget.mediaQuery.size.width, //10,
                ),
                widget.externalIcon ?? SizedBox(),
              ],
            ),
          ),
          SizedBox(
            height: 0.01182 * widget.mediaQuery.size.height, // 7,
          ),
          Container(
            child: widget.hasValidation
                ? Expanded(
                    child: Text(
                      widget.validationError,
                      style: TextStyle(
                        fontSize: 0.034 * widget.mediaQuery.size.width, //12,
                        color: Colors.red,
                      ),
                    ),
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
