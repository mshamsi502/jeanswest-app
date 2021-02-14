// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login-and-get-token-res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAndGetTokenRes _$LoginAndGetTokenResFromJson(Map<String, dynamic> json) {
  return LoginAndGetTokenRes(
    success: json['success'] as bool,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$LoginAndGetTokenResToJson(
        LoginAndGetTokenRes instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
    };
