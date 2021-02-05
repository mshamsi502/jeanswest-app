// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  final String text;
  final double widthText;
  final int milliSecond;
  final bool allowFinish;
  final Function closeLoading;

  const LoadingPage({
    Key key,
    this.text,
    this.widthText,
    this.milliSecond,
    this.closeLoading,
    this.allowFinish,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  String loading;
  @override
  void initState() {
    loading = '';
    splashProvider();
    splashDuration();
    super.initState();
  }

  splashProvider() async {
    while (true) {
      await Future.delayed(Duration(milliseconds: 250));
      if (mounted)
        setState(() {
          loading = '.';
        });
      await Future.delayed(Duration(milliseconds: 250));
      if (mounted)
        setState(() {
          loading = '. .';
        });
      await Future.delayed(Duration(milliseconds: 250));
      if (mounted)
        setState(() {
          loading = '. . .';
        });
      await Future.delayed(Duration(milliseconds: 250));
      if (mounted)
        setState(() {
          loading = '';
        });
    }
  }

  splashDuration() async {
    if (widget.milliSecond != null || widget.milliSecond == 0) {
      await Future.delayed(Duration(milliseconds: widget.milliSecond));
      if (widget.allowFinish) {
        widget.closeLoading();
      } else {
        splashDuration();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 0.09 * _screenSize.width,
              height: 0.09 * _screenSize.width,
              child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
                strokeWidth: 0.008 * _screenSize.width,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            widget.text == null || widget.text.length == 0 || widget.text == ''
                ? Container()
                : Container(
                    alignment: context.locale.toString() == 'fa_IR'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    width: widget.widthText * _screenSize.width,
                    child: Text(
                      '${widget.text} $loading',
                      style: TextStyle(
                        fontSize: 0.0416 * _screenSize.width,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
