// // *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// // *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// // *   Created Date & Time:  2021-01-01  ,  10:00 AM
// // ****************************************************************************

// //

// import 'package:jeanswest/src/models/profile/level_card/level_card.dart';

// LevelCard zeroLevel = LevelCard(
//   membership: '',
//   title: 'Zero',
//   perTitle: '',
//   minPay: '0',
//   maxPay: '200000',
//   percent: 0,
//   receiptConditions: '',
//   subtitles: [''],
//   descriptions: [''],
//   // subTitleOne: '',
//   // subTitleTwo: '',
//   // subTitleThree: '',
// );
// // //
// // LevelCard blueLevel = LevelCard(
// //   membership: 'Membership',
// //   title: 'Blue',
// //   perTitle: 'کارت عضویت آبی',
// //   minPay: '200000',
// //   maxPay: '1500000',
// //   percent: 8,
// //   receiptConditions: 'اعطای Blue Card در اولین فاکتور بالای ۲۰۰ هزار تومان',
// //   subtitles: [
// //     'دریافت ۸% خرید به‌عنوان اعتبار',
// //     'معتبر تا پایان فصل آینده',
// //     'دریافت هدیه در مناسبت‌ها',
// //     '',
// //   ],
// //   descriptions: [
// //     'دریافت ۸ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //     '',
// //     'دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //     '',
// //   ],
// //   // subTitleOne: 'دریافت ۸% خرید به‌عنوان اعتبار',
// //   // descriptionOne:
// //   //     'دریافت ۸ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //   // subTitleTwo: 'معتبر تا پایان فصل آینده',
// //   // descriptionTwo: '',
// //   // subTitleThree: 'دریافت هدیه در مناسبت‌ها',
// //   // descriptionThree:
// //   //     'دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //   // subTitleFour: '',
// //   // descriptionFour: '',
// // );
// // LevelCard bluePlusLevel = LevelCard(
// //   membership: 'Membership',
// //   title: 'Blue +',
// //   perTitle: 'کارت عضویت آبی +',
// //   minPay: '1500000',
// //   maxPay: '3000000',
// //   percent: 10,
// //   receiptConditions: 'دستیابی به سطح Blue+ با مجموعه خرید ۱,۵۰۰,۰۰۰ تومان',
// //   subtitles: [
// //     'دریافت 10% خرید به‌عنوان اعتبار',
// //     'معتبر تا پایان فصل آینده',
// //     'دریافت هدیه در مناسبت‌ها',
// //     '',
// //   ],
// //   descriptions: [
// //     'دریافت ۱۰ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //     '',
// //     'دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //     '',
// //   ],
// //   // subTitleOne: 'دریافت 10% خرید به‌عنوان اعتبار',
// //   // descriptionOne:
// //   //     'دریافت ۱۰ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //   // subTitleTwo: 'معتبر تا پایان فصل آینده',
// //   // descriptionTwo: '',
// //   // subTitleThree: 'دریافت هدیه در مناسبت‌ها',
// //   // descriptionThree:
// //   //     'دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //   // subTitleFour: '',
// //   // descriptionFour: '',
// // );
// // LevelCard blueTwoPlusLevel = LevelCard(
// //   membership: 'Membership',
// //   title: 'Blue 2+',
// //   perTitle: 'کارت عضویت آبی 2+',
// //   minPay: '3000000',
// //   maxPay: '5000000',
// //   percent: 12,
// //   receiptConditions: 'دستیابی به سطح Blue2+ با مجموعه خرید ۳,۰۰۰,۰۰۰ تومان',
// //   subtitles: [
// //     'دریافت 12% خرید به‌عنوان اعتبار',
// //     'معتبر تا پایان فصل آینده',
// //     'دریافت هدیه در مناسبت‌ها',
// //     '',
// //   ],
// //   descriptions: [
// //     'دریافت ۱۲ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //     '',
// //     'دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //     '',
// //   ],
// //   // subTitleOne: 'دریافت 12% خرید به‌عنوان اعتبار',
// //   // descriptionOne:
// //   //     'دریافت ۱۲ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //   // subTitleTwo: 'معتبر تا پایان فصل آینده',
// //   // descriptionTwo: '',
// //   // subTitleThree: 'دریافت هدیه در مناسبت‌ها',
// //   // descriptionThree:
// //   //     'دریافت هدیه در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //   // subTitleFour: '',
// //   // descriptionFour: '',
// // );

