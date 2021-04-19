// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client_global.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GlobalRestClient implements GlobalRestClient {
  _GlobalRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
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
    final _result = await _dio.request<List<dynamic>>(
        'http://10.1.2.94:3001/v1/getBranches',
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
  Future<List<Branch>> getBranchesAddressOldClub(lat, long) async {
    ArgumentError.checkNotNull(lat, 'lat');
    ArgumentError.checkNotNull(long, 'long');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lat': lat, r'long': long};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        'https://jeanswest.club/v1/api/near_branch',
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

  @override
  Future<GeneralRespons> reqOtp(map) async {
    ArgumentError.checkNotNull(map, 'map');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/otp/request',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralRespons.fromJson(_result.data);
    return value;
  }

  @override
  Future<AuthReqRespons> reqAuth(map) async {
    ArgumentError.checkNotNull(map, 'map');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(map ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/customerAuth',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AuthReqRespons.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserMainInfoRes> getUserMainInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserMainInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserMainInfoRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserInviteInfoRes> getUserInviteInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserInviteInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserInviteInfoRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserFriendsInfoRes> getUserFriendsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserFriendsInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserFriendsInfoRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserPaymentInfoRes> getUserPaymentInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserPaymentInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserPaymentInfoRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserAddressesInfoRes> getUserAddressesInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserAddressesInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserAddressesInfoRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserFavoriteInfoRes> getUserFavoriteInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserFavorite',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserFavoriteInfoRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserOrderDataRes> getUserOrdersInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserOrders',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserOrderDataRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListOfProductsRes> getAddToCardProductDetailInfo(barcode) async {
    ArgumentError.checkNotNull(barcode, 'barcode');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'barcode': barcode};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3002/v1/getAddToCardProductDetail',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListOfProductsRes.fromJson(_result.data);
    return value;
  }
}
