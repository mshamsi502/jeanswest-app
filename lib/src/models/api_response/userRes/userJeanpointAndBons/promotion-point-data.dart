// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/promotion-description-data.dart';
part 'promotion-point-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class PromotionPointData extends Equatable {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'description')
  PromotionDescriptionData description;

  PromotionPointData({
    this.name,
    this.description,
  });

  factory PromotionPointData.fromJson(Map<String, dynamic> json) =>
      _$PromotionPointDataFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionPointDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
    };
  }

  @override
  List<Object> get props => [
        name,
        description,
      ];
}
