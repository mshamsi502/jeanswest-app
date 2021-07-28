// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/category-translation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'category-color.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CategoryColorRes extends Equatable {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'color')
  String color;
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'value')
  List<String> value;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'priority')
  int priority;
  @JsonKey(name: 'translation')
  List<CategoryTranslationRes> translation;

  CategoryColorRes({
    this.id,
    this.code,
    this.name,
    this.color,
    this.image,
    this.value,
    this.active,
    this.priority,
    this.translation,
  });

  factory CategoryColorRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryColorResFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryColorResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'id': id,
      'code': code,
      'name': name,
      'color': color,
      'image': image,
      'value': value,
      'active': active,
      'priority': priority,
      'translation': translation,
    };
  }

  @override
  List<Object> get props => [
        id,
        code,
        name,
        color,
        image,
        value,
        active,
        priority,
        translation,
      ];
}
