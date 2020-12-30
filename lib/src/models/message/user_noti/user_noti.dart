// *   Created By :  Mohammad Shamsi    *|*    Email :  mshamsi502@gmail.com
// *   Project Name :  avakatan_profile
// *   Created Date & Time :  2020-11-25  ,  02:36 PM
// ****************************************************************************

import 'package:jeanswest/src/models/message/user_noti/noti_message.dart';

class UserNotification {
  final String title;
  final List<NotificationMessage> message;

  UserNotification(
    this.title,
    this.message,
  );
}
