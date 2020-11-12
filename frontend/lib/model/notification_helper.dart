// This notification architect is based on lecture code example, and added
// cancel notification functionality
import 'dart:io' show Platform;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notifications {
  String channelId = 'generalNotifications';
  String channelName = 'General Notifications';
  String channelDescription = 'General Notification Channel';

  Notifications({this.channelId, this.channelName, this.channelDescription});

  var _flutterLocalNotificationsPlugin;

  NotificationDetails _platformChannelInfo;

  // The notification should not be hardCode, and needs to be stored in DataBase
  // so it is possible to delete a future notification.
  var _notificationId = 100;

  Future<void> init() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestIOSPermission();
    }

    // setup the notification plug-in
    var initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) {
        print('$id/$title/$body/$payload');
        return null;
      },
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );

    // setup a notification channel
    var androidChannelInfo = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription,
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      ticker: 'ticker',
    );
    var iosChannelInfo = IOSNotificationDetails();

    _platformChannelInfo = NotificationDetails(
      android: androidChannelInfo,
      iOS: iosChannelInfo,
    );
  }

  _requestIOSPermission() {
    _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        .requestPermissions(
          alert: false,
          badge: true,
          sound: true,
        );
  }

  Future onSelectNotification(var payload) async {
    if (payload != null) {
      print('onSelectNotification::payload = $payload');
    }
  }

  sendNotificationNow(String title, String body, String payload) {
    print(_flutterLocalNotificationsPlugin);
    _flutterLocalNotificationsPlugin.show(
      _notificationId++,
      title,
      body,
      _platformChannelInfo,
      payload: payload,
    );
  }

  sendNotificationLater(
      String title, String body, tz.TZDateTime when, String payload) {
    _flutterLocalNotificationsPlugin.zonedSchedule(
      _notificationId++,
      title,
      body,
      when,
      _platformChannelInfo,
      payload: payload,
      uiLocalNotificationDateInterpretation: null,
      androidAllowWhileIdle: true,
    );
  }

  cancelNotificationById(int notificationId) {
    _flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  cancelAllNotification() async {
    List<PendingNotificationRequest> pendingNotifications =
        await getPendingNotificationRequests();
    for (var pendingRequest in pendingNotifications) {
      cancelNotificationById(pendingRequest.id);
    }
  }

  Future<List<PendingNotificationRequest>>
      getPendingNotificationRequests() async {
    return _flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }
}
