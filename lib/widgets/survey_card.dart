import 'package:diver/models/survey.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/res/status.dart';

class SurveyCard extends StatelessWidget {
  final Survey survey;

  const SurveyCard({Key? key, required this.survey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tên vườn:'),
              Text(survey.gardenName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Bắt đầu:'),
                        Text(
                            DateFormat.yMMMMEEEEd('vi_VN')
                                .format(survey.startTime!),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Kết thúc:'),
                        Text(
                            DateFormat.yMMMMEEEEd('vi_VN')
                                .format(survey.endTime!),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Trạng thái:'),
                    Text('${AppStatus.status[survey.status]}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ],
            ),
          ),
          leading: _getCorrectIcon(survey.status!),
        ),
      ),
    );
  }

  SizedBox _getCorrectIcon(int status) {
    switch (status) {
      case 0:
        return const SizedBox(
          height: double.infinity,
          child:
              Icon(Icons.history_toggle_off, size: 40.0, color: Colors.black),
        );
      case 1:
        return const SizedBox(
          height: double.infinity,
          child: Icon(Icons.check, size: 40.0, color: Colors.green),
        );
      default:
        return const SizedBox(
          height: double.infinity,
          child:
              Icon(Icons.history_toggle_off, size: 40.0, color: Colors.black),
        );
    }
  }
}
//   Icon getIconStatus(int body) {
//     switch (body) {
//       case 0:
//         Icon(Icons.check_circle, size: 40.0, color: Colors.green);
//         break;
//       case 1:
//         Icon(Icons.check_circle, size: 40.0, color: Colors.green);
//         break;
//       case 2:
//         const Icon(Icons.check_circle, size: 40.0, color: Colors.green);
//         break;
//       default:
//         const Icon(Icons.check_circle, size: 40.0, color: Colors.green);
//     }
//   }
// }
