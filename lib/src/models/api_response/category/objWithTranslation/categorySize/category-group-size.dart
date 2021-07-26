// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/category-translation.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/categorySize/category-sub-group-size.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category-group-size.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CategoryGroupSizeRes extends Equatable {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'code')
  String code;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'value')
  List<CategorySubGroupSizeRes> value;
  @JsonKey(name: 'active')
  bool active;
  @JsonKey(name: 'priority')
  int priority;
  @JsonKey(name: 'translation')
  List<CategoryTranslationRes> translation;

  CategoryGroupSizeRes({
    this.id,
    this.code,
    this.name,
    this.value,
    this.active,
    this.priority,
    this.translation,
  });

  factory CategoryGroupSizeRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryGroupSizeResFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryGroupSizeResToJson(this);

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
