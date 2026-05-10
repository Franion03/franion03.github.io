import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/CenteringOfPages/proficiency.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const ProgressBarMob(),
      desktop: (BuildContext context) => const ProgressBarDesk(),
      tablet: (BuildContext context) => const ProgressBarTab(),
    );
  }
}
