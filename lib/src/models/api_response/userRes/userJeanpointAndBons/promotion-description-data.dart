// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'promotion-description-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class PromotionDescriptionData extends Equatable {
  @JsonKey(name: 'context')
  String context;
  @JsonKey(name: 'message')
  String message;

  PromotionDescriptionData({
    this.context,
    this.message,
  });

  factory PromotionDescriptionData.fromJson(Map<String, dynamic> json) =>
      _$PromotionDescriptionDataFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionDescriptionDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'context': context,
      'message': message,
    };
  }

  @override
  List<Object> get props => [
        context,
        message,
      ];
}
