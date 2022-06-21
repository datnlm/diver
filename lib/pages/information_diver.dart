import 'package:diver/controller/information_diver_controller.dart';
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
        title: const Text(
          'Thông tin cá nhân',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<InformationDiverController>(
        builder: (controller) => Column(
          children: [
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Tên',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              title: Text('${controller.diver.name}'),
              // title: Expanded(
              //   child: Text('${controller.diver.name}'),
              // ),

              // title: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text('Nguyen Le Man Dat'),
              //     Divider(),
              //   ],
              // ),
            ),
            const Divider(),
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              title: Text('${controller.diver.name}'),
              // title: Expanded(
              //   child: Text('${controller.diver.name}'),
              // ),
            ),
            const Divider(),
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Điện thoại',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              title: Text('0337804259'),
              // title: const Expanded(
              //   child: Text('0337804259'),
              // ),
            ),
            const Divider(),
            ListTile(
              onTap: () => {},
              minLeadingWidth: 85,
              leading: const Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  'Địa chỉ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              title: Text('FPT HCM'),
              // title: const Expanded(
              //   child: Text('FPT HCM'),
              // ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
