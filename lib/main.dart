import 'package:diver/controller/auth_controller.dart';
import 'package:diver/core/res/color.dart';
import 'package:diver/services/localization.dart';
import 'package:get/get.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();
  NotificationController.initialize();
  await Firebase.initializeApp();
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
