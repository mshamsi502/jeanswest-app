// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/utils/helper/global/convertation-helper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class MessageData extends Equatable {
  @JsonKey(name: 'code')
  int code;
  @JsonKey(name: 'engTitle')
  String engTitle;
  @JsonKey(name: 'perTitle')
  String perTitle;
  @JsonKey(name: 'engSender')
  String engSender;
  @JsonKey(name: 'perSender')
  String perSender;
  @JsonKey(name: 'pictureAssets')
  String pictureAssets;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'description')
  List<String> description;
  @JsonKey(name: 'price')
  int price;
  @JsonKey(name: 'minShopping')
  int minShopping;
  @JsonKey(name: 'perCategory')
  List<String> perCategory;
  @JsonKey(name: 'engCategory')
  List<String> engCategory;
  @JsonKey(name: 'startDate')
  String startDate;

  String startGeoYear;
  String startGeoMonth;
  String startGeoDay;
  //
  Map<String, String> startShamsiDate;
  String startShamsiYear;
  String startShamsiMonth;
  String startShamsiDay;
  //
  @JsonKey(name: 'endDate')
  String endDate;

  String endGeoYear;
  String endGeoMonth;
  String endGeoDay;
  //
  Map<String, String> endShamsiDate;
  String endShamsiYear;
  String endShamsiMonth;
  String endShamsiDay;

  //
  @JsonKey(name: 'sendDate')
  String sendDate;

  String sendGeoYear;
  String sendGeoMonth;
  String sendGeoDay;
  //
  Map<String, String> sendShamsiDate;
  String sendShamsiYear;
  String sendShamsiMonth;
  String sendShamsiDay;
  //
  String sendHour;
  String sendMinute;
  String sendSecond;

  //
  bool isReaded = false;

  MessageData({
    this.code,
    this.engTitle,
    this.perTitle,
    this.engSender,
    this.perSender,
    this.pictureAssets,
    this.text,
    this.description,
    this.price,
    this.minShopping,
    this.engCategory,
    this.perCategory,
    this.startDate,
    this.endDate,
    this.sendDate,
  }) {
    isReaded = false;
    // ! Start
    startGeoYear = stringSplitDate(this.startDate)['year'];
    startGeoMonth = stringSplitDate(this.startDate)['month'];
    startGeoDay = stringSplitDate(this.startDate)['day'];
    startShamsiDate = gregorianToShamsi({
      'year': startGeoYear,
      'month': startGeoMonth,
      'day': startGeoDay,
    });
    startShamsiYear = startShamsiDate['year'];
    startShamsiMonth = startShamsiDate['month'];
    startShamsiDay = startShamsiDate['day'];
    // ! End
    endGeoYear = stringSplitDate(this.endDate)['year'];
    endGeoMonth = stringSplitDate(this.endDate)['month'];
    endGeoDay = stringSplitDate(this.endDate)['day'];
    //
    endShamsiDate = gregorianToShamsi({
      'year': endGeoYear,
      'month': endGeoMonth,
      'day': endGeoDay,
    });
    endShamsiYear = endShamsiDate['year'];
    endShamsiMonth = endShamsiDate['month'];
    endShamsiDay = endShamsiDate['day'];

    // ! Send
    sendGeoYear = stringSplitDate(this.sendDate)['year'];
    sendGeoMonth = stringSplitDate(this.sendDate)['month'];
    sendGeoDay = stringSplitDate(this.sendDate)['day'];
    sendHour = stringSplitDate(this.sendDate)['hour'];
    sendMinute = stringSplitDate(this.sendDate)['min'];
    sendSecond = stringSplitDate(this.sendDate)['sec'];
    //
    sendShamsiDate = gregorianToShamsi({
      'year': sendGeoYear,
      'month': sendGeoMonth,
      'day': sendGeoDay,
    });
    sendShamsiYear = sendShamsiDate['year'];
    sendShamsiMonth = sendShamsiDate['month'];
    sendShamsiDay = sendShamsiDate['day'];
  }

  factory MessageData.fromJson(Map<String, dynamic> json) =>
      _$MessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'engTitle': engTitle,
      'perTitle': perTitle,
      'engSender': engSender,
      'perSender': perSender,
      'pictureAssets': pictureAssets,
      'text': text,
      'description': description,
      'price': price,
      'minShopping': minShopping,
      'engCategory': engCategory,
      'perCategory': perCategory,
      'startDate': startDate,
      'endDate': endDate,
      'sendDate': sendDate,
    };
  }

  @override
  List<Object> get props => [
        code,
        engTitle,
        perTitle,
        engSender,
        perSender,
        pictureAssets,
        text,
        description,
        price,
        minShopping,
        engCategory,
        perCategory,
        startDate,
        endDate,
        sendDate,
      ];
}
