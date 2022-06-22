import 'package:diver/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationDiverScreen extends StatefulWidget {
  const InformationDiverScreen({Key? key}) : super(key: key);

  @override
  _InformationDiverScreenState createState() => _InformationDiverScreenState();
}

class _InformationDiverScreenState extends State<InformationDiverScreen> {
  // final InformationDiverController _informationDiverController =
  //     Get.find<InformationDiverController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) => Column(
          children: [
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Tên',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              title: Text('${controller.diver.name}',
                  style: TextStyle(fontSize: 18)),
            ),
            const Divider(),
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              title: Text('${controller.diver.email}',
                  style: TextStyle(fontSize: 18)),
            ),
            const Divider(),
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Điện thoại',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              title: Text('${controller.diver.phone}',
                  style: TextStyle(fontSize: 18)),
            ),
            const Divider(),
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Địa chỉ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              title: Text(
                '${controller.diver.address}',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
