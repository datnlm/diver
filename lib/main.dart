import 'dart:io';
import 'package:diver/controller/auth_controller.dart';
import 'package:diver/controller/dashboard_controller.dart';
import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/res/color.dart';
import 'package:diver/services/localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/notification_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.
  await Firebase.initializeApp();
}

AndroidNotificationChannel? channel;
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  NotificationController.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the AndroidManifest.xml file to override the
    /// default FCM channel to enable heads up notifications.
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        FirebaseMessaging.instance.getInitialMessage().then((message) {
          if (message != null) {
            final routeFromMessage = message.data['divingSurveyId'];
            print(routeFromMessage);
            print('main');
            print('****message.data********************');
            print(message.data);
            DashBoardController dashBoardController =
                Get.find<DashBoardController>();
            SurveyController surveyController = Get.find<SurveyController>();
            surveyController.notfiClick = true;
            surveyController.getSurveyById(routeFromMessage);
            dashBoardController.tabIndex = 0;
            flutterLocalNotificationsPlugin!.show(
                notification.hashCode,
                notification.title,
                notification.body,
                NotificationDetails(
                  android: AndroidNotificationDetails(
                    channel!.id,
                    channel!.name,
                    channelDescription: channel!.description,
                    channelShowBadge: true,
                    color: Colors.blue,
                    playSound: true,
                    styleInformation: BigTextStyleInformation(''),
                    icon: '@mipmap/ic_launcher',
                  ),
                ));
          }
        });
      }
    });
  }
  Get.lazyPut(() => AuthController());
  runApp(
    GetMaterialApp(
      theme: AppColors.getTheme,
      debugShowCheckedModeBanner: false,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      initialRoute:
          AuthController.isInitialized == true ? Routes.splash : Routes.login,
      getPages: RouterGenerator.pages,
    ),
  );
}
