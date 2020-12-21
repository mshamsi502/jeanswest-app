// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_branches
// *   Created Date & Time :  2020-10-11  ,  12:35 PM
// ****************************************************************************

import 'package:flutter/material.dart';
import 'package:jeanswest/src/utils/service_locator.dart';

class SplashPage extends StatefulWidget {
  final String text;

  const SplashPage({Key key, this.text}) : super(key: key);
  @override
  State<StatefulWidget> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              widget.text == null ||
                      widget.text.length == 0 ||
                      widget.text == ''
                  ? Container()
                  : Container(
                      alignment: Alignment.centerLeft,
                      width: 80,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> splashDuration() async {
  await Future.delayed(Duration(seconds: 3));
  return locator.allReady();
}
