import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../models/cell_survey.dart';

class CellImageCard extends StatelessWidget {
  final int imageIndex;
  const CellImageCard({Key? key, required this.imageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SurveyController _surveyController = Get.find<SurveyController>();

    return Stack(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: const [8, 4],
          padding: const EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: _surveyController.listImage.isNotEmpty ||
                        _surveyController.cellResponse.images!.isNotEmpty
                    ? GetBuilder<SurveyController>(
                        builder: (controller) => controller.listImage.length ==
                                imageIndex -
                                    (controller.cellResponse.images!.isNotEmpty
                                        ? controller.cellResponse.images!.length
                                        : 0)
                            ? pickupImage(context, _surveyController)
                            : imageIndex -
                                        (controller
                                                .cellResponse.images!.isNotEmpty
                                            ? controller
                                                .cellResponse.images!.length
                                            : 0) <
                                    0
                                ? netWorkImage(controller)
                                : imageFile(controller),
                      )
                    : pickupImage(context, _surveyController)),
          ),
        ),
        if (imageIndex <
            _surveyController.cellResponse.images!.length +
                _surveyController.listImage.length)
          deleteIcon(context, _surveyController),
      ],
    );
  }

  Positioned deleteIcon(
      BuildContext context, SurveyController surveyController) {
    return Positioned(
      bottom: 0,
      right: 4,
      child: GestureDetector(
        onTap: () => showAlertDialog(context, surveyController),
        child: buildDeleteIcon(Theme.of(context).colorScheme.primary),
      ),
    );
  }

  showAlertDialog(BuildContext context, SurveyController surveyController) {
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
              const Text(
                "Xoá ảnh",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              //Would you like to delete this image?
              const Text("Bạn có muốn xóa hình ảnh này không?"),
              const SizedBox(height: 20),
              const Divider(
                height: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: InkWell(
                  highlightColor: Colors.grey[200],
                  onTap: () => surveyController.deleteImage(imageIndex),
                  child: const Center(
                    child: Text(
                      "Xoá",
                      style: TextStyle(
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
                  child: const Center(
                    child: Text(
                      "Huỷ",
                      style: TextStyle(
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

  Image imageFile(SurveyController controller) {
    return Image.file(
        controller.listImage[imageIndex -
            (controller.cellResponse.images!.isNotEmpty
                ? controller.cellResponse.images!.length
                : 0)],
        fit: BoxFit.cover);
  }

  GestureDetector pickupImage(
      BuildContext context, SurveyController surveyController) {
    return GestureDetector(
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
            return _pickupImage(context, surveyController);
          }),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.add,
            size: 60,
          ),
        ],
      ),
    );
  }

  SizedBox _pickupImage(BuildContext context, SurveyController controller) {
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
                        onTap: () {
                          Get.back();
                          controller.pickImage(true);
                        },
                        title: const Center(
                          child: Text(
                            'Chụp ảnh',
                            style: TextStyle(
                                fontSize: 18, color: Colors.blueAccent),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Get.back();
                          controller.pickImage(false);
                        },
                        title: const Center(
                          child: Text(
                            'Chọn ảnh',
                            style: TextStyle(
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
                    onTap: () => Get.back(),
                    title: const Center(
                      child: Text(
                        'Huỷ',
                        style:
                            TextStyle(fontSize: 18, color: Colors.blueAccent),
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

  CachedNetworkImage netWorkImage(SurveyController controller) {
    return CachedNetworkImage(
      imageUrl: controller.cellResponse.images![imageIndex].imageUrl ?? '',
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget buildDeleteIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.delete,
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
