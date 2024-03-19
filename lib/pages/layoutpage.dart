import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../configure/routing.dart';
import '../include/navbar/drawer/drawernav.dart' as drawer;

import '../configure/navigation_service.dart';
import '../include/navbar/navigationbar.dart' as navigation;

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        endDrawer: drawer.NavigationDrawer(),
        endDrawerEnableOpenDragGesture: false,
        
        body: Column(
          children: <Widget>[
            navigation.NavigationBar(),




            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: HomeRoute,
              ),
            )
          ],
        ),
      ),
    );
  }
}