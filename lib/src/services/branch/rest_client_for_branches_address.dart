// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:dio/dio.dart';
import 'package:jeanswest/src/constants/global/constants.dart';
import 'package:jeanswest/src/constants/global/size_constants.dart';
import 'package:jeanswest/src/models/branch/branch.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client_for_branches_address.g.dart';

@RestApi(baseUrl: BASE_URL_FOR_BRANCH_ADDRESS)
abstract class RestClientForBranchesAddress {
  /// pre setting dio
  /// [dio] auto set in service_locator.dart file and
  /// optional named parameter [baseUrl] if you want change base url
  factory RestClientForBranchesAddress(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(
        receiveTimeout: RECEIVE_TIMEOUT, connectTimeout: CONNECT_TIMEOUT);
    return _RestClientForBranchesAddress(dio, baseUrl: baseUrl);
  }

  @GET('/v1/api/near_branch')
  Future<List<Branch>> getBranchesAddress(
      @Query("lat") String lat, @Query("long") String long);
}
