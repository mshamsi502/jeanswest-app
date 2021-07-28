// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/constValues/size_constants.dart';
import 'package:jeanswest/src/models/api_response/category/category-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-city.dart';
import 'package:jeanswest/src/models/api_response/globalRes/contactUs/contact-us-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/faq/faq-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/general_response.dart';
import 'package:jeanswest/src/models/api_response/globalRes/levelCards/level-cards-res.dart';

import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/otp-req-response.dart';
import 'package:jeanswest/src/models/api_response/loginRes/jeanswestRes/auth-req-response.dart';
import 'package:jeanswest/src/models/api_response/productRes/erp/exist-in-branches-list-res.dart';
import 'package:jeanswest/src/models/api_response/productRes/list-of-products-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFavorite/user-favorite-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/user-jeanpoints-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userTblPosCust/user-tbl-pos-cust-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/user-order-data-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/create-ticket-res.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/userMainInfo/user-main-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userInvite/user-invite-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userTickets/user-tickets-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userAddresses/user-addresses-info-res.dart';

import 'package:jeanswest/src/models/api_response/userRes/userMessage/user-message-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-province.dart';
import 'package:jeanswest/src/models/api_response/globalRes/aboutUs/about-us-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/ReturnPolicy/return-policy-res.dart';
import 'package:jeanswest/src/models/api_response/globalRes/address/all-district.dart';
import 'package:jeanswest/src/services/jeanswest_apis/rest-client.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client_global.g.dart';

@RestApi(baseUrl: "")
abstract class GlobalRestClient extends RestClient {
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

  @POST('http://10.0.1.111:8000/api/v1/customer/updateMyCustomer')
  Future<UserMainInfoRes> updateUserMainInfo(
      @Body() Map<String, dynamic> newUser);
  // !
  @GET('http://10.1.2.94:3003/v1/getUserMainInfo')
  Future<UserMainInfoRes> getMockUserMainInfo(); // ! Mockoon

  @POST('http://10.1.2.94:3003/v1/getUserTblPosCustRes')
  Future<UserTblPosCustRes> getMockUserErp(); // ! Mockoon

  // *          USER PAYMENT INFO **********************************************

  @GET('http://10.0.1.111:8000/api/v1/customer/myCustomerMembershipLevel')
  Future<UserPaymentInfoRes> getUserPaymentInfo();
  // !
  @POST('http://10.1.2.94:3003/v1/getUserPaymentInfo')
  Future<UserPaymentInfoRes> getMockUserPaymentInfo(); // ! Mockoon

  // *          USER FRIENDS INFO **********************************************

  // @GET('http://10.1.2.94:3003/v1/getUserFriendsInfo')
  // Future<UserFriendsInfoRes> getUserFriendsInfo();

  // @GET('http://10.1.2.94:3003/v1/getUserFriendsInfo')
  // Future<UserFriendsInfoRes> getMockUserFriendsInfo(); // ! Mockoon

  @GET('http://10.1.2.94:3003/v1/getUserInviteInfo')
  Future<UserInviteInfoRes> getUserInviteInfo(); // ! Mockoon

  @POST('http://10.0.1.111:8000/api/v1/customer/sendInviteLink')
  Future<GeneralRespons> sendInviteFriendLink(
      @Body() Map<String, dynamic> friendMobile);

  @GET('http://10.0.1.111:8000/api/v1/inviteFriendsFAQ/list')
  Future<FAQRes> getInviteFriendFAQ();

  // *          USER FAVORITES INFO ********************************************

  @GET('http://10.0.1.111:8000/api/v1/favorite/list')
  Future<UserFavoriteInfoRes> getUserFavoriteInfo(
      @Body() Map<String, dynamic> tblPosCustomersID);

  @DELETE('http://10.0.1.111:8000/api/v1/favorite/remove')
  Future<GeneralRespons> removeFromUserFavorite(
      @Body() Map<String, dynamic> barcode);

  @POST('http://10.0.1.111:8000/api/v1/favorite/add')
  Future<GeneralRespons> addToUserFavorite(
      @Body() Map<String, dynamic> barcode);

  // !
  @GET('http://10.1.2.94:3003/v1/getUserFavorite') // ! Mockoon
  Future<UserFavoriteInfoRes> getMockUserFavoriteInfo();

  // *          USER JEANSPOINT INFO *******************************************

  @GET('http://10.0.1.111:8000/api/v1/promotion/point/customer/list')
  Future<UserJeanpointsRes> getUserJeanpointBonsInfo();
  // !
  @GET('http://10.1.2.94:3003/v1/getUserJeanpointBons')
  Future<UserJeanpointsRes> getMockUserJeanpointBonsInfo(); // ! Mockoon

