import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/CenteringOfPages/Achievement.dart';

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => AchievementDesk(),
       tablet: (BuildContext context) => AchievementTab(),
       mobile: (BuildContext context) => AchievementMob(),
    );
  }
}