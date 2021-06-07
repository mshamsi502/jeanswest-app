// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card-about-us.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CardAboutUsData extends Equatable {
  @JsonKey(name: 'text')
  String text;
  @JsonKey(name: 'picture')
  String picture;

  CardAboutUsData({
    this.text,
    this.picture,
  });

  factory CardAboutUsData.fromJson(Map<String, dynamic> json) =>
      _$CardAboutUsDataFromJson(json);

  // Map<String, dynamic> toJson() => _$SuccessResponsToJson(this);
  Map<String, dynamic> toJson() => _$CardAboutUsDataToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'picture': picture,
    };
  }

  @override
  List<Object> get props => [
        text,
        picture,
      ];
}
