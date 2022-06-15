import 'package:flutter/material.dart';
import 'package:diver/pages/home.dart';
import 'package:diver/pages/survey_task.dart';
import 'package:diver/pages/today_task.dart';

class Routes {
  static const onBoarding = "/";
  static const home = "/home";
  static const todaysTask = "/task/todays";
  static const surveyTask = "/survey_task";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.todaysTask:
        return MaterialPageRoute(
          builder: ((context) => const TodaysTaskScreen()),
        );
      case Routes.surveyTask:
        return MaterialPageRoute(
          builder: ((context) => const SurveyScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
