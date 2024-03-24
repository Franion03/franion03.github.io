
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/CenteringOfPages/skills_desk.dart';

class SkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => SkillsMob(),
       desktop: (BuildContext context) => SkillsDesk(),
       tablet: (BuildContext context) => SkillsTab(),    
    );
  }
}
