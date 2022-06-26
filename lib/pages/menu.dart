import 'package:cached_network_image/cached_network_image.dart';
import 'package:diver/controller/auth_controller.dart';
import 'package:diver/controller/information_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MenuScreenState createState() => _MenuScreenState();
}

final AuthController _authController = Get.find<AuthController>();

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Menu',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<InformationController>(
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
                  child: Skeleton(
                    isLoading: controller.isLoading.isTrue ? true : false,
                    skeleton: _profileSkeleton(context),
                    child: controller.diver.imageUrl != null
                        ? _profile(controller)
                        : const Loading(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              _config(),
              const SizedBox(
                height: 10.0,
              ),
              _logout(),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _profileSkeleton(BuildContext context) {
    return ListTile(
      leading: const SkeletonAvatar(
        style:
            SkeletonAvatarStyle(shape: BoxShape.circle, width: 60, height: 60),
      ),
      title: SkeletonLine(
        style: SkeletonLineStyle(
            height: 14,
            width: MediaQuery.of(context).size.width / 2,
            borderRadius: BorderRadius.circular(8)),
      ),
      subtitle: SkeletonLine(
        style: SkeletonLineStyle(
            height: 10,
            width: MediaQuery.of(context).size.width / 3,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Card _logout() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => _authController.logout(),
        leading: const SizedBox(
          height: double.infinity,
          child: Icon(Icons.logout),
        ),
        title: const Text(
          'Đăng xuất',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Card _config() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
            subtitle: const Text('Việt Nam'),
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
    );
  }

  ListTile _profile(InformationController controller) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.information),
      leading: CircleAvatar(
        radius: 29,
        backgroundColor: Colors.transparent,
        backgroundImage: CachedNetworkImageProvider(
          controller.diver.imageUrl ?? '',
        ),
      ),
      title: Text(
        '${controller.diver.name}',
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Text('${controller.diver.email}'),
      trailing: const Icon(
        Icons.navigate_next,
      ),
    );
  }
}
