import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/CenteringOfPages/proficiency.dart';

class ProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => ProgressBarMob(),
       desktop: (BuildContext context) => ProgressBarDesk(),
       tablet: (BuildContext context) => ProgressBarTab(),    
    );
  }
}
