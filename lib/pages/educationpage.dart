import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/educationmain.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => const EduDesk(),
      tablet: (BuildContext context) => const EduTab(),
      mobile: (BuildContext context) => const EduMob(),
    );
  }
}
