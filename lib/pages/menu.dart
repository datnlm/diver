import 'package:cached_network_image/cached_network_image.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../controller/information_diver_controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Menu'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<InformationDiverController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () => Get.toNamed(Routes.information),
                    leading: CircleAvatar(
                      radius: 29,
                      backgroundImage: CachedNetworkImageProvider(
                          controller.diver.imageUrl ?? ''),
                    ),
                    title: Text(
                      '${controller.diver.name}',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    subtitle: const Text('So dien thoai'),
                    trailing: const Icon(
                      Icons.navigate_next,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () => {},
                      leading: const SizedBox(
                        height: double.infinity,
                        child: Icon(
                          Icons.language,
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                      title: const Text(
                        'Ngôn ngữ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text('Việt Nam'),
                      trailing: const Icon(
                        Icons.navigate_next,
                      ),
                    ),
                    ListTile(
                      onTap: () => {},
                      leading: const SizedBox(
                        height: double.infinity,
                        child: Icon(
                          Icons.settings,
                          color: Color(0xFF6F35A5),
                        ),
                      ),
                      title: const Text(
                        'Cấu hình khác',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: const Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () => {},
                  leading: Container(
                    height: double.infinity,
                    child: Icon(Icons.logout),
                  ),
                  title: const Text(
                    'Đăng xuất',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//  SizedBox(
//               width: MediaQuery.of(context).size.width * 0.8,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.grey[800],
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 ),
//                 onPressed: () {
//                   // Navigator.pushNamed(context, Routes.home);
//                 },
//                 child: Text('Logout'),
//               ),
//             ),