// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_and_get_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginAndGetToken _$LoginAndGetTokenFromJson(Map<String, dynamic> json) {
  return LoginAndGetToken(
    success: json['success'] as bool,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$LoginAndGetTokenToJson(LoginAndGetToken instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
    };
