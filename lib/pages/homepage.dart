import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../configure/centeredview.dart';
import '../include/homepage/homemain.dart';
import '../include/navbar/drawer/drawernav.dart' as drawer;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
          builder:(context, sizingInformation) => Scaffold(
            endDrawer:drawer.NavigationDrawer(),
            endDrawerEnableOpenDragGesture: false,
        
        body: Column(
          
              children: <Widget>[
                
              Expanded(
         child: ScreenTypeLayout(
           mobile: CenteredViewMob(child: HomeMobile()),
           desktop: CenteredViewDesk(child: HomeDesktop()),
           tablet: CenteredViewTab(child: HomeTab()),
         ),
          ),
              ],
            ),
      ),
    );
  }
}