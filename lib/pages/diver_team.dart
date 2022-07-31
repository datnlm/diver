import 'package:cached_network_image/cached_network_image.dart';
import 'package:diver/controller/diver_team_controller.dart';
import 'package:diver/widgets/diver_team_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiverTeamScreen extends StatefulWidget {
  const DiverTeamScreen({Key? key}) : super(key: key);

  @override
  _DiverTeamScreenState createState() => _DiverTeamScreenState();
}

class _DiverTeamScreenState extends State<DiverTeamScreen>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Đang hoạt động'),
    Tab(text: 'Tạm ngừng'),
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
        title: Text(
          'Đội thợ lặn',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        // bottom: TabBar(
        //   labelColor: Colors.black,
        //   unselectedLabelColor: Colors.grey,
        //   controller: _tabController,
        //   tabs: myTabs,
        // ),
      ),
      body: GetBuilder<DiverTeamController>(
        builder: (controller) => (controller.isLoading.isTrue)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.listDiverTeam.length,
                itemBuilder: ((context, index) {
                  return DiverTeamCard(
                    diverTeam: controller.listDiverTeam[index],
                  );
                }),
              ),
      ),

      // body: TabBarView(
      //   controller: _tabController,
      //   children: myTabs.map((Tab tab) {
      //     return GetBuilder<DiverTeamController>(
      //       builder: (controller) => (controller.isLoading.isTrue)
      //           ? const Center(child: CircularProgressIndicator())
      //           : ListView.builder(
      //               itemCount: controller.listDiverTeam.length,
      //               itemBuilder: ((context, index) {
      //                 return DiverTeamCard(
      //                   diverTeam: controller.listDiverTeam[index],
      //                 );
      //               }),
      //             ),
      //     );
      //   }).toList(),
      // ),
    );
  }
}
