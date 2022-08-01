import 'package:diver/controller/diver_team_controller.dart';
import 'package:diver/widgets/diver_team_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiverTeamScreen extends StatefulWidget {
  const DiverTeamScreen({Key? key}) : super(key: key);

  @override
  State<DiverTeamScreen> createState() => _DiverTeamScreenState();
}

final DiverTeamController diverTeamController = Get.find<DiverTeamController>();
const List<Tab> myTabs = <Tab>[
  Tab(text: 'Đang hoạt động'),
  Tab(text: 'Đã xoá'),
];

late TabController _tabController;

class _DiverTeamScreenState extends State<DiverTeamScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    diverTeamController.tabIndexNew = 0;
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
          'Đội thợ lặn',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<DiverTeamController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.only(top: 8.0),
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
                    diverTeamController.tabIndexNew = tabController.index;

                    diverTeamController.getListDiverTeam();
                  }
                });

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: myTabs,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: myTabs.map((Tab tab) {
                          return GetBuilder<DiverTeamController>(
                            builder: (controller) => (controller
                                    .isLoading.isTrue)
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : controller.listDiverTeam.isEmpty &&
                                        controller.isLoading.isFalse
                                    ? _emptyTask()
                                    : ListView.builder(
                                        itemCount:
                                            controller.listDiverTeam.length,
                                        itemBuilder: ((context, index) {
                                          return DiverTeamCard(
                                            diverTeam:
                                                controller.listDiverTeam[index],
                                          );
                                        }),
                                      ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
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
}
