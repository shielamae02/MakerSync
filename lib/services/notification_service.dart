

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future showNotification({
    int id = 0,
    String? title, 
    String? body,
    String? payload,
  }) async =>
    _notifications.show(
      id, 
      title, 
      body, 
      await _notificationDetaisl(),
  );
}