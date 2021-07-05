// // *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// // *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// // *   Created Date & Time:  2021-01-01  ,  10:00 AM
// // ****************************************************************************

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:permission_handler/permission_handler.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRCodeScannerWidget extends StatefulWidget {
//   final Function(String) sendResult;

//   QRCodeScannerWidget({
//     Key key,
//     @required this.sendResult,
//   }) : super(key: key);

//   State<StatefulWidget> createState() => _QRCodeScannerWidgetState();
// }

// class _QRCodeScannerWidgetState extends State<QRCodeScannerWidget> {
//   // Barcode result;
//   // QRViewController controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   PermissionStatus hasAccess = PermissionStatus.denied;
//   bool _flashIsOn;

//   @override
//   void initState() {
//     _flashIsOn = false;
//     checkCameraAccess().then(
//       (res) => hasAccess = res,
//     );
//     super.initState();
//   }

//   Future<PermissionStatus> checkCameraAccess() async {
//     PermissionStatus oldPermissionStatus = await Permission.camera.status;
//     if (oldPermissionStatus.isGranted) {
//       return oldPermissionStatus;
//     } else {
//       Map<Permission, PermissionStatus> statuses = await [
//         Permission.camera,
//       ].request();
//       return statuses[Permission.camera];
//     }
//   }

//   // void reassemble() {
//   //   super.reassemble();
//   //   if (Platform.isAndroid) {
//   //     controller.pauseCamera();
//   //   }
//   //   controller.resumeCamera();
//   // }

//   // void _onQRViewCreated(QRViewController controller) {
//   //   setState(() {
//   //     this.controller = controller;
//   //   });
//   //   controller.scannedDataStream.listen((scanData) {
//   //     setState(() {
//   //       result = scanData;
//   //     });
//   //   });
//   // }

//   @override
//   void dispose() {
//     // controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _screenSize = MediaQuery.of(context).size;

//     return !hasAccess.isDenied
//         ? SizedBox()
//         : SizedBox(
//             width: 0.83333 * _screenSize.width, //300,
//             height: 0.625 * _screenSize.height, //370,
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(child: SizedBox()),
//                         GestureDetector(
//                           child: Container(
//                             // color: Colors.red,
//                             padding: EdgeInsets.all(
//                               0.027 * _screenSize.width, //10,
//                             ),
//                             child: Icon(
//                               Icons.close,
//                               size: 0.05 * _screenSize.width, //18,
//                             ),
//                           ),
//                           onTap: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         top: 0.046 * _screenSize.height, //30
//                       ),
//                       child: Center(
//                         child: Container(
//                           height: 0.4 * _screenSize.height, //250,
//                           width: 0.4 * _screenSize.height, //250,
//                           margin: EdgeInsets.symmetric(
//                             vertical: 0.041 * _screenSize.width, //15,
//                           ),

//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blueGrey[200]),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           // child:

//                           //  QRView(
//                           //   key: qrKey,
//                           //   onQRViewCreated: _onQRViewCreated,
//                           //   overlay: QrScannerOverlayShape(
//                           //     borderColor: Colors.red,
//                           //     borderRadius: 10,
//                           //     borderLength: 30,
//                           //     borderWidth: 10,
//                           //     cutOutSize: 240,
//                           //   ),
//                           // ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 0.016 * _screenSize.height, //10
//                 ),
//                 Text(
//                   'جهت تعویض کالا در فروشگاه این بارکد را به فروشنده نشان دهید',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 0.038 * _screenSize.width, //14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }
