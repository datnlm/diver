import 'package:diver/widgets/login_form.dart';
import 'package:diver/widgets/login_screen_top_image.dart';
import 'package:flutter/material.dart';

import 'package:diver/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:diver/controller/dashboard_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../controller/notification_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getToken()
        .then((value) => authController.setTokenDevice(value!));
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data['route'];
        // _homeController.changeTabIndex(1);
        var _fcm = FirebaseMessaging.instance;
        _fcm.getToken().then((value) => print('The |||' + value!));
      }
    });
    var initialzationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initialzationSettingsAndroid);

    // flutterLocalNotificationsPlugin.initialize(initializationSettings);
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   if (message.notification != null) {
    //     NotificationController.display(message);
    // }
    // dang handle

    // RemoteNotification? notification = message.notification;
    // AndroidNotification? android = message.notification?.android;
    // if (notification != null && android != null) {
    //   flutterLocalNotificationsPlugin.show(
    //       notification.hashCode,
    //       notification.title,
    //       notification.body,
    //       NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           // channel.description,
    //           icon: android.smallIcon,
    //         ),
    //       ));
    // }
    // });
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        NotificationController.display(message);
        DashBoardController dashBoardController =
            Get.find<DashBoardController>();
        dashBoardController.tabIndex = 0;
      }
      var _fcm = FirebaseMessaging.instance;
      _fcm.getToken().then((value) => print('The |||' + value!));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // final routeFromMessage = message.data['route'];
      DashBoardController dashBoardController = Get.find<DashBoardController>();
      dashBoardController.tabIndex = 0;
      var _fcm = FirebaseMessaging.instance;
      _fcm.getToken().then((value) => print('The|||' + value!));
    });

    // FirebaseMessaging.onBackgroundMessage((message) {
    //   if (message.notification != null) {
    //     NotificationController.display(message);
    //   }
    // return  print('The |||' + value!));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: MobileLoginScreen(),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            'assets/images/signup_top.png',
            width: MediaQuery.of(context).size.width * 0.35,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset(
            'assets/images/login_bottom.png',
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const LoginScreenTopImage(),
            Row(
              children: const [
                Spacer(),
                Expanded(
                  flex: 8,
                  child: LoginForm(),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
