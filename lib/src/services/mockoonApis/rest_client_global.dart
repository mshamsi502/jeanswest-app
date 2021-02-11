// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/size_constants.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/models/api_response/globalRes/success_response.dart';
import 'package:jeanswest/src/models/api_response/loginRes/mockoonRes/login-and-get-token-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userMain/user-main-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userInvite/user-invite-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userFriends/user-friends-info-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userPayment/user-payment-info-res.dart';
import 'package:jeanswest/src/services/rest-client.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_global.g.dart';

// @RestApi(baseUrl: BASE_URL_FOR_BRANCH_ADDRESS)
@RestApi(baseUrl: BASE_URL_FOR_MOCKOON)
abstract class GlobalRestClient extends RestClient {
  /// pre setting dio
  /// [dio] auto set in service_locator.dart file and
  /// optional named parameter [baseUrl] if you want change base url
  factory GlobalRestClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: RECEIVE_TIMEOUT, connectTimeout: CONNECT_TIMEOUT);
    return _GlobalRestClient(dio, baseUrl: baseUrl);
  }

  // ! Real API's
  // @GET('/v1/api/near_branch')
  // Future<List<Branch>> getBranchesAddress(
  //     @Query("lat") String lat, @Query("long") String long);

  // ! Mock Data API's

  // @GET('/v1/getBranches')
  // Future<List<Branch>> getBranchesAddress1(
  //     @Query("lat") String lat, @Query("long") String long);

  @POST('/v1/getBranches')
  Future<List<Branch>> getBranchesAddress2(
      @Query("lat") String lat, @Query("long") String long);
  //

  @POST('/v1/reqVerifyCode')
  Future<SuccessRespons> reqForVerifyCode(
      @Field("phoneNumber") String phoneNumber);

  @GET('/v1/verifyCode')
  Future<LoginAndGetTokenRes> getVerifyCode(
    @Query("phoneNumber") String phoneNumber,
    @Query("verifyCode") String verifyCode,
  );

  @GET('/v1/getUserMainInfo')
  Future<UserMainInfoRes> getUserMainInfo();

  @GET('/v1/getUserInviteInfo')
  Future<UserInviteInfoRes> getUserInviteInfo();

  @GET('/v1/getUserFriendsInfo')
  Future<UserFriendsInfoRes> getUserFriendsInfo();

  @GET('/v1/getUserPaymentInfo')
  Future<UserPaymentInfoRes> getUserPaymentInfo();
}
