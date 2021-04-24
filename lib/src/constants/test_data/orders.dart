// // *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// // *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// // *   Created Date & Time:  2021-01-01  ,  10:00 AM
// // ****************************************************************************

// import 'package:jeanswest/src/constants/test_data/product.dart';
// import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-main-info.dart';
// import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-friends-info.dart';
// import 'package:jeanswest/src/constants/global/globalInstances/userAllInfo/user-addresses-info.dart';
// import 'package:jeanswest/src/models/order/exact_time_order.dart';
// import 'package:jeanswest/src/models/order/order.dart';
// import 'package:jeanswest/src/models/order/period_time_order.dart';

// Order firstOrder = new Order(
//   code: 'B54008832',
//   receiverName: "${user.firstName ?? "کاربر"} ${user.lastName ?? "جدید"}",
//   phoneNumber: '09337324560',
//   sendMethod: 'اکسپرس بانی مد',
//   // statusShopping: 'در حال انجام',
//   // statusStep: 'در حال انجام',
//   statusShopping: 'تکمیل شده',
//   statusStep: 'تکمیل شده',
//   products: [
//     firstFav,
//     secondFav,
//     thirdFav,
//   ],
//   countProducts: [1, 1, 1],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '06',
//     dayOfDate: '13',
//     startHourOfDate: '09',
//     endHourOfDate: '12',
//     perExplain: 'پنجشنبه 13 شهریور',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   address: userAddresses[0],
//   trackingCode: '654566682314900861',
//   paymentPlan: 'درگاه بانک سامان',
//   paymentTrackingCode: '189432',
//   sendPrice: '0',
// );
// Order secondOrder = new Order(
//   code: 'B54025644',
//   receiverName: userFriends.friends[1] != null
//       ? "${userFriends.friends[1].firstName ?? "کاربر"} ${userFriends.friends[1].lastName ?? "جدید"}"
//       : "${user.firstName} ${user.lastName}",
//   sendMethod: 'اکسپرس بانی مد',
//   phoneNumber: '09176509634',
//   statusShopping: 'تکمیل شده',
//   statusStep: 'تکمیل شده',
//   products: [
//     secondFav,
//     thirdFav,
//     sixthFav,
//   ],
//   countProducts: [3, 2, 3],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '13',
//     hourOfDate: '09',
//     minuteOfDate: '48',
//     perExplain: 'شنبه 13 اردیبهشت',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '16',
//     startHourOfDate: '12',
//     endHourOfDate: '15',
//     perExplain: 'سه شنبه 16 اردیبهشت',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '13',
//     hourOfDate: '10',
//     minuteOfDate: '08',
//     perExplain: 'شنبه 13 اردیبهشت',
//   ),
//   address: userAddresses[userAddresses.length - 1],
//   trackingCode: '654724686314728865',
//   paymentPlan: 'نقدی - درب منزل',
//   paymentTrackingCode: '',
//   sendPrice: '15000',
// );
// // !
// Order fourthOrder = new Order(
//   code: 'B54008832',
//   receiverName: "${user.firstName ?? "کاربر"} ${user.lastName ?? "جدید"}",
//   sendMethod: 'اکسپرس بانی مد',
//   phoneNumber: '09337324560',
//   statusShopping: 'مرجوعی',
//   statusStep: 'در حال بررسی',
//   products: [
//     firstFav,
//     sixthFav,
//   ],
//   countProducts: [3, 4],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '06',
//     dayOfDate: '13',
//     startHourOfDate: '09',
//     endHourOfDate: '12',
//     perExplain: 'پنجشنبه 13 شهریور',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   address: userAddresses[0],
//   trackingCode: '654566682314900861',
//   paymentPlan: 'درگاه بانک سامان',
//   paymentTrackingCode: '189432',
//   sendPrice: '15000',
// );
// Order fifthOrder = new Order(
//   code: 'B54025644',
//   receiverName: userFriends.friends[1] != null
//       ? "${userFriends.friends[1].firstName ?? "کاربر"} ${userFriends.friends[1].lastName ?? "جدید"}"
//       : "${user.firstName} ${user.lastName}",
//   sendMethod: 'اکسپرس بانی مد',
//   phoneNumber: '09176509634',
//   statusShopping: 'مرجوعی',
//   statusStep: 'در انتظار دریافت کالای مرجوعی',
//   products: [
//     secondFav,
//     thirdFav,
//     sixthFav,
//   ],
//   countProducts: [3, 2, 3],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '13',
//     hourOfDate: '09',
//     minuteOfDate: '48',
//     perExplain: 'شنبه 13 اردیبهشت',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '16',
//     startHourOfDate: '12',
//     endHourOfDate: '15',
//     perExplain: 'سه شنبه 16 اردیبهشت',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '02',
//     dayOfDate: '13',
//     hourOfDate: '10',
//     minuteOfDate: '08',
//     perExplain: 'شنبه 13 اردیبهشت',
//   ),
//   address: userAddresses[userAddresses.length - 1],
//   trackingCode: '654724686314728865',
//   paymentPlan: 'نقدی - درب منزل',
//   paymentTrackingCode: '',
//   sendPrice: '15000',
// );
// Order sixthOrder = new Order(
//   code: 'B54008832',
//   receiverName: "${user.firstName ?? "کاربر"} ${user.lastName ?? "جدید"}",
//   sendMethod: 'اکسپرس بانی مد',
//   phoneNumber: '09337324560',
//   statusShopping: 'مرجوعی',
//   statusStep: 'به پایان رسیده',
//   products: [
//     firstFav,
//     sixthFav,
//   ],
//   countProducts: [3, 4],
//   confirmDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   recieveDate: PeriodTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '06',
//     dayOfDate: '13',
//     startHourOfDate: '09',
//     endHourOfDate: '12',
//     perExplain: 'پنجشنبه 13 شهریور',
//   ),
//   paymentDate: ExactTimeOrder(
//     yearOfDate: '99',
//     mouthOfDate: '05',
//     dayOfDate: '01',
//     hourOfDate: '20',
//     minuteOfDate: '12',
//     perExplain: 'پنجشنبه 01 مرداد',
//   ),
//   address: userAddresses[0],
//   trackingCode: '654566682314900861',
//   paymentPlan: 'درگاه بانک سامان',
//   paymentTrackingCode: '189432',
//   sendPrice: '15000',
// );
// // !
// List<Order> inProgressOrders = [];
// List<Order> compeletedOrders = [
//   firstOrder,
//   secondOrder,
// ];
// List<Order> returnedOrders = [
//   fourthOrder,
//   fifthOrder,
//   sixthOrder,
// ];
// List<Order> endedOrders = [
//   fifthOrder,
//   fourthOrder,
//   secondOrder,
// ];