  // *          USER PAYMENT INFO **********************************************

  @GET('http://10.1.2.94:3006/v1/getUserOrders')
  Future<UserOrderDataRes> getUserOrdersInfo(); // ! Mockoon

  // *          USER TICKET INFO ***********************************************

  @GET('http://10.0.1.111:8000/api/v1/ticket/list')
  Future<UserTicketsRes> getUserTicketsInfo();

  @POST('http://10.0.1.111:8000/api/v1/ticket/create')
  Future<CreateTicketRes> createUserTicketsInfo(
      @Body() Map<String, dynamic> newTicket);

  @POST('http://10.0.1.111:8000/api/v1/ticket/reply')
  Future<CreateTicketRes> replyTicketsInfo(
      @Body() Map<String, dynamic> newMessage);

  @POST('http://10.0.1.111:8000/api/v1/ticket/close')
  Future<GeneralRespons> closeTicketsInfo(
      @Body() Map<String, dynamic> ticketId);

  @GET('http://10.1.2.94:3006/api/v1/ticket/list')
  Future<UserTicketsRes> getMockUserTicketsInfo(); // ! Mockoon

  // *          USER NOTIFICATION INFO *****************************************

  @POST('http://10.0.1.111:8000/api/v1/notification/list')
  Future<UserMessageRes> getUserMessagesInfo(@Body() Map<String, dynamic> body);

  @GET('http://10.1.2.94:3006/v1/getUserMessages')
  Future<UserMessageRes> getMockUserMessagesInfo(); // ! Mockoon

  // *          USER ADDRESS INFO **********************************************

  @GET('http://10.1.2.94:3003/v1/getUserAddressesInfo') // ! Mockoon
  Future<UserAddressesInfoRes> getMockUserAddressesInfo();

  // ! Jeanswest API
  @GET('http://10.0.1.111:8000/api/v1/address/list')
  Future<UserAddressesInfoRes> getUserAddressesInfo();

  @POST('http://10.0.1.111:8000/api/v1/address/create')
  Future<GeneralRespons> addToUserAddressesInfo(
      @Body() Map<String, dynamic> address);

  @PATCH('http://10.0.1.111:8000/api/v1/address/edit')
  Future<GeneralRespons> editUserAddressesInfo(
      @Body() Map<String, dynamic> address);

  @DELETE('http://10.0.1.111:8000/api/v1/address/remove')
  Future<GeneralRespons> deleteUserAddressesInfo(
      @Body() Map<String, dynamic> code);

  // ***************************************************************************
  // # GLOBAL ******************************************************************
  // *          MORE ***********************************************************

  @GET('http://10.0.1.111:8000/api/v1/contactUs/list')
  Future<ContactUsRes> getContactUsInfo();

  @GET('http://10.0.1.111:8000/api/v1/faq/list')
  Future<FAQRes> getFAQInfo();

  @GET('http://10.0.1.111:8000/api/v1/aboutUs/list')
  Future<AboutUsRes> getAboutUsInfo();

  @GET('http://10.0.1.111:8000/api/v1/returnPolicy/list')
  Future<ReturnPolicyRes> getReturnPolicyInfo();

  @GET('http://10.1.2.94:3006/api/v1/faq/list')
  Future<FAQRes> getMockFAQInfo(); // ! Mockoon

  @GET('http://10.1.2.94:3005/api/v1/contact-us/contact-info') // ! Mockoon
  Future<ContactUsRes> getMockContactUsInfo();

  // *          LEVEL CARDS ****************************************************

  @GET('http://10.0.1.111:8000/api/v1/membershipLevelCards/list')
  Future<LevelCardsRes> getLevelCardsInfo();

  // *          ADRRESS ********************************************************

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

  // *          CATEGORY *******************************************************

  @GET('http://10.0.1.111:8000/api/v1/category/oldList')
  // @GET('http://10.0.1.111:8000/api/v1/category/list')
  // @GET('/v1/category/oldList')
  // @GET('$baseUrl/category/list')
  Future<CategoryRes> getAllCategory();
  //

  @POST(
      'http://10.0.1.111:8000/api/v1/erp/product/getProductsAvailabilityInBranches')
  // @GET('http://10.0.1.111:8000/api/$BACKEND_API_VERSION/category/list')
  Future<ExistInBranchesListRes> getExistInBranches(
      @Body() Map<String, dynamic> barcode);

  // !

  @GET('http://10.1.2.94:3002/v1/getAddToCardProductDetail') // ! Mockoon
  Future<ListOfProductsRes> getAddToCardProductDetailInfo(
    @Query("barcode") String barcode,
  );
}
