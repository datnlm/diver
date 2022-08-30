import 'package:diver/controller/diver_team_controller.dart';
import 'package:diver/pages/diver_team.dart';
import 'package:diver/widgets/information_diver.dart';
import 'package:diver/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/information_area_card.dart';

class DiverTeamInformation extends StatefulWidget {
  const DiverTeamInformation({Key? key}) : super(key: key);

  @override
  _DiverTeamInformationState createState() => _DiverTeamInformationState();
}

class _DiverTeamInformationState extends State<DiverTeamInformation>
    with TickerProviderStateMixin {
  static List<Tab> myTabs = <Tab>[
    Tab(text: 'member-list'.tr),
    Tab(text: 'area'.tr),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
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
        centerTitle: true,
        title: Text(
          'team-infor'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: Padding(
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
                }
              });
              return GetBuilder<DiverTeamController>(
                builder: (controller) => TabBarView(
                  controller: _tabController,
                  children: [
                    controller.isLoading.isTrue
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            separatorBuilder: (_, __) => const Divider(),
                            itemCount: controller.diverTeam.divers!.length,
                            itemBuilder: ((context, index) {
                              return InformationDiverCard(
                                  diver: controller.diverTeam.divers![index]);
                            }),
                          ),
                    controller.isLoading.isTrue
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            separatorBuilder: (_, __) => const Divider(),
                            itemCount: controller.diverTeam.areas!.length,
                            itemBuilder: ((context, index) {
                              return InformationAreaCard(
                                  area: controller.diverTeam.areas![index]);
                            }),
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
