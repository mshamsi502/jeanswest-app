import 'package:jeanswest/src/constants/test_data/product.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/models/order/exact_time_order.dart';
import 'package:jeanswest/src/models/order/order.dart';
import 'package:jeanswest/src/models/order/period_time_order.dart';

import 'addresses.dart';
import 'friends.dart';

Order firstOrder = new Order(
  code: 'B54008832',
  receiverName: user.perName,
  phoneNumber: '09337324560',
  products: [
    firstFav,
    secondFav,
    thirdFav,
  ],
  countProducts: [1, 1, 1],
  confirmDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '05',
    dayOfDate: '01',
    hourOfDate: '20',
    minuteOfDate: '12',
    perExplain: 'پنجشنبه 01 مرداد',
  ),
  recieveDate: PeriodTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '06',
    dayOfDate: '13',
    startHourOfDate: '09',
    endHourOfDate: '12',
    perExplain: 'پنجشنبه 13 شهریور',
  ),
  paymentDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '05',
    dayOfDate: '01',
    hourOfDate: '20',
    minuteOfDate: '12',
    perExplain: 'پنجشنبه 01 مرداد',
  ),
  address: firstAddress.postAddress,
  trackingCode: '654566682314900861',
  paymentPlan: 'درگاه بانک سامان',
  paymentTrackingCode: '189432',
  sendPrice: '',
);
Order secondOrder = new Order(
  code: 'B54025644',
  receiverName: friends[1].perName,
  phoneNumber: '09176509634',
  products: [
    secondFav,
    thirdFav,
    sixthFav,
  ],
  countProducts: [3, 2, 3],
  confirmDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '02',
    dayOfDate: '13',
    hourOfDate: '09',
    minuteOfDate: '48',
    perExplain: 'شنبه 13 اردیبهشت',
  ),
  recieveDate: PeriodTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '02',
    dayOfDate: '16',
    startHourOfDate: '12',
    endHourOfDate: '15',
    perExplain: 'سه شنبه 16 اردیبهشت',
  ),
  paymentDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '02',
    dayOfDate: '13',
    hourOfDate: '10',
    minuteOfDate: '08',
    perExplain: 'شنبه 13 اردیبهشت',
  ),
  address: secondAddress.postAddress,
  trackingCode: '654724686314728865',
  paymentPlan: 'نقدی - درب منزل',
  paymentTrackingCode: '',
  sendPrice: '15000',
);
Order thirdOrder = new Order(
  code: 'B54081235',
  receiverName: user.perName,
  phoneNumber: '09337324560',
  products: [
    sixthFav,
    secondFav,
    thirdFav,
    fifthFav,
    firstFav,
  ],
  countProducts: [1, 1, 1, 1, 3],
  confirmDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '05',
    dayOfDate: '01',
    hourOfDate: '20',
    minuteOfDate: '12',
    perExplain: 'پنجشنبه 01 مرداد',
  ),
  recieveDate: PeriodTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '06',
    dayOfDate: '13',
    startHourOfDate: '09',
    endHourOfDate: '12',
    perExplain: 'پنجشنبه 13 شهریور',
  ),
  paymentDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '05',
    dayOfDate: '01',
    hourOfDate: '20',
    minuteOfDate: '12',
    perExplain: 'پنجشنبه 01 مرداد',
  ),
  address: thirdAddress.postAddress,
  trackingCode: '654566682314900861',
  paymentPlan: 'درگاه بانک سامان',
  paymentTrackingCode: '189432',
  sendPrice: '15000',
);
Order fourthOrder = new Order(
  code: 'B54008832',
  receiverName: user.perName,
  phoneNumber: '09337324560',
  products: [
    firstFav,
    sixthFav,
  ],
  countProducts: [3, 4],
  confirmDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '05',
    dayOfDate: '01',
    hourOfDate: '20',
    minuteOfDate: '12',
    perExplain: 'پنجشنبه 01 مرداد',
  ),
  recieveDate: PeriodTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '06',
    dayOfDate: '13',
    startHourOfDate: '09',
    endHourOfDate: '12',
    perExplain: 'پنجشنبه 13 شهریور',
  ),
  paymentDate: ExactTimeOrder(
    yearOfDate: '99',
    mouthOfDate: '05',
    dayOfDate: '01',
    hourOfDate: '20',
    minuteOfDate: '12',
    perExplain: 'پنجشنبه 01 مرداد',
  ),
  address: firstAddress.postAddress,
  trackingCode: '654566682314900861',
  paymentPlan: 'درگاه بانک سامان',
  paymentTrackingCode: '189432',
  sendPrice: '15000',
);
List<Order> inProgressOrders = [
  firstOrder,
  secondOrder,
  thirdOrder,
  fourthOrder,
];
List<Order> endedOrders = [
  thirdOrder,
  fourthOrder,
  secondOrder,
];
