import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../model/project_model.dart';
import '../../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'project_info.dart';
class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3,  this.ratio=1.3});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: projectList.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent,
            ),
            child: ProjectStack(index: index)
        );
      },
    );
  }
}