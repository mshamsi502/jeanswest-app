// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_global.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GlobalRestClient implements GlobalRestClient {
  _GlobalRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://10.0.2.2:3001';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Branch>> getBranchesAddress2(lat, long) async {
    ArgumentError.checkNotNull(lat, 'lat');
    ArgumentError.checkNotNull(long, 'long');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lat': lat, r'long': long};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/v1/getBranches',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Branch.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<SuccessRespons> postLogin(phoneNumber) async {
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'phoneNumber': phoneNumber};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/v1/login2',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SuccessRespons.fromJson(_result.data);
    return value;
  }

  @override
  Future<LoginAndGetToken> postVerifyCode(phoneNumber, verifyCode) async {
    ArgumentError.checkNotNull(phoneNumber, 'phoneNumber');
    ArgumentError.checkNotNull(verifyCode, 'verifyCode');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'phoneNumber': phoneNumber, 'verifyCode': verifyCode};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('/v1/verifyCode',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginAndGetToken.fromJson(_result.data);
    return value;
  }
}
