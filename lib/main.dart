import 'package:diver/core/res/color.dart';
import 'package:get/get.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() async {
  runApp(
    GetMaterialApp(
      theme: AppColors.getTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: RouterGenerator.pages,
    ),
  );
}