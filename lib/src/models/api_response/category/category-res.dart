// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/category/list-of-category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class CategoryRes extends Equatable {
  @JsonKey(name: 'statusCode')
  int statusCode;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  ListOfCategory data;

  CategoryRes({
    this.statusCode,
    this.message,
    this.data,
  });

  factory CategoryRes.fromJson(Map<String, dynamic> json) =>
      _$CategoryResFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'active': active,
      'statusCode': statusCode,
      'message': message,
      'data': data,
    };
  }

  @override
  List<Object> get props => [
        // active,
        statusCode,
        message,
        data,
      ];
}
