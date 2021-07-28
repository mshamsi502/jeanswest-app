// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/category-object.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/categoryColor/category-color.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/categorySize/category-group-size.dart';
import 'package:jeanswest/src/models/api_response/category/objWithTranslation/categorySubGroup/category-sub-group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list-of-category.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class ListOfCategory extends Equatable {
  @JsonKey(name: 'group')
  List<CategoryObjectRes> group;
  @JsonKey(name: 'subGroup')
  List<CategorySubGroupRes> subGroup;
  @JsonKey(name: 'size')
  List<CategoryGroupSizeRes> size;
  @JsonKey(name: 'gender')
  List<CategoryObjectRes> gender;
  @JsonKey(name: 'ageGroup')
  List<CategoryObjectRes> ageGroup;
  @JsonKey(name: 'colorFamily')
  List<CategoryColorRes> colorFamily;

  ListOfCategory({
    this.group,
    this.subGroup,
    this.size,
    this.gender,
    this.ageGroup,
    this.colorFamily,
  });

  factory ListOfCategory.fromJson(Map<String, dynamic> json) =>
      _$ListOfCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ListOfCategoryToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'group': group,
      'subGroup': subGroup,
      'size': size,
      'gender': gender,
      'ageGroup': ageGroup,
      'colorFamily': colorFamily,
    };
  }

  @override
  List<Object> get props => [
        group,
        subGroup,
        size,
        gender,
        ageGroup,
        colorFamily,
      ];
}
