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




// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:diver/core/res/color.dart';
// import 'package:diver/core/routes/routes.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       return MaterialApp(
//         title: 'Diver',
//         debugShowCheckedModeBanner: false,
//         theme: AppColors.getTheme,
//         initialRoute: Routes.login,
//         onGenerateRoute: RouterGenerator.generateRoutes,
//       );
//     });
//   }
// }
