// //*  Created By:    Mohammad Shamsi        //*  Email:  mshamsi502@gmail.com
// //*  Project Name:  avakatan_branches
// //*  Created on:    7th October - 07/10/2020     _     15:23:37
// //****************************************************************************
// import 'package:jeanswest/src/models/profile/gender/gender.dart';
// import 'package:jeanswest/src/constants/global/colors.dart';
// import 'package:jeanswest/src/ui/global/widgets/app_bars/appbar_with_close_widget.dart';

// import 'package:jeanswest/src/ui/profile/widgets/global/account_info/select_date_widget.dart';
// import 'package:jeanswest/src/ui/global/widgets/select_date_panel_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';

// import 'package:jeanswest/src/ui/global/widgets/avakatan_button_widget.dart';
// // import 'account_info/custom_text_field_widget.dart';

// import 'package:jeanswest/src/ui/global/widgets/custom_text_field_widget.dart';

// class EditFriendInfoWidget extends StatefulWidget {
//   final String title;
//   final String name;
//   final String dayOfBirth;
//   final String monthOfBirth;
//   final String yearOfBirth;
//   final Function(
//     String,
//     String,
//     String,
//     String,
//     String,
//   ) confirmInfo;

//   const EditFriendInfoWidget({
//     Key key,
//     // this.closePanel,
//     this.confirmInfo,
//     this.title,
//     this.name,
//     this.dayOfBirth,
//     this.monthOfBirth,
//     this.yearOfBirth,
//   }) : super(key: key);
//   State<StatefulWidget> createState() => _EditFriendInfoWidgetState();
// }

// class _EditFriendInfoWidgetState extends State<EditFriendInfoWidget> {
//   PanelController selectDateController = new PanelController();
//   TextEditingController nameEditingController = new TextEditingController();

//   Gender selectedGender;
//   String dayOfBirth;
//   String monthOfBirth;
//   String yearOfBirth;
//   bool isOpeningPanel;

//   @override
//   void initState() {
//     isOpeningPanel = false;
//     setState(() {
//       nameEditingController.text = widget.name ?? '';
//       dayOfBirth = widget.dayOfBirth ?? '29';
//       monthOfBirth = widget.monthOfBirth ?? '01';
//       yearOfBirth = widget.yearOfBirth ?? '1374';
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _screenSize = MediaQuery.of(context).size;
//     if (isOpeningPanel) {
//       setState(() {
//         nameEditingController.text = widget.name ?? '';
//         dayOfBirth = widget.dayOfBirth ?? '29';
//         monthOfBirth = widget.monthOfBirth ?? '01';
//         yearOfBirth = widget.yearOfBirth ?? '1374';
//         isOpeningPanel = false;
//         print('isOpeningPanel (3 in Build) : $isOpeningPanel');
//         print('---------------------------------------------');
//       });
//     }
//     return Container(
//       color: Colors.grey,
//       child: SafeArea(
//         child: Scaffold(
//           body: SlidingUpPanel(
//             controller: selectDateController,
//             minHeight: 0,
//             maxHeight: 0.5 * _screenSize.height, //320,
//             backdropEnabled: true,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(
//                 0.041 * _screenSize.width, //15,
//               ),
//               topRight: Radius.circular(
//                 0.041 * _screenSize.width, //15,
//               ),
//             ),
//             panel: SelectDatePanelWidget(
//               confirmDate: confirmDate,
//               dayValue: dayOfBirth,
//               monthValue: monthOfBirth,
//               yearValue: yearOfBirth,
//             ),
//             body: Container(
//               color: Colors.white,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 0.027 * _screenSize.width, //10,
//               ),
//               child: Stack(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppBarWithCloseWidget(
//                         title: widget.title,
//                         closeOnTap: () => Navigator.pop(context),
//                       ),
//                       SizedBox(
//                         height: 0.03125 * _screenSize.height, //20
//                       ),
//                       CustomTextFieldWidget(
//                         title: 'نام و نام خانوادگی *',
//                         textEditingController: nameEditingController,
//                         initText: widget.name ?? 'محمد شمسی',
//                       ),
//                       SizedBox(
//                         height: 0.03125 * _screenSize.height, //20
//                       ),
//                       SelectDateWidget(
//                         title: 'تاریخ تولد',
//                         yearOfBirth: yearOfBirth,
//                         monthOfBirth: monthOfBirth,
//                         dayOfBirth: dayOfBirth,
//                         openPanel: () {
//                           selectDateController.open();
//                         },
//                       ),
//                       SizedBox(height: 0.0078 * _screenSize.height //5,
//                           ),
//                     ],
//                   ),
//                   Positioned(
//                     bottom: 0.0625 * _screenSize.height, //40
//                     right: 0.069 * _screenSize.width, //25,
//                     left: 0.069 * _screenSize.width, //25,
//                     child: Container(
//                       alignment: Alignment.bottomCenter,
//                       padding: EdgeInsets.symmetric(
//                         vertical: 0.03125 * _screenSize.height, //20
//                         horizontal: 0.027 * _screenSize.width, //10,
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: AvakatanButtonWidget(
//                               backgroundColor: MAIN_BLUE_COLOR,
//                               textColor: Colors.white,
//                               borderColor: Colors.transparent,
//                               title: 'تایید اطلاعات',
//                               height: 0.0625 * _screenSize.height, //40
//                               onTap: () {
//                                 widget.confirmInfo(
//                                   nameEditingController.text,
//                                   nameEditingController.text,
//                                   dayOfBirth,
//                                   monthOfBirth,
//                                   yearOfBirth,
//                                 );
//                                 Navigator.pop(context);
//                                 // widget.closePanel();
//                               },
//                               radius: 0.0078 * _screenSize.height, //5,
//                               fontSize: 0.038 * _screenSize.width, //14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   confirmDate(bool _isReset, String _dayOfBirth, String _monthOfBirth,
//       String _yearOfBirth) {
//     print('selected date is : $_yearOfBirth / $_monthOfBirth /  $_dayOfBirth');
//     setState(() {
//       dayOfBirth = _dayOfBirth;
//       monthOfBirth = _monthOfBirth;
//       yearOfBirth = _yearOfBirth;
//     });
//     selectDateController.close();
//   }
// }
