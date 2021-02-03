// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/size_constants.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:jeanswest/src/models/api_response/success_response.dart';
import 'package:jeanswest/src/models/api_response/login_and_get_token.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_global.g.dart';

// @RestApi(baseUrl: BASE_URL_FOR_BRANCH_ADDRESS)
@RestApi(baseUrl: BASE_URL_FOR_MOCKOON)
abstract class GlobalRestClient {
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

  @POST('/v1/login2')
  Future<SuccessRespons> postLogin(@Field("phoneNumber") String phoneNumber);

  @GET('/v1/verifyCode')
  Future<LoginAndGetToken> getVerifyCode(
    @Query("phoneNumber") String phoneNumber,
    @Query("verifyCode") String verifyCode,
  );
  @POST('/v1/verifyCode')
  Future<LoginAndGetToken> postVerifyCode(
    @Field("phoneNumber") String phoneNumber,
    @Field("verifyCode") String verifyCode,
  );
}
