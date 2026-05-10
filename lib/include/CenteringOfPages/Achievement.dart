import '../Rows/achievementsmain.dart';
import 'package:flutter/material.dart';

class AchievementDesk extends StatelessWidget {
  const AchievementDesk({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: <Widget>[
          Expanded(child: AchieveDesk()),
        ],
      ),
    );
  }
}

class AchievementMob extends StatelessWidget {
  const AchievementMob({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[AchieveMob()],
      ),
    );
  }
}

class AchievementTab extends StatelessWidget {
  const AchievementTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AchieveTab(),
        ],
      ),
    );
  }
}
