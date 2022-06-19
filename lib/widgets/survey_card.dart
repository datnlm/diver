import 'package:diver/models/survey.dart';
import 'package:flutter/material.dart';

class SurveyCard extends StatelessWidget {
  final Survey survey;

  const SurveyCard({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        title: Text('${survey.startTime} - ${survey.endTime}'),
        subtitle: Text('${survey.status}'),
        leading:
            const Icon(Icons.check_circle, size: 40.0, color: Colors.green),
            // const Icon(Icons.access_time_outlined, size: 40.0, color: Colors.black),
            // const Icon(Icons.cancel, size: 40.0, color: Colors.red),
      ),
    );
  }
}
