// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:jeanswest/src/models/api_response/globalRes/levelCards/level-cards-data.dart';

part 'level-cards-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class LevelCardsRes extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  LevelCardsData data;

  LevelCardsRes({
    this.statusCode,
    this.message,
    this.data,
  });

  factory LevelCardsRes.fromJson(Map<String, dynamic> json) =>
      _$LevelCardsResFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$LevelCardsResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        statusCode,
        message,
        data,
      ];
}
