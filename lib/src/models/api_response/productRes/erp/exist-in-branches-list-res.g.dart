// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exist-in-branches-list-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExistInBranchesListRes _$ExistInBranchesListResFromJson(
    Map<String, dynamic> json) {
  return ExistInBranchesListRes(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : BranchForProduct.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ExistInBranchesListResToJson(
        ExistInBranchesListRes instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
    };
