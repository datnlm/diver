import 'package:diver/controller/survey_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:diver/widgets/cell_card.dart';
import 'package:diver/widgets/task_group.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  _PhotoScreenState createState() => _PhotoScreenState();
}

final SurveyController _surveyController = Get.find<SurveyController>();

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        // color: kBackgroundColor,
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () => print('ec ec'),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  dashPattern: [8, 4],
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://icdn.dantri.com.vn/thumb_w/640/2019/07/28/gopr-18761548034300028-1564283102441.jpg',
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      // child: Image.network(
                      //   'https://www.innovations-report.com/wp-content/uploads/post-pictures/corals_692440-750x563.jpg',
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () => _surveyController.pickImage(false),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  dashPattern: [8, 4],
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
