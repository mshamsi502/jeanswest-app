// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/category-translation.dart';

import 'package:json_annotation/json_annotation.dart';

part 'category-sub-group-object.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CategorySubGroupObjectRes extends Equatable {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  String value;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'priority')
  int priority;
  @JsonKey(name: 'translation')
  List<CategoryTranslationRes> translation;
  // List<CategorySubGroupTranslationRes> translation;

  CategorySubGroupObjectRes({
    this.id,
    this.code,
    this.name,
    this.value,
    this.active,
    this.priority,
    this.translation,
  });

  factory CategorySubGroupObjectRes.fromJson(Map<String, dynamic> json) =>
      _$CategorySubGroupObjectResFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySubGroupObjectResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'id': id,
      'code': code,
      'name': name,
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
        value,
        active,
        priority,
        translation,
      ];
}
