// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single-level-card.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class SingleLevelCard extends Equatable {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'engtitle')
  String engTitle;
  @JsonKey(name: 'perTitle')
  String perTitle;
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'membership')
  String membership;
  @JsonKey(name: 'minPay')
  int minPay;
  @JsonKey(name: 'maxPay')
  int maxPay;
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'percent')
  int percent;
  @JsonKey(name: 'receiptConditions')
  String receiptConditions;
  @JsonKey(name: 'subTitles')
  List<String> subTitles;
  @JsonKey(name: 'descriptions')
  List<String> descriptions;

  SingleLevelCard({
    this.id,
    this.active,
    this.title,
    this.engTitle,
    this.perTitle,
    this.image,
    this.membership,
    this.minPay,
    this.maxPay,
    this.text,
    this.percent,
    this.receiptConditions,
    this.subTitles,
    this.descriptions,
  });

  factory SingleLevelCard.fromJson(Map<String, dynamic> json) =>
      _$SingleLevelCardFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$SingleLevelCardToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'active': active,
      'title': title,
      'engtitle': engTitle,
      'perTitle': perTitle,
      'membership': membership,
      'image': image,
      'minPay': minPay,
      'maxPay': maxPay,
      'text': text,
      'percent': percent,
      'receiptConditions': receiptConditions,
      'subTitles': subTitles,
      'descriptions': descriptions,
    };
  }

  @override
  List<Object> get props => [
        id,
        active,
        title,
        engTitle,
        perTitle,
        membership,
        image,
        minPay,
        maxPay,
        text,
        percent,
        receiptConditions,
        subTitles,
        descriptions,
      ];
}
