// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banimode-size-product-res.g.dart';

@JsonSerializable(nullable: true)
// ignore: must_be_immutable
class BanimodeSizeProductRes extends Equatable {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'active')
  int active;
  @JsonKey(name: 'id_size')
  int idSize;
  @JsonKey(name: 'position')
  int position;
  @JsonKey(name: 'quantity')
  int quantity;
  @JsonKey(name: 'reference')
  String reference;

  BanimodeSizeProductRes({
    this.name,
    this.active,
    this.idSize,
    this.position,
    this.quantity,
    this.reference,
  });

  factory BanimodeSizeProductRes.fromJson(Map<String, dynamic> json) =>
      _$BanimodeSizeProductResFromJson(json);

  Map<String, dynamic> toJson() => _$BanimodeSizeProductResToJson(this);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'active': active,
      'id_size': idSize,
      'position': position,
      'quantity': quantity,
      'reference': reference,
    };
  }

  @override
  List<Object> get props => [
        name,
        active,
        idSize,
        position,
        quantity,
        reference,
      ];
}
