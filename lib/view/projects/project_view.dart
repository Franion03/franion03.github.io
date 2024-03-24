import 'package:flutter/material.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/projects_grid.dart';
import 'components/title_text.dart';
class ProjectsView extends StatelessWidget {
  ProjectsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(Responsive.isLargeMobile(context))const SizedBox(
                height: defaultPadding,
              ),
              const TitleText(prefix: 'Latest', title: 'Projects'),
              const SizedBox(
                height: defaultPadding,
              ),
              Responsive(
                  desktop: ProjectGrid(crossAxisCount: 3,),
                  extraLargeScreen: ProjectGrid(crossAxisCount: 4,),
                  largeMobile: ProjectGrid(crossAxisCount: 1,ratio: 1.8),
                  mobile: ProjectGrid(crossAxisCount: 1,ratio: 1.5),
                  tablet: ProjectGrid(ratio: 1.4,crossAxisCount: 2,))
                  ],
                );
  }
}







