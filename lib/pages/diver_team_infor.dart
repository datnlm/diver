import 'package:diver/controller/diver_team_controller.dart';
import 'package:diver/widgets/information_diver.dart';
import 'package:diver/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiverTeamInformation extends StatefulWidget {
  const DiverTeamInformation({Key? key}) : super(key: key);

  @override
  _DiverTeamInformationState createState() => _DiverTeamInformationState();
}

class _DiverTeamInformationState extends State<DiverTeamInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Thành viên',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<DiverTeamController>(
        builder: (controller) => (controller.isLoading.isTrue)
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: (_, __) => const Divider(),
                itemCount: controller.diverTeam.divers!.length,
                itemBuilder: ((context, index) {
                  return InformationDiverCard(
                      diver: controller.diverTeam.divers![index]);
                }),
              ),
      ),
    );
  }
}
