// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:jeanswest/src/models/api_response/globalRes/aboutUs/data/card-about-us.dart';

part 'about-us-data.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class AboutUsData extends Equatable {
  @JsonKey(name: 'banner')
  CardAboutUsData banner;
  @JsonKey(name: 'cards')
  List<CardAboutUsData> cards;

  AboutUsData({
    this.banner,
    this.cards,
  });

  factory AboutUsData.fromJson(Map<String, dynamic> json) =>
      _$AboutUsDataFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$AboutUsDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': banner,
      'cards': cards,
    };
  }

  @override
  List<Object> get props => [
        banner,
        cards,
      ];
}
