import 'package:diver/controller/information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationDiverScreen extends StatefulWidget {
  const InformationDiverScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InformationDiverScreenState createState() => _InformationDiverScreenState();
}

class _InformationDiverScreenState extends State<InformationDiverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'information'.tr,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GetBuilder<InformationController>(
        builder: (controller) => ListView(
          // padding: EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Stack(
                children: [
                  ClipOval(
                    child: Material(
                      color: Colors.transparent,
                      child: Ink.image(
                        image: NetworkImage(controller.diver.imageUrl!),
                        fit: BoxFit.cover,
                        width: 128,
                        height: 128,
                        child: InkWell(
                          onTap: () => showModalBottomSheet<void>(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return _pickupImage(context, controller);
                              }),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: buildEditIcon(Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            _information(context, controller),
          ],
        ),
      ),
    );
  }

  SizedBox _pickupImage(
      BuildContext context, InformationController controller) {
    return SizedBox(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: ListTile.divideTiles(context: context, tiles: [
                      ListTile(
                        onTap: () => controller.pickImage(true),
                        title: Center(
                          child: Text(
                            'camera'.tr,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () => controller.pickImage(false),
                        title: Center(
                          child: Text(
                            'photo'.tr,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.blueAccent),
                          ),
                        ),
                      ),
                    ]).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Text(
                        'cancel'.tr,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.blueAccent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Card _information(BuildContext context, InformationController controller) {
    return Card(
      child: ListView(
          shrinkWrap: true,
          children: ListTile.divideTiles(context: context, tiles: [
            ListTile(
              onTap: () => controller.initTextField('name'),
              minLeadingWidth: 85,
              leading: Text(
                'name'.tr,
                style: const TextStyle(fontSize: 16),
              ),
              title: Text('${controller.diver.name}',
                  style: const TextStyle(fontSize: 18)),
            ),
            ListTile(
              minLeadingWidth: 85,
              leading: Text(
                'email'.tr,
                style: const TextStyle(fontSize: 16),
              ),
              title: Text(
                '${controller.diver.email}',
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                'organization-email'.tr,
                style: const TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ),
            ListTile(
              onTap: () => controller.initTextField('phone'),
              minLeadingWidth: 85,
              leading: Text(
                'phone'.tr,
                style: const TextStyle(fontSize: 16),
              ),
              title: Text('${controller.diver.phone}',
                  style: const TextStyle(fontSize: 18)),
            ),
            ListTile(
              onTap: () => controller.initTextField('address'),
              minLeadingWidth: 85,
              leading: Text(
                'address'.tr,
                style: const TextStyle(fontSize: 16),
              ),
              title: Text(
                '${controller.diver.address}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ]).toList()),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
