// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:35 PM
// ****************************************************************************

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/service_locator.dart';

class LoadingPage extends StatefulWidget {
  final String text;
  final double widthText;
  final int milliSecond;
  final Function closeLoading;

  const LoadingPage(
      {Key key, this.text, this.widthText, this.milliSecond, this.closeLoading})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  String loading;
  // String fillLoading;
  @override
  void initState() {
    loading = '';
    // fillLoading = '      ';
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
          // fillLoading = '    ';
        });
      await Future.delayed(Duration(milliseconds: 250));
      if (mounted)
        setState(() {
          loading = '. .';
          // fillLoading = '  ';
        });
      await Future.delayed(Duration(milliseconds: 250));
      if (mounted)
        setState(() {
          loading = '. . .';
          // fillLoading = '';
        });
      await Future.delayed(Duration(milliseconds: 250));
      if (mounted)
        setState(() {
          loading = '';
          // fillLoading = '      ';
        });
    }
  }

  splashDuration() async {
    if (widget.milliSecond != null || widget.milliSecond == 0) {
      await Future.delayed(Duration(milliseconds: widget.milliSecond));
      widget.closeLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
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
                    width: widget.widthText,
                    child: Text(
                      '${widget.text} $loading',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

Future<void> splashDuration() async {
  await Future.delayed(Duration(seconds: 3));
  return locator.allReady();
}
