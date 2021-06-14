// // *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// // *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// // *   Created Date & Time:  2021-01-01  ,  10:00 AM
// // ****************************************************************************

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class LifecycleEventHandler extends WidgetsBindingObserver {
//   final AsyncCallback resumeCallBack;
//   final AsyncCallback suspendingCallBack;

//   LifecycleEventHandler({
//     this.resumeCallBack,
//     this.suspendingCallBack,
//   });

//   @override
//   Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
//     switch (state) {
//       case AppLifecycleState.resumed:
//         if (resumeCallBack != null) {
//           await resumeCallBack();
//         }
//         break;
//       case AppLifecycleState.inactive:
//       case AppLifecycleState.paused:
//       case AppLifecycleState.detached:
//         if (suspendingCallBack != null) {
//           await suspendingCallBack();
//         }
//         break;
//     }
//   }
// }
