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
  Future<OTPReqResponse> reqOtp(map) async {
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
    final value = OTPReqResponse.fromJson(_result.data);
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
        'http://10.0.1.111:8000/api/v1/customer/myCustomer',
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
  Future<UserTblPosCustRes> getUserErp(mobile) async {
    ArgumentError.checkNotNull(mobile, 'mobile');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(mobile ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/erp/user/user',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserTblPosCustRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserMainInfoRes> updateUserMainInfo(newUser) async {
    ArgumentError.checkNotNull(newUser, 'newUser');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newUser ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/customer/updateMyCustomer',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserMainInfoRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserMainInfoRes> getMockUserMainInfo() async {
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
  Future<UserTblPosCustRes> getMockUserErp() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserTblPosCustRes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserTblPosCustRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserPaymentInfoRes> getUserPaymentInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/customer/myCustomerMembershipLevel',
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
  Future<UserPaymentInfoRes> getMockUserPaymentInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserPaymentInfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserPaymentInfoRes.fromJson(_result.data);
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
  Future<GeneralRespons> sendInviteFriendLink(friendMobile) async {
    ArgumentError.checkNotNull(friendMobile, 'friendMobile');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(friendMobile ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/customer/sendInviteLink',
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
  Future<FAQRes> getInviteFriendFAQ() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/inviteFriendsFAQ/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FAQRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserFavoriteInfoRes> getUserFavoriteInfo(tblPosCustomersID) async {
    ArgumentError.checkNotNull(tblPosCustomersID, 'tblPosCustomersID');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(tblPosCustomersID ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/favorite/list',
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
  Future<GeneralRespons> removeFromUserFavorite(barcode) async {
    ArgumentError.checkNotNull(barcode, 'barcode');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(barcode ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/favorite/remove',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralRespons.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralRespons> addToUserFavorite(barcode) async {
    ArgumentError.checkNotNull(barcode, 'barcode');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(barcode ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/favorite/add',
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
  Future<UserFavoriteInfoRes> getMockUserFavoriteInfo() async {
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
  Future<UserJeanpointsRes> getUserJeanpointBonsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/promotion/point/customer/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserJeanpointsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserJeanpointsRes> getMockUserJeanpointBonsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3003/v1/getUserJeanpointBons',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserJeanpointsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserOrderDataRes> getUserOrdersInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3006/v1/getUserOrders',
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
  Future<UserTicketsRes> getUserTicketsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/ticket/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserTicketsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<CreateTicketRes> createUserTicketsInfo(newTicket) async {
    ArgumentError.checkNotNull(newTicket, 'newTicket');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newTicket ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/ticket/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CreateTicketRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<CreateTicketRes> replyTicketsInfo(newMessage) async {
    ArgumentError.checkNotNull(newMessage, 'newMessage');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newMessage ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/ticket/reply',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CreateTicketRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralRespons> closeTicketsInfo(ticketId) async {
    ArgumentError.checkNotNull(ticketId, 'ticketId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(ticketId ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/ticket/close',
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
  Future<UserTicketsRes> getMockUserTicketsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3006/api/v1/ticket/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserTicketsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserMessageRes> getUserMessagesInfo(body) async {
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/notification/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserMessageRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserMessageRes> getMockUserMessagesInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3006/v1/getUserMessages',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserMessageRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UserAddressesInfoRes> getMockUserAddressesInfo() async {
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
  Future<UserAddressesInfoRes> getUserAddressesInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/address/list',
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
  Future<GeneralRespons> addToUserAddressesInfo(address) async {
    ArgumentError.checkNotNull(address, 'address');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(address ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/address/create',
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
  Future<GeneralRespons> editUserAddressesInfo(address) async {
    ArgumentError.checkNotNull(address, 'address');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(address ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/address/edit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PATCH',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralRespons.fromJson(_result.data);
    return value;
  }

  @override
  Future<GeneralRespons> deleteUserAddressesInfo(code) async {
    ArgumentError.checkNotNull(code, 'code');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(code ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/address/remove',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GeneralRespons.fromJson(_result.data);
    return value;
  }

  @override
  Future<ContactUsRes> getContactUsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/contactUs/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ContactUsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<FAQRes> getFAQInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/faq/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FAQRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<AboutUsRes> getAboutUsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/aboutUs/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AboutUsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<ReturnPolicyRes> getReturnPolicyInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/returnPolicy/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ReturnPolicyRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<FAQRes> getMockFAQInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3006/api/v1/faq/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FAQRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<ContactUsRes> getMockContactUsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.1.2.94:3005/api/v1/contact-us/contact-info',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ContactUsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<LevelCardsRes> getLevelCardsInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/membershipLevelCards/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LevelCardsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<AllProvince> getAllProvinceInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/logistic/states',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AllProvince.fromJson(_result.data);
    return value;
  }

  @override
  Future<AllCity> getAllCityInfo(idState) async {
    ArgumentError.checkNotNull(idState, 'idState');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(idState ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/logistic/cities',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AllCity.fromJson(_result.data);
    return value;
  }

  @override
  Future<AllDistrict> getAllDistrictInfo(idCity) async {
    ArgumentError.checkNotNull(idCity, 'idCity');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(idCity ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/logistic/districts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AllDistrict.fromJson(_result.data);
    return value;
  }

  @override
  Future<ListOfProductsRes> getProductList(filter) async {
    ArgumentError.checkNotNull(filter, 'filter');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(filter ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/product/list',
        // '/v1/product/oldList',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ListOfProductsRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<CategoryRes> getAllCategory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/category/oldList',
        // 'v1/category/oldLlist',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CategoryRes.fromJson(_result.data);
    return value;
  }

  @override
  Future<ExistInBranchesListRes> getExistInBranches(barcode) async {
    ArgumentError.checkNotNull(barcode, 'barcode');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(barcode ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'http://10.0.1.111:8000/api/v1/erp/product/getProductsAvailabilityInBranches',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ExistInBranchesListRes.fromJson(_result.data);
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
