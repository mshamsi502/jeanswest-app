import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/promotion-description-data.dart';
import 'package:jeanswest/src/models/api_response/userRes/userJeanpointAndBons/promotion-point-data.dart';
import 'package:jeanswest/src/models/profile/user/user-copouns-info.dart';

List<UserCouponsInfo> userJeanpointBons = [
  UserCouponsInfo(
    code: "",
    startDate: "",
    expirationDate: "",
    price: 0,
    promotionPoint: PromotionPointData(
      name: "",
      description: PromotionDescriptionData(
        context: "",
        message: "",
      ),
    ),
  ),
];
