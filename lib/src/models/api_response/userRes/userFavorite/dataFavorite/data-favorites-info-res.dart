// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:jeanswest/src/models/api_response/productRes/single-product-info-res.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data-favorites-info-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class DataFavoriteInfoRes extends Equatable {
  @JsonKey(name: 'result')
  List<SingleProductInfoRes> result;
  @JsonKey(name: 'page')
  int page;
  @JsonKey(name: 'perPage')
  int perPage;
  @JsonKey(name: 'total')
  int total;

  DataFavoriteInfoRes({
    this.result,
    this.page,
    this.perPage,
    this.total,
  });

  factory DataFavoriteInfoRes.fromJson(Map<String, dynamic> json) =>
      _$DataFavoriteInfoResFromJson(json);

  Map<String, dynamic> toJson() => _$DataFavoriteInfoResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'result': result,
      'page': page,
      'perPage': perPage,
      'total': total,
    };
  }

  @override
  List<Object> get props => [
        result,
        page,
        perPage,
        total,
      ];
}
