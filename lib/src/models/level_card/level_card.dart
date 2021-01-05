// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level_card.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class LevelCard extends Equatable {
  @JsonKey(name: 'Membership')
  String membership;

  @JsonKey(name: 'Title')
  String title;

  @JsonKey(name: 'PerTitle')
  String perTitle;

  @JsonKey(name: 'MinPay')
  String minPay;

  @JsonKey(name: 'MaxPay')
  String maxPay;

  @JsonKey(name: 'ReceiptConditions')
  String receiptConditions;

  @JsonKey(name: 'SubTitleOne')
  String subTitleOne;

  @JsonKey(name: 'DescriptionOne')
  String descriptionOne;

  @JsonKey(name: 'SubTitleTwo')
  String subTitleTwo;

  @JsonKey(name: 'DescriptionTwo')
  String descriptionTwo;

  @JsonKey(name: 'SubTitleThree')
  String subTitleThree;

  @JsonKey(name: 'DescriptionThree')
  String descriptionThree;

  @JsonKey(name: 'SubTitleFour')
  String subTitleFour;

  @JsonKey(name: 'DescriptionFour')
  String descriptionFour;

  LevelCard({
    this.membership,
    this.title,
    this.perTitle,
    this.minPay,
    this.maxPay,
    this.receiptConditions,
    this.subTitleOne,
    this.descriptionOne,
    this.subTitleTwo,
    this.descriptionTwo,
    this.subTitleThree,
    this.descriptionThree,
    this.subTitleFour,
    this.descriptionFour,
  });

  factory LevelCard.fromJson(Map<String, dynamic> json) =>
      _$LevelCardFromJson(json);

  Map<String, dynamic> toJson() => _$LevelCardToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Membership': membership,
      'Title': title,
      'PerTitle': perTitle,
      'MinPay': minPay,
      'MaxPay': maxPay,
      'ReceiptConditions': receiptConditions,
      'SubTitleOne': subTitleOne,
      'DescriptionOne': descriptionOne,
      'SubTitleTwo': subTitleTwo,
      'DescriptionTwo': descriptionTwo,
      'SubTitleThree': subTitleThree,
      'DescriptionThree': descriptionThree,
      'SubTitleFour': subTitleFour,
      'DescriptionFour': descriptionFour,
    };
  }

  @override
  List<Object> get props => [
        membership,
        title,
        perTitle,
        minPay,
        maxPay,
        receiptConditions,
        subTitleOne,
        descriptionOne,
        subTitleTwo,
        descriptionTwo,
        subTitleThree,
        descriptionThree,
        subTitleFour,
        descriptionFour,
      ];
}
