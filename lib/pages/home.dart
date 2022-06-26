import 'package:diver/controller/survey_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/widgets/survey_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final SurveyController _surveyController = Get.find<SurveyController>();

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Trang chủ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      extendBody: true,
      body: Column(
        children: [
          TableCalendar(
            locale: 'vi',
            availableCalendarFormats: const {
              CalendarFormat.month: 'Tuần',
              CalendarFormat.twoWeeks: 'Tháng',
              CalendarFormat.week: '2 tuần'
            },
            weekendDays: const [DateTime.saturday, DateTime.sunday],
            startingDayOfWeek: StartingDayOfWeek.monday,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2025, 1, 1),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
              weekendTextStyle: TextStyle(color: Colors.red),
            ),
            calendarBuilders: CalendarBuilders(
              dowBuilder: (context, day) {
                if (day.weekday == DateTime.sunday ||
                    day.weekday == DateTime.saturday) {
                  final text = DateFormat.E('vi').format(day);

                  return Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return null;
              },
            ),
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _surveyController.getAll(selectedDay);
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          _getListSurvey(),
        ],
      ),
    );
  }

  Expanded _getListSurvey() {
    return Expanded(
      child: GetBuilder<SurveyController>(
        builder: (controller) => (controller.isLoading.isTrue)
            ? const Center(child: CircularProgressIndicator())
            : controller.listSurvey.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 40,
                      ),
                      Icon(
                        Icons.assignment_outlined,
                        size: 120.0,
                      ),
                      Text(
                        'Không có công việc',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      // Look like you have no task in this date.
                      Text(
                        'Có vẻ như bạn không có nhiệm vụ trong ngày này.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                : _survey(controller),
      ),
    );
  }

  ListView _survey(SurveyController controller) {
    return ListView.builder(
      itemCount: controller.listSurvey.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            controller.getSurveyById(controller.listSurvey[index]);
            Get.toNamed(Routes.surveyTask);
          },
          child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SurveyCard(
                survey: controller.listSurvey[index],
              )),
        );
      }),
    );
  }
}
