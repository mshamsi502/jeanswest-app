// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_for_branches_address.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClientForBranchesAddress implements RestClientForBranchesAddress {
  _RestClientForBranchesAddress(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://jeanswest.club';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Branch>> getBranchesAddress(lat, long) async {
    ArgumentError.checkNotNull(lat, 'lat');
    ArgumentError.checkNotNull(long, 'long');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lat': lat, r'long': long};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/v1/api/near_branch',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Branch.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
