// *   Created By:  Mohammad Shamsi    *|*    Email:  mshamsi502@gmail.com
// *   Project Name:  mobile_jeanswest_app_android    *|*    App Name: Jeanswest
// *   Created Date & Time:  2021-01-01  ,  10:00 AM
// ****************************************************************************

import 'package:jeanswest/src/models/profile/message/user_noti/noti_message.dart';

class UserNotification {
  final String title;
  final List<NotificationMessage> message;

  UserNotification(
    this.title,
    this.message,
  );
}
