import 'package:cached_network_image/cached_network_image.dart';
import 'package:diver/controller/auth_controller.dart';
import 'package:diver/controller/information_controller.dart';
import 'package:diver/core/routes/routes.dart';
import 'package:diver/services/localization.dart';
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
  bool _value = false;
  int val = 0;

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
        onTap: () => showAlertDialog(context, _authController),
        leading: const SizedBox(
          height: double.infinity,
          child: Icon(
            Icons.logout,
            color: Colors.redAccent,
          ),
        ),
        title: Text(
          'logout'.tr,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Card _config() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () => showChangeLangueDialog(context),
        leading: const SizedBox(
          height: double.infinity,
          child: Icon(
            Icons.language,
            color: Color(0xFF6F35A5),
          ),
        ),
        title: Text(
          'language'.tr,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('languageValue'.tr),
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

  showChangeLangueDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: const Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: 120,
            width: 10,
            child: Column(
              children: [
                Expanded(
                  child: RadioListTile(
                    title: Text(
                      'vietnamese'.tr,
                    ),
                    value: 0,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        LocalizationService.changeLocale(
                            LocalizationService.langCodes[0]);
                        val = int.parse(value.toString());
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
                Expanded(
                  child: RadioListTile(
                    title: Text('english'.tr),
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        LocalizationService.changeLocale(
                            LocalizationService.langCodes[1]);
                        val = int.parse(value.toString());
                      });
                    },
                    activeColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  showAlertDialog(BuildContext context, AuthController authController) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: const Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              Text(
                "logout".tr,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              //Would you like to delete this image?
              Text('logout-message'.tr),
              const SizedBox(height: 20),
              const Divider(
                height: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: InkWell(
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    authController.logout();
                    Get.back();
                  },
                  child: Center(
                    child: Text(
                      'confirm'.tr,
                      // "Xác nhận".tr,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: InkWell(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  highlightColor: Colors.grey[200],
                  onTap: () => Get.back(),
                  child: Center(
                    child: Text(
                      'cancel'.tr,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
