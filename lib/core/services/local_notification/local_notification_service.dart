import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/core/utils/utils.dart';
import 'package:lista_de_tarefas/domain/entities/notification/notification_entity.dart';

@injectable
class LocalNotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;
  late StyleInformation styleInformation;

  LocalNotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  _setupNotifications() async {
    await _initializeNotification();
  }

  _initializeNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');

    final bigImage = await Utils.downloadFile(
      'https://cdn.pixabay.com/photo/2023/09/03/15/26/cumulonimbus-8230904_640.jpg',
      'paisagem',
    );

    styleInformation = BigPictureStyleInformation(
      FilePathAndroidBitmap(bigImage),
      largeIcon: FilePathAndroidBitmap(bigImage),
    );

    const settings = InitializationSettings(
      android: android,
    );
    await localNotificationsPlugin.initialize(
      settings,
    );
  }

  showNotification(NotificationEntity notification) {
    androidDetails =
        AndroidNotificationDetails('lembretes_notifications', 'Mensagens',
            channelDescription: 'Este canal é para lembretes',
            playSound: true,
            importance: Importance.max,
            priority: Priority.high,
            actions: [
              const AndroidNotificationAction('1', 'Abir'),
              const AndroidNotificationAction('2', 'Responder'),
            ],
            color: const Color.fromARGB(0, 35, 3, 83),
            styleInformation: styleInformation);

    localNotificationsPlugin.show(
        notification.id,
        notification.title,
        notification.body,
        NotificationDetails(
          android: androidDetails,
        ),
        payload: notification.payload);
  }

  checkNotification() async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {}
  }
}