// // LevelCard silverLevel = LevelCard(
// //   membership: 'VIP',
// //   title: 'Silver',
// //   perTitle: 'کارت عضویت نقره ای',
// //   minPay: '5000000',
// //   maxPay: '15000000',
// //   percent: 15,
// //   receiptConditions: 'دریافت Silver Card با مجموعه خرید ۵,۰۰۰,۰۰۰ تومان',
// //   subtitles: [
// //     'دریافت 15% خرید به‌عنوان اعتبار',
// //     'معتبر تا پایان فصل آینده',
// //     'دریافت هدیه VIP در مناسبت‌ها',
// //     'بالاترین اولویت در اطلاع رسانی',
// //   ],
// //   descriptions: [
// //     'دریافت ۱۵ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //     '',
// //     'دریافت هدیه مشتریان VIP در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //     'بالاترین اولویت در اطلاع رسانی و خرید در شرایط ویژه فروش',
// //   ],
// //   // subTitleOne: 'دریافت 15% خرید به‌عنوان اعتبار',
// //   // descriptionOne:
// //   //     'دریافت ۱۵ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //   // subTitleTwo: 'معتبر تا پایان فصل آینده',
// //   // descriptionTwo: '',
// //   // subTitleThree: 'دریافت هدیه VIP در مناسبت‌ها',
// //   // descriptionThree:
// //   //     'دریافت هدیه مشتریان VIP در مناسبت‌های خاص به صورت اعتبار خرید (Credit)',
// //   // subTitleFour: 'بالاترین اولویت در اطلاع رسانی',
// //   // descriptionFour: 'بالاترین اولویت در اطلاع رسانی و خرید در شرایط ویژه فروش',
// // );
// // LevelCard goldLevel = LevelCard(
// //   membership: 'VIP',
// //   title: 'Gold',
// //   perTitle: 'کارت عضویت طلایی',
// //   minPay: '15000000',
// //   maxPay: '100000000000000',
// //   percent: 20,
// //   receiptConditions: 'دریافت GOLD CARD با مجموع خرید ۱۵,۰۰۰,۰۰۰ تومان',
// //   subtitles: [
// //     'دریافت 20% خرید به‌عنوان اعتبار',
// //     'معتبر تا پایان فصل آینده',
// //     'دریافت هدیه VIP در مناسبت‌ها',
// //     'بالاترین اولویت در اطلاع رسانی',
// //   ],
// //   descriptions: [
// //     'دریافت ۲۰ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //     '',
// //     'دریافت هدیه مشتریان VIP در مناسبت‌های خاص به صورت اعتبار خرید (Credit )',
// //     'بالاترین اولویت در اطلاع رسانی و خرید در شرایط ویژه فروش',
// //   ],
// //   // subTitleOne: 'دریافت 20% خرید به‌عنوان اعتبار',
// //   // descriptionOne:
// //   //     'دریافت ۲۰ درصد مبلغ خرید بصورت اعتبار (Credit) و قابل استفاده در خرید از ابتدای ماه بعدی',
// //   // subTitleTwo: 'معتبر تا پایان فصل آینده',
// //   // descriptionTwo: '',
// //   // subTitleThree: 'دریافت هدیه VIP در مناسبت‌ها',
// //   // descriptionThree:
// //   //     'دریافت هدیه مشتریان VIP در مناسبت‌های خاص به صورت اعتبار خرید (Credit )',
// //   // subTitleFour: 'بالاترین اولویت در اطلاع رسانی',
// //   // descriptionFour: 'بالاترین اولویت در اطلاع رسانی و خرید در شرایط ویژه فروش',
// // );
// // // LevelCard infinityLevel = LevelCard(
// // //   membership: '',
// // //   title: 'Infinity',
// // //   minPay: '100000000000000',
// // //   maxPay: '100000000000000',
// // //   receiptConditions: '',
// // //   subTitleOne: '',
// // //   descriptionOne: '',
// // //   subTitleTwo: '',
// // //   descriptionTwo: '',
// // //   subTitleThree: '',
// // //   descriptionThree: '',
// // //   subTitleFour: '',
// // //   descriptionFour: '',
// // // );

// // List<LevelCard> levels = [
// //   // zeroLevel,
// //   //
// //   blueLevel,
// //   bluePlusLevel,
// //   blueTwoPlusLevel,
// //   silverLevel,
// //   goldLevel,
// //   //
// //   // infinityLevel,
// // ];
// // List<MainLevelCard> mainLevels = [
// //   MainLevelCard(
// //     perMainName: "کارت عضویت آبی",
// //     engMainName: "Blue Card",
// //     text: "کارت عضویت آبی جین وست شامل سه سطح است که بصورت زیر ارائه می گردد:",
// //     levels: [
// //       blueLevel,
// //       bluePlusLevel,
// //       blueTwoPlusLevel,
// //     ],
// //   ),
// //   MainLevelCard(
// //     perMainName: "کارت عضویت نقره ای",
// //     engMainName: "ُSilver Card",
// //     text:
// //         "کارت عضویت نقره ای جین وست پس از دریافت کارت آبی به مشتری جین وست اعطا می گردد و دارای شرایط زیر است.",
// //     levels: [silverLevel],
// //   ),
// //   MainLevelCard(
// //     perMainName: "کارت عضویت طلایی",
// //     engMainName: "Gold Card",
// //     text:
// //         "کارت عضویت طلایی جین وست پس از دریافت کارت نقره ای به مشتری جین وست اعطا می گردد و دارای شرایط زیر است",
// //     levels: [goldLevel],
// //   ),
// // ];
// // //
// // List<String> assetsLevelCard = [
// //   'assets/images/png_images/profile/levelCards/blue-card-more.png',
// //   'assets/images/png_images/profile/levelCards/silver-card-more.png',
// //   'assets/images/png_images/profile/levelCards/gold-card-more.png',
// // ];
