import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../main.dart';
import 'StringConstant.dart';

class NotificationUtil {
  static Future<void> initializeNotification() async {
    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
            onDidReceiveLocalNotification:
                (int id, String title, String body, String payload) async {});
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {});

   await _manageNotification();
  }

  static Future<void> _manageNotification() async {
    FirebaseMessaging().configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage ');
        print('onMessage ' + message.toString());
        showNotification(
          message['notification']['title'] as String,
          message['notification']['body'] as String,
        );
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch');
      },
    );

    FirebaseMessaging().getToken().then((String token) {
      print(token);
      StringConstant.pushToken = token;
    });

  }

  static Future<void> showNotification(String title, String message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'swasthgarbh',
      'Swasthgarbh',
      'Swasthgarbh Notification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      channelShowBadge: true,
      playSound: true,
      styleInformation: BigTextStyleInformation(''),
    );
    const IOSNotificationDetails iOSPlatformChannelSpecifics =
        IOSNotificationDetails(
            presentSound: true, presentAlert: true, presentBadge: true);
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecond,
      title,
      message,
      platformChannelSpecifics,
      payload: '',
    );
  }

  static Future<void> scheduleNotification(
      DateTime date, String message) async {
    final AndroidNotificationDetails androidSpecifics =
        AndroidNotificationDetails(
      DateTime.now()
          .millisecondsSinceEpoch
          .toString(), // This specifies the ID of the Notification
      'Swasthgarbh',
      'Swasthgarbh Notification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      channelShowBadge: true,
      playSound: true,
      styleInformation: BigTextStyleInformation(''),
    );
    const IOSNotificationDetails iOSSpecifics = IOSNotificationDetails();
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidSpecifics, iOS: iOSSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'SwasthGarbh',
        message,
        date,
        platformChannelSpecifics); // This literally schedules the notification
  }

  static Future<void> secNotification(DateTime date) async {
    DateTime ASC1 = date.add(const Duration(days: 84));
    DateTime ASC1_1 = date.add(const Duration(days: 79));
    DateTime ASC1_2 = date.add(const Duration(days: 83));
    DateTime ASC2 = date.add(const Duration(days: 140));
    DateTime ASC2_1 = date.add(const Duration(days: 135));
    DateTime ASC2_2 = date.add(const Duration(days: 138));
    DateTime ASC3 = date.add(const Duration(days: 182));
    DateTime ASC3_1 = date.add(const Duration(days: 177));
    DateTime ASC3_2 = date.add(const Duration(days: 180));
    DateTime ASC4 = date.add(const Duration(days: 210));
    DateTime ASC4_1 = date.add(const Duration(days: 205));
    DateTime ASC4_2 = date.add(const Duration(days: 208));
    DateTime ASC5 = date.add(const Duration(days: 238));
    DateTime ASC5_1 = date.add(const Duration(days: 233));
    DateTime ASC5_2 = date.add(const Duration(days: 236));
    DateTime ASC6 = date.add(const Duration(days: 252));
    DateTime ASC6_1 = date.add(const Duration(days: 247));
    DateTime ASC6_2 = date.add(const Duration(days: 250));
    DateTime ASC7 = date.add(const Duration(days: 266));
    DateTime ASC7_1 = date.add(const Duration(days: 261));
    DateTime ASC7_2 = date.add(const Duration(days: 264));
    DateTime ASC8 = date.add(const Duration(days: 282));
    DateTime ASC8_1 = date.add(const Duration(days: 277));
    DateTime ASC8_2 = date.add(const Duration(days: 280));

    scheduleNotification(ASC1, 'Anc1 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC1_1, 'Anc1 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC1_2, 'Anc1 visit alert: kindly visit to your doctor');
    scheduleNotification(ASC2, 'Anc2 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC2_1, 'Anc2 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC2_2, 'Anc2 visit alert: kindly visit to your doctor');
    scheduleNotification(ASC3, 'Anc3 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC3_1, 'Anc3 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC3_2, 'Anc3 visit alert: kindly visit to your doctor');
    scheduleNotification(ASC4, 'Anc4 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC4_1, 'Anc4 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC4_2, 'Anc4 visit alert: kindly visit to your doctor');
    scheduleNotification(ASC5, 'Anc5 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC5_1, 'Anc5 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC5_2, 'Anc5 visit alert: kindly visit to your doctor');
    scheduleNotification(ASC6, 'Anc6 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC6_1, 'Anc6 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC6_2, 'Anc6 visit alert: kindly visit to your doctor');
    scheduleNotification(ASC7, 'Anc7 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC7_1, 'Anc7 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC7_2, 'Anc7 visit alert: kindly visit to your doctor');
    scheduleNotification(ASC8, 'Anc8 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC8_1, 'Anc8 visit alert: kindly visit to your doctor');
    scheduleNotification(
        ASC8_2, 'Anc8 visit alert: kindly visit to your doctor');
  }
}
