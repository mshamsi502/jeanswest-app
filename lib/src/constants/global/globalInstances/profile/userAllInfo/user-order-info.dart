import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/data-order-result-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/onlineOrder/user-online-order-res.dart';
import 'package:jeanswest/src/models/api_response/userRes/userOrder/orderResult/offlineOrder/user-offline-order-res.dart';
// import 'package:jeanswest/src/models/api_response/userRes/userOrder/user-order-data-res.dart';

// UserOrderDataRes userOrders = UserOrderDataRes(
//   data: UserOrderResultRes(
//     inProgressOrders: [UserOnlineOrderRes()],
//     compeletedOrders: [UserOnlineOrderRes()],
//     returnedOrders: [UserOnlineOrderRes()],
//     offlineOrders: [UserOfflineOrderRes()],
//   ),
// );
UserOrderResultRes userOrdersa = UserOrderResultRes(
  inProgressOrders: [UserOnlineOrderRes()],
  compeletedOrders: [UserOnlineOrderRes()],
  returnedOrders: [UserOnlineOrderRes()],
  offlineOrders: [UserOfflineOrderRes()],
);
