import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/routes/routes.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

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
            onTap: () => surveyController.getByOrderId(),
            child: const Card(
              elevation: 5,
              child: ListTile(
                title: Text('Order'),
                subtitle: Text('Trang thai'),
                leading: Icon(Icons.check, size: 40.0, color: Colors.green),
              ),
            ),
          ),
        ));
  }
}
