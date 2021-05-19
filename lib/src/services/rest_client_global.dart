// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/size_constants.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/contactUs/contact-us-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/faq/faq-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/level-cards-res.dart';

import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/otp-req-response.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/auth-req-response.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFavorite/user-favorite-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/user-jeanpoints-response.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userTblPosCust/user-tbl-pos-cust-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/user-order-data-res.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';
// import 'package:jeanswest/src/models/api_response/userRes/userMain/UserTblPosCust/user-tbl-pos-cust-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userInvite/user-invite-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/user-tickets-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFriends/user-friends-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/user-addresses-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMessages/user-messages-info-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-province.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-district.dart';
import 'package:jeanswest/src/services/rest-client.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_global.g.dart';

// @RestApi(baseUrl: BASE_URL_FOR_BRANCH_ADDRESS)
// @RestApi(baseUrl: BASE_URL_FOR_MOCKOON)
@RestApi(baseUrl: "")
abstract class GlobalRestClient extends RestClient {
  /// pre setting dio
  /// [dio] auto set in service_locator.dart file and
  /// optional named parameter [baseUrl] if you want change base url
  factory GlobalRestClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: RECEIVE_TIMEOUT, connectTimeout: CONNECT_TIMEOUT);
    return _GlobalRestClient(dio, baseUrl: baseUrl);
  }

  // ***************************************************************************
  // # BRANCH ******************************************************************

  // !
  @POST('http://10.1.2.94:3001/v1/getBranches') // ! Mockoon
  Future<List<Branch>> getBranchesAddress(
      @Query("lat") String lat, @Query("long") String long);

  @GET('https://jeanswest.club/v1/api/near_branch') // ! Old Jeanswest Club
  Future<List<Branch>> getBranchesAddressOldClub(
      @Query("lat") String lat, @Query("long") String long);

  // ***************************************************************************
  // # LOGIN *******************************************************************

  @POST('http://10.0.1.111:8000/api/v1/otp/request')
  Future<OTPReqResponse> reqOtp(@Body() Map<String, dynamic> map);

  @POST('http://10.0.1.111:8000/api/v1/customerAuth')
  Future<AuthReqRespons> reqAuth(@Body() Map<String, dynamic> map);

  // ***************************************************************************
  // # PROFILE *****************************************************************
  // *          USER MAIN INFO *************************************************

  @GET('http://10.0.1.111:8000/api/v1/customer/myCustomer')
  Future<UserMainInfoRes> getUserMainInfo();

  @POST('http://10.0.1.111:8000/api/v1/erp/user/user')
  Future<UserTblPosCustRes> getUserErp(@Body() Map<String, dynamic> mobile);
  // !
  @GET('http://10.1.2.94:3003/v1/getUserMainInfo')
  Future<UserMainInfoRes> getMockUserMainInfo(); // ! Mockoon

  @POST('http://10.1.2.94:3003/v1/getUserTblPosCustRes')
  Future<UserTblPosCustRes> getMockUserErp(); // ! Mockoon

  // *          USER PAYMENT INFO **********************************************

  @POST('http://10.0.1.111:8000/api/v1/erp/promotion/customerMembershipLevel')
  Future<UserPaymentInfoRes> getUserPaymentInfo(
      @Body() Map<String, dynamic> id);
  // !
  @POST('http://10.1.2.94:3003/v1/getUserPaymentInfo')
  Future<UserPaymentInfoRes> getMockUserPaymentInfo(); // ! Mockoon

  // *          USER FRIENDS INFO **********************************************

  @GET('http://10.1.2.94:3003/v1/getUserFriendsInfo')
  Future<UserFriendsInfoRes> getUserFriendsInfo();

  @GET('http://10.1.2.94:3003/v1/getUserFriendsInfo')
  Future<UserFriendsInfoRes> getMockUserFriendsInfo();

  // *          USER FAVORITES INFO ********************************************

  @GET('http://10.0.1.111:8000/api/v1/favorite/list')
  Future<UserFavoriteInfoRes> getUserFavoriteInfo(
      @Body() Map<String, dynamic> tblPosCustomersID);

  @DELETE('http://10.0.1.111:8000/api/v1/favorite/remove')
  Future<GeneralRespons> removeFromUserFavorite(
      @Body() Map<String, dynamic> barcode);

  @POST('http://10.0.1.111:8000/api/v1/favorite/remove')
  Future<GeneralRespons> addToUserFavorite(
      @Body() Map<String, dynamic> barcode);

  // !
  @GET('http://10.1.2.94:3003/v1/getUserFavorite') // ! Mockoon
  Future<UserFavoriteInfoRes> getMockUserFavoriteInfo();

  // *          USER PAYMENT INFO **********************************************

  @GET('http://10.1.2.94:3003/v1/getUserInviteInfo')
  Future<UserInviteInfoRes> getUserInviteInfo();

  @GET('http://10.1.2.94:3003/v1/getUserJeanpointBons')
  Future<UserJeanpointsResponse> getUserJeanpointBonsInfo();

  @GET('http://10.1.2.94:3003/v1/getUserOrders')
  Future<UserOrderDataRes> getUserOrdersInfo();

  @GET('http://10.1.2.94:3005/api/v1/ticket/list')
  Future<UserTicketsRes> getUserTicketsInfo();

  @GET('http://10.1.2.94:3003/v1/getUserMessages')
  Future<UserMessagesInfoRes> getUserMessagesInfo();

  // *          USER ADDRESS INFO **********************************************

  @GET('http://10.1.2.94:3003/v1/getUserAddressesInfo') // ! Mockoon
  Future<UserAddressesInfoRes> getMockUserAddressesInfo();

  // ! Jeanswest API
  @GET('http://10.0.1.111:8000/api/v1/address/list')
  Future<UserAddressesInfoRes> getUserAddressesInfo(); // ! getAllUserAddress

  @POST('http://10.0.1.111:8000/api/v1/address/create')
  Future<GeneralRespons> addToUserAddressesInfo(
      @Body() Map<String, dynamic> address); // ! create a address

  @PATCH('http://10.0.1.111:8000/api/v1/address/edit')
  Future<GeneralRespons> editUserAddressesInfo(
      @Body() Map<String, dynamic> address); // ! edit a address

  @DELETE('http://10.0.1.111:8000/api/v1/address/remove')
  Future<GeneralRespons> deleteUserAddressesInfo(
      @Body() Map<String, dynamic> code); // ! delete a address

  // ***************************************************************************
  // # GLOBAL ******************************************************************

  @GET('http://10.1.2.94:3005/api/v1/contact-us/contact-info')
  Future<ContactUsRes> getContactUsInfo();
  @GET('http://10.1.2.94:3005/api/v1/faq/list')
  Future<FAQRes> getFAQInfo();

  @GET('http://10.0.1.111:8000/api/v1/address/giftCardsInfo')
  Future<LevelCardsRes> getLevelCardsInfo();

  @GET('http://10.0.1.111:8000/api/v1/logistic/states')
  Future<AllProvince> getAllProvinceInfo();

  @POST('http://10.0.1.111:8000/api/v1/logistic/cities')
  Future<AllCity> getAllCityInfo(@Body() Map<String, dynamic> idState);

  @POST('http://10.0.1.111:8000/api/v1/logistic/districts')
  Future<AllDistrict> getAllDistrictInfo(@Body() Map<String, dynamic> idCity);

  // ***************************************************************************
  // # PRODUCT *****************************************************************

  @POST('http://10.0.1.111:8000/api/v1/product/list')
  Future<ListOfProductsRes> getProductList(@Body() Map<String, dynamic> filter);

  // !

  @POST('http://10.0.1.111:8000/api/v1/product/list') // ! Mockoon
  Future<ListOfProductsRes> getMockProductList(@Body() Map<String, dynamic> filter);

  @GET('http://10.1.2.94:3002/v1/getAddToCardProductDetail') // ! Mockoon
  Future<ListOfProductsRes> getAddToCardProductDetailInfo(
    @Query("barcode") String barcode,
  );
}
