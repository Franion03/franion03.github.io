import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/CenteringOfPages/Achievement.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => const AchievementDesk(),
      tablet: (BuildContext context) => const AchievementTab(),
      mobile: (BuildContext context) => const AchievementMob(),
    );
  }
}
