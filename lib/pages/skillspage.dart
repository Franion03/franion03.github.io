import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/CenteringOfPages/skills_desk.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const SkillsMob(),
      desktop: (BuildContext context) => const SkillsDesk(),
      tablet: (BuildContext context) => const SkillsTab(),
    );
  }
}
