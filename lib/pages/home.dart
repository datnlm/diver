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
CalendarFormat _calendarFormat = CalendarFormat.week;
DateTime _focusedDay = DateTime.now();
var label = 'today'.tr;
DateTime? _selectedDay;
List<Tab> myTabs = <Tab>[
  Tab(text: 'process'.tr),
  Tab(text: 'done'.tr),
  Tab(text: 'delete'.tr),
];

late TabController _tabController;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _surveyController.tabIndexNew = 0;
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          GetBuilder<SurveyController>(
            builder: ((controller) => TextButton(
                  onPressed: () => _surveyController.changeViewTab(),
                  child: controller.isViewCalendar
                      ? Text('view-all'.tr)
                      : Text('view-day'.tr),
                )),
          )
        ],
      ),
      body: GetBuilder<SurveyController>(
        builder: (controller) => (controller.isViewCalendar)
            ? _viewCalendar()
            : Column(
                children: [
                  _getListSurvey(),
                ],
              ),
      ),
    );
  }

  Column _viewCalendar() {
    return Column(
      children: [
        _tableCalendar(),
        const SizedBox(height: 8.0),
        _getListSurvey(),
      ],
    );
  }

  TableCalendar<dynamic> _tableCalendar() {
    return TableCalendar(
      locale: Get.locale!.toLanguageTag(),
      calendarStyle: const CalendarStyle(
        // Use `CalendarStyle` to customize the UI
        outsideDaysVisible: false,
        weekendTextStyle: TextStyle(color: Colors.red),
      ),
      availableCalendarFormats: {
        CalendarFormat.month: 'week'.tr,
        CalendarFormat.twoWeeks: 'month'.tr,
        CalendarFormat.week: '2-week'.tr
      },
      weekendDays: const [DateTime.saturday, DateTime.sunday],
      startingDayOfWeek: StartingDayOfWeek.monday,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2025, 1, 1),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          if (day.weekday == DateTime.sunday ||
              day.weekday == DateTime.saturday) {
            final text = DateFormat.E(Get.locale!.toLanguageTag()).format(day);

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
            _surveyController.dateClick = true;
            _surveyController.getByDateTime(selectedDay);
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            if (DateFormat('yyyy-MM-dd').format(_selectedDay!) ==
                DateFormat('yyyy-MM-dd').format(DateTime.now())) {
              label = "Công việc hôm nay";
            } else {
              label =
                  '${'task'.tr} ${DateFormat.yMMMMEEEEd(Get.locale!.toLanguageTag()).format(_selectedDay!)}';
            }
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
    );
  }

  Expanded _getListSurvey() {
    return Expanded(
      child: DefaultTabController(
          length: myTabs.length,
          initialIndex: 0,
          child: Builder(
            builder: (BuildContext context) {
              final TabController tabController =
                  DefaultTabController.of(context)!;
              tabController.addListener(() {
                if (!tabController.indexIsChanging) {
                  // Your code goes here.
                  // To get index of current tab use tabController.index
                  _surveyController.tabIndexNew = tabController.index;
                  if (_surveyController.isViewCalendar) {
                    _surveyController.getByDateTime(_selectedDay!);
                  } else {
                    _surveyController.getAll();
                  }
                }
              });

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: myTabs,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: _surveyController.isViewCalendar
                        ? Text(
                            label,
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          )
                        : Text(
                            'list-survey'.tr,
                            style: TextStyle(
                              color: Colors.blueGrey[900],
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: myTabs.map((Tab tab) {
                        return GetBuilder<SurveyController>(
                          builder: (controller) => (controller.isLoading.isTrue)
                              ? const Center(child: CircularProgressIndicator())
                              : controller.listSurvey.isEmpty &&
                                      controller.isLoading.isFalse
                                  ? _emptyTask()
                                  : _survey(controller),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }

  Column _emptyTask() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40,
        ),
        const Icon(
          Icons.assignment_outlined,
          size: 120.0,
        ),
        Text(
          'task-empty'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        // Look like you have no task in this date.
        Text(
          'task-emty-detail'.tr,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  ListView _survey(SurveyController controller) {
    return ListView.builder(
      itemCount: controller.listSurvey.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            controller.getLoading(); 
            controller
                .getSurveyById(controller.listSurvey[index].id.toString());
            Get.toNamed(
              Routes.surveyTask,
              arguments: {
                "divingId": controller.listSurvey[index].id,
                "gardenId": controller.listSurvey[index].gardenId
              },
            );
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
