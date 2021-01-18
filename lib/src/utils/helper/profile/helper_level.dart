// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  15:30 AM
// ****************************************************************************

import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/constants/test_data/user.dart';
import 'package:jeanswest/src/models/level_card/level_card.dart';

LevelCard userLevelProvider(int moneyBuying) {
  return moneyBuying < int.parse(goldLevel.minPay)
      ? moneyBuying < int.parse(silverLevel.minPay)
          ? moneyBuying < int.parse(blueTwoPlusLevel.minPay)
              ? moneyBuying < int.parse(bluePlusLevel.minPay)
                  ? moneyBuying < int.parse(blueLevel.minPay)
                      ? zeroLevel
                      : blueLevel
                  : bluePlusLevel
              : blueTwoPlusLevel
          : silverLevel
      : goldLevel;
}

LevelCard nextLevelProvider(LevelCard userLevel) {
  return user.moneyBuying < int.parse(blueLevel.minPay)
      ? blueLevel
      : userLevel.title == blueLevel.title
          ? bluePlusLevel
          : userLevel.title == bluePlusLevel.title
              ? blueTwoPlusLevel
              : userLevel.title == blueTwoPlusLevel.title
                  ? silverLevel
                  : userLevel.title == silverLevel.title
                      ? goldLevel
                      : userLevel;
}
