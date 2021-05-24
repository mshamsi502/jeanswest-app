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
  @JsonKey(name: 'membership')
  String membership;
  @JsonKey(name: 'engtitle')
  String engtitle;
  @JsonKey(name: 'perTitle')
  String perTitle;
  @JsonKey(name: 'minPay')
  int minPay;
  @JsonKey(name: 'maxPay')
  int maxPay;
  @JsonKey(name: 'receiptConditions')
  String receiptConditions;
  @JsonKey(name: 'subTitles')
  List<String> subTitles;
  @JsonKey(name: 'descriptions')
  List<String> descriptions;

  SingleLevelCard({
    this.membership,
    this.engtitle,
    this.perTitle,
    this.minPay,
    this.maxPay,
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
      'membership': membership,
      'engtitle': engtitle,
      'perTitle': perTitle,
      'minPay': minPay,
      'maxPay': maxPay,
      'receiptConditions': receiptConditions,
      'subTitles': subTitles,
      'descriptions': descriptions,
    };
  }

  @override
  List<Object> get props => [
        membership,
        engtitle,
        perTitle,
        minPay,
        maxPay,
        receiptConditions,
        subTitles,
        descriptions,
      ];
}
