// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Branches _$BranchesFromJson(Map<String, dynamic> json) {
  return Branches(
    branches: (json['branches'] as List)
        ?.map((e) =>
            e == null ? null : Branch.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BranchesToJson(Branches instance) => <String, dynamic>{
      'branches': instance.branches,
    };
