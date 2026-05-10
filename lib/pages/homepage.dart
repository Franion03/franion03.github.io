import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../configure/centeredview.dart';
import '../include/homepage/homemain.dart';
import '../include/navbar/drawer/drawernav.dart' as drawer;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        endDrawer: const drawer.NavigationDrawer(),
        endDrawerEnableOpenDragGesture: false,
        body: Column(
          children: <Widget>[
            Expanded(
              child: ScreenTypeLayout.builder(
                mobile: (BuildContext context) =>
                    CenteredViewMob(child: HomeMobile()),
                desktop: (BuildContext context) =>
                    const CenteredViewDesk(child: HomeDesktop()),
                tablet: (BuildContext context) =>
                    CenteredViewTab(child: HomeTab()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
