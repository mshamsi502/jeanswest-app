// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_unauth.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UnAuthRestClient implements UnAuthRestClient {
  _UnAuthRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://10.0.1.111:5000';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<GlobalResponseJData> reqOtp(map) async {
    ArgumentError.checkNotNull(map, 'map');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/otp/request',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GlobalResponseJData.fromJson(_result.data);
    return value;
  }

  @override
  Future<AuthRes> reqAuth(map) async {
    ArgumentError.checkNotNull(map, 'map');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/account/authentication',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AuthRes.fromJson(_result.data);
    return value;
  }
}
