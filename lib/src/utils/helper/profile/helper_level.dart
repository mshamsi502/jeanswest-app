// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-10  ,  15:30 AM
// ****************************************************************************
import 'package:flutter/material.dart';
import 'package:jeanswest/src/constants/global/globalInstances/level-cards-data.dart';
// import 'package:jeanswest/src/constants/test_data/levels_card.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/single-level-card.dart';
// import 'package:jeanswest/src/models/profile/level_card/level_card.dart';
import 'package:jeanswest/src/utils/helper/global/strings-validtion-helper.dart';

SingleLevelCard userLevelProvider(
    {int moneyBuying, List<SingleLevelCard> cardsInfo}) {
  print(moneyBuying);

  for (SingleLevelCard chekingCard in cardsInfo.reversed) {
    if (moneyBuying > chekingCard.minPay) {
      return chekingCard;
    }
  }
  return zeroLevelCard;
  // return (moneyBuying < int.parse(goldLevel.minPay))
  //     ? (moneyBuying < int.parse(silverLevel.minPay))
  //         ? (moneyBuying < int.parse(blueTwoPlusLevel.minPay))
  //             ? (moneyBuying < int.parse(bluePlusLevel.minPay))
  //                 ? (moneyBuying < int.parse(blueLevel.minPay))
  //                     ? zeroLevel
  //                     : blueLevel
  //                 : bluePlusLevel
  //             : blueTwoPlusLevel
  //         : silverLevel
  //     : goldLevel;
}

SingleLevelCard nextLevelProvider(
    {SingleLevelCard userLevel, List<SingleLevelCard> cardsInfo}) {
  int index = 0;
  for (SingleLevelCard chekingCard in cardsInfo) {
    if (userLevel.id == zeroLevelCard.id) {
      return cardsInfo[index];
    }
    index++;
    if (userLevel.id == chekingCard.id) {
      return cardsInfo[index];
    }
  }
  return cardsInfo[cardsInfo.length];
}
// LevelCard nextLevelProvider(LevelCard userLevel) {
//   return userPayment.payToman < int.parse(blueLevel.minPay)
//       ? blueLevel
//       : userLevel.title == blueLevel.title
//           ? bluePlusLevel
//           : userLevel.title == bluePlusLevel.title
//               ? blueTwoPlusLevel
//               : userLevel.title == blueTwoPlusLevel.title
//                   ? silverLevel
//                   : userLevel.title == silverLevel.title
//                       ? goldLevel
//                       : userLevel;
// }

Map<String, dynamic> prepareMainCards({
  @required List<SingleLevelCard> levelCards,
  // @required Size screenSize,
}) {
  List<int> _index = [];
  int _someCards = 0;
  // ignore: deprecated_member_use
  List<String> _mainAssetsLevelCard = new List<String>();
  // ignore: deprecated_member_use
  List<String> _mainTitleLevelCard = new List<String>();
  // ignore: deprecated_member_use
  List<String> _mainTextLevelCard = new List<String>();
  // ignore: deprecated_member_use
  List<int> _someSubCards = new List<int>();
  // ignore: deprecated_member_use
  List<String> _imageType = new List<String>();
  _someSubCards.add(0);
  _someSubCards.add(0);
  _someSubCards.add(0);
  bool _isCountBlue = false;
  bool _isCountSilver = false;
  bool _isCountGold = false;

  for (int i = 0; i < levelCards.length; i++) {
    if (((levelCards[i].engTitle)
        .contains(RegExp(r'blue', caseSensitive: false)))) {
      if (!_isCountBlue) {
        _someCards++;
        _mainAssetsLevelCard.add(levelCards[i].image);
        _imageType.add(getTypeFileLink(levelCards[i].image));
        _mainTitleLevelCard.add("کارت عضویت آبی");
        _mainTextLevelCard.add(levelCards[i].text);
        _isCountBlue = true;
      }
      _someSubCards[0] = _someSubCards[0] + 1;
    }
    if (((levelCards[i].engTitle)
        .contains(RegExp(r'silver', caseSensitive: false)))) {
      if (!_isCountSilver) {
        _someCards++;
        _mainAssetsLevelCard.add(levelCards[i].image);
        _imageType.add(getTypeFileLink(levelCards[i].image));
        _mainTitleLevelCard.add(levelCards[i].perTitle);
        _mainTextLevelCard.add(levelCards[i].text);
        _isCountSilver = true;
      }
      _someSubCards[1] = _someSubCards[1] + 1;
    }
    if (((levelCards[i].engTitle)
        .contains(RegExp(r'gold', caseSensitive: false)))) {
      if (!_isCountGold) {
        _someCards++;
        _mainAssetsLevelCard.add(levelCards[i].image);
        _imageType.add(getTypeFileLink(levelCards[i].image));
        _mainTitleLevelCard.add(levelCards[i].perTitle);
        _mainTextLevelCard.add(levelCards[i].text);
        _isCountGold = true;
      }
      _someSubCards[2] = _someSubCards[2] + 1;
    }
  }

  for (var i = 0; i < _someCards; i++) _index.add(i);
  // Map<String, dynamic> _cardSizes = createSizedCards(
  //   someCards: _someCards,
  //   showingCard: 0,
  //   // screenSize: screenSize,
  // );

  // print("someCards : $_someCards");
  // print("mainTitleLevelCard : $_mainTitleLevelCard");
  // print("mainAssetsLevelCard : $_mainAssetsLevelCard");
  // print("mainTextLevelCard : $_mainTextLevelCard");
  // print("someSubCards : $_someSubCards");
  // print("imageType : $_imageType");
  // print("largeHeights : ${_cardSizes["largeHeights"]}");
  // print("largeWidths : ${_cardSizes["largeWidths"]}");

  return {
    "someCards": _someCards,
    "mainTitleLevelCard": _mainTitleLevelCard,
    "mainAssetsLevelCard": _mainAssetsLevelCard,
    "mainTextLevelCard": _mainTextLevelCard,
    "someSubCards": _someSubCards,
    "imageType": _imageType,
    // "largeHeights": _cardSizes["largeHeights"],
    // "largeWidths": _cardSizes["largeWidths"],
  };
}

Map<String, dynamic> createSizedCards({
  int someCards,
  int showingCard,
  Size screenSize,
}) {
  // ignore: deprecated_member_use
  List<double> _largeWidths = new List<double>();
  // ignore: deprecated_member_use
  List<double> _largeHeights = new List<double>();
  for (int i = 0; i < someCards; i++) {
    if (i == showingCard) {
      _largeWidths.add((screenSize.width / 2.25) -
          (0.054 * screenSize.width //20
          ));
      _largeHeights.add(0.2027 * screenSize.height //120,
          );
    } else {
      _largeWidths.add((screenSize.width / 3.5));
      _largeHeights.add(0.15625 * screenSize.height //100,
          );
    }
  }
  return {
    "largeHeights": _largeHeights,
    "largeWidths": _largeWidths,
  };
}
