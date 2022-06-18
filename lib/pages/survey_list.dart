import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/routes/routes.dart';

class SurveyList extends StatelessWidget {
  const SurveyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SurveyController surveyController = Get.find<SurveyController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Survey List"),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              surveyController.getBySurveyId();
              // Navigator.pushNamed(context, Routes.surveyTask);
            },
            child: const Card(
              elevation: 5,
              child: ListTile(
                title: Text('survey'),
                subtitle: Text('Trang thai'),
                leading: Icon(Icons.check, size: 40.0, color: Colors.green),
              ),
            ),
          ),
        ));
  }
}
