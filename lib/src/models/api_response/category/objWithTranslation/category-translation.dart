// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category-translation.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CategoryTranslationRes extends Equatable {
  @JsonKey(name: 'language')
  String language;
  @JsonKey(name: 'value')
  String value;

  CategoryTranslationRes({
    this.language,
    this.value,
  });

  factory CategoryTranslationRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryTranslationResFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryTranslationResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'language': language,
      'value': value,
    };
  }

  @override
  List<Object> get props => [
        language,
        value,
      ];
}
