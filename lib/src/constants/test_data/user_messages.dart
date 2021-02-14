// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-06  ,  16:00 AM
// ****************************************************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/colors.dart';
import 'package:jeanswest/src/constants/test_data/texts.dart';
import 'package:jeanswest/src/models/profile/message/user_noti/noti_message.dart';
import 'package:jeanswest/src/utils/helper/global/helper.dart';

//
NotificationMessage firstNotiUserMessage = new NotificationMessage(
  title: 'خشکشویی رباتیک جین وست',
  sender: 'دیجی واش',
  engSender: 'digiwash',
  icon: Icon(Icons.ac_unit_outlined, color: MAIN_BLUE_COLOR),
  pictureAssets: 'assets/images/png_images/profile/big_jeanswest_shop.png',
  text: longLoremIpsum,
  conditions: [
    'قابل استفاده برای خرید های بیش از ${toPriceStyle(200000)} تومان',
    'مدت اعتبار از تاریخ 99/07/12 تا تاریخ 99/07/30',
  ],
  price: toPriceStyle(100000),
  yearOfSend: '2019',
  monthOfSend: '10',
  dayOfSend: '15',
  hourOfSend: '11',
  minOfSend: '23',
  readed: true,
);
NotificationMessage secondNotiUserMessage = new NotificationMessage(
  title: 'پرومیشن 1+1 کاپشن',
  sender: 'جین وست',
  engSender: 'jeanswest',
  icon: Icon(Icons.shopping_cart_outlined, color: MAIN_BLUE_COLOR),
  pictureAssets: 'assets/images/png_images/profile/big_jeanswest_shop.png',
  text: longLoremIpsum,
  conditions: [
    'قابل استفاده برای خرید های بیش از ${toPriceStyle(200000)} تومان',
    'مدت اعتبار از تاریخ 99/07/12 تا تاریخ 99/07/30',
  ],
  price: toPriceStyle(100000),
  yearOfSend: '2020',
  monthOfSend: '08',
  dayOfSend: '25',
  hourOfSend: '11',
  minOfSend: '23',
  readed: false,
);
NotificationMessage thirdNotiUserMessage = new NotificationMessage(
  title: 'بن صبحانه آخر هفته',
  sender: 'بالکافه',
  engSender: 'balcafe',
  icon: Icon(Icons.local_cafe_outlined, color: MAIN_BLUE_COLOR),
  pictureAssets: 'assets/images/png_images/profile/big_jeanswest_shop.png',
  text: longLoremIpsum,
  conditions: [
    'قابل استفاده برای خرید های بیش از ${toPriceStyle(200000)} تومان',
    'مدت اعتبار از تاریخ 99/07/12 تا تاریخ 99/07/30',
  ],
  price: toPriceStyle(100000),
  yearOfSend: '2021',
  monthOfSend: '01',
  dayOfSend: '08',
  hourOfSend: '14',
  minOfSend: '16',
  readed: false,
);

List<NotificationMessage> userMessages = [
  firstNotiUserMessage,
  firstNotiUserMessage,
  secondNotiUserMessage,
  thirdNotiUserMessage,
  thirdNotiUserMessage,
];
