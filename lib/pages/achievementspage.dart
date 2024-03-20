import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/CenteringOfPages/Achievement.dart';

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: AchievementDesk(),
      tablet: AchievementTab(),
      mobile: AchievementMob(),      
    );
  }
}