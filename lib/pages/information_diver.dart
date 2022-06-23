import 'package:diver/controller/auth_controller.dart';
import 'package:diver/controller/information_controller.dart';
import 'package:diver/pages/information_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationDiverScreen extends StatefulWidget {
  const InformationDiverScreen({Key? key}) : super(key: key);

  @override
  _InformationDiverScreenState createState() => _InformationDiverScreenState();
}

class _InformationDiverScreenState extends State<InformationDiverScreen> {
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
      body: GetBuilder<InformationController>(
        builder: (controller) => ListView(
          // padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
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
                                // borderRadius: BorderRadius.only(
                                //     topLeft: Radius.circular(20.0),
                                //     topRight: Radius.circular(20.0)),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  // child: SizedBox(
                                  //   height:
                                  //       MediaQuery.of(context).size.height / 4,
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Card(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0),
                                                ),
                                              ),
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: ListTile.divideTiles(
                                                    context: context,
                                                    tiles: [
                                                      ListTile(
                                                        onTap: () => controller
                                                            .pickImage(true),
                                                        title: const Center(
                                                          child: Text(
                                                            'Chụp ảnh',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .blueAccent),
                                                          ),
                                                        ),
                                                      ),
                                                      ListTile(
                                                        onTap: () => controller
                                                            .pickImage(false),
                                                        title: const Center(
                                                          child: Text(
                                                            'Chọn ảnh',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .blueAccent),
                                                          ),
                                                        ),
                                                      ),
                                                    ]).toList(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0),
                                                ),
                                              ),
                                              child: ListTile(
                                                title: Center(
                                                  child: Text(
                                                    'Huỷ',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Colors.blueAccent),
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
            Card(
              child: ListView(
                  shrinkWrap: true,
                  children: ListTile.divideTiles(context: context, tiles: [
                    ListTile(
                      onTap: () => controller.initTextField('name'),
                      minLeadingWidth: 85,
                      leading: const Text(
                        'Tên',
                        style: TextStyle(fontSize: 16),
                      ),
                      title: Text('${controller.diver.name}',
                          style: const TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      minLeadingWidth: 85,
                      leading: const Text(
                        'Email',
                        style: TextStyle(fontSize: 16),
                      ),
                      title: Text(
                        '${controller.diver.email}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: const Text(
                        'Email hệ thống',
                        style:
                            TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                    ),
                    ListTile(
                      onTap: () => controller.initTextField('phone'),
                      minLeadingWidth: 85,
                      leading: const Text(
                        'Điện thoại',
                        style: TextStyle(fontSize: 16),
                      ),
                      title: Text('${controller.diver.phone}',
                          style: const TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      onTap: () => controller.initTextField('address'),
                      minLeadingWidth: 85,
                      leading: const Text(
                        'Địa chỉ',
                        style: TextStyle(fontSize: 16),
                      ),
                      title: Text(
                        '${controller.diver.address}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ]).toList()),
            ),
          ],
        ),
      ),
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
