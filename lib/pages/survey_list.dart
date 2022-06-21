import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/routes/routes.dart';
import '../widgets/survey_card.dart';

class SurveyList extends StatefulWidget {
  const SurveyList({Key? key}) : super(key: key);

  @override
  State<SurveyList> createState() => _SurveyListState();
}

class _SurveyListState extends State<SurveyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Survey List"),
      ),
      body: GetBuilder<SurveyController>(
        builder: (controller) => (controller.isLoading.isTrue)
            ? const Center(child: CircularProgressIndicator())
            : controller.listSurvey.isEmpty
                ? const Center(child: Text('Ko co task'))
                : ListView.builder(
                    itemCount: controller.listSurvey.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        controller.getBySurveyId(controller.listSurvey[index]);
                      },
                      child: SurveyCard(survey: controller.listSurvey[index]),
                    ),
                  ),
      ),
    );
  }
}
