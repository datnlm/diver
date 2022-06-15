import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:diver/widgets/cell_card.dart';
import 'package:diver/widgets/task_group.dart';
import 'package:dotted_border/dotted_border.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Survey"),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 60,
                          ),
                          Text(
                            '#01',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 60,
                          ),
                          Text(
                            '#02',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 60,
                          ),
                          Text(
                            '#03',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                      child: Image.network(
                        'https://www.innovations-report.com/wp-content/uploads/post-pictures/corals_692440-750x563.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 60,
                          ),
                          Text(
                            '#04',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: GestureDetector(
                onTap: () => print('ec ec'),
                onLongPress: () => print('cap cap'),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(12),
                  dashPattern: [8, 4],
                  padding: EdgeInsets.all(6),
                  child: const TaskGroupContainer(
                    color: Colors.blue,
                    isSmall: true,
                    icon: Icons.camera_alt_outlined,
                    taskGroup: "#01",
                    taskCount: 0,
                  ),
                ),
              ),
            ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 1,
            //   mainAxisCellCount: 1,
            //   child: GestureDetector(
            //     onTap: () => print('ec ec'),
            //     child: const TaskGroupContainer(
            //       color: Colors.cyan,
            //       isSmall: true,
            //       icon: Icons.camera_alt_outlined,
            //       taskCount: 5,
            //       taskGroup: "Photo",
            //     ),
            //   ),
            // ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 1,
            //   mainAxisCellCount: 1,
            //   child: GestureDetector(
            //     onTap: () => print('ec ec'),
            //     child: const TaskGroupContainer(
            //       color: Colors.orange,
            //       isSmall: true,
            //       icon: Icons.camera_alt_outlined,
            //       taskCount: 5,
            //       taskGroup: "Photo",
            //     ),
            //   ),
            // ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 1,
            //   mainAxisCellCount: 1,
            //   child: GestureDetector(
            //     onTap: () => print('ec ec'),
            //     child: const TaskGroupContainer(
            //       color: Colors.cyan,
            //       isSmall: true,
            //       icon: Icons.camera_alt_outlined,
            //       taskCount: 5,
            //       taskGroup: "Photo",
            //     ),
            //   ),
            // ),

            // StaggeredGridTile.count(
            //   crossAxisCellCount: 1,
            //   mainAxisCellCount: 1.3,
            //   child: TaskGroupContainer(
            //     color: Colors.green,
            //     icon: Icons.article,
            //     taskCount: 2,
            //     taskGroup: "Blog",
            //   ),
            // ),
            // StaggeredGridTile.count(
            //   crossAxisCellCount: 1,
            //   mainAxisCellCount: 1,
            //   child: TaskGroupContainer(
            //     color: Colors.blue,
            //     isSmall: true,
            //     icon: Icons.single_bed_sharp,
            //     taskCount: 9,
            //     taskGroup: "Sleep",
            //   ),
            // ),
          ],
        ),
        // child: StaggeredGrid.count(
        //   crossAxisCount: 3,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   children: [
        //     CellCard(),
        //     // InkWell(
        //     //   onTap: () {},
        //     //   child: Container(
        //     //       decoration: const BoxDecoration(
        //     //           borderRadius: BorderRadius.only(
        //     //               bottomLeft: Radius.circular(5),
        //     //               bottomRight: Radius.circular(5)),
        //     //           color: Colors.white),
        //     //       child: const Center(child: Text('Load More...'))),
        //     // ),
        //   ],

        //   // staggeredTileBuilder: (index) {
        //   //   return const StaggeredTile.count(1, 1.7);
        //   // }),
        // ),
      ),
    );
  }
}
