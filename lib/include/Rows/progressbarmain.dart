import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';

class SkillBarDesk extends StatelessWidget {
  const SkillBarDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Proficiency',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Frontend/Design',
            style: TextStyle(fontSize: 18),
          ),
          RoundedProgressBar(
            style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
            margin: const EdgeInsets.symmetric(vertical: 16),
            borderRadius: BorderRadius.circular(24),
            percent: 90,
          ),
          const Text(
            'Adobe Photoshop/Premiere pro',
            style: TextStyle(fontSize: 18),
          ),
          RoundedProgressBar(
            style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
            margin: const EdgeInsets.symmetric(vertical: 16),
            borderRadius: BorderRadius.circular(24),
            percent: 75,
          ),
          const Text(
            'Programming',
            style: TextStyle(fontSize: 18),
          ),
          RoundedProgressBar(
            style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
            margin: const EdgeInsets.symmetric(vertical: 16),
            borderRadius: BorderRadius.circular(24),
            percent: 60,
          ),
        ],
      ),
    );
  }
}

class SkillBarTab extends StatelessWidget {
  const SkillBarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Proficiency',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 50),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Frontend/Design',
              style: TextStyle(fontSize: 18),
            ),
            RoundedProgressBar(
              style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
              margin: const EdgeInsets.symmetric(vertical: 16),
              borderRadius: BorderRadius.circular(24),
              percent: 90,
            ),
            const Text(
              'Adobe Photoshop/Premiere pro',
              style: TextStyle(fontSize: 18),
            ),
            RoundedProgressBar(
              style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
              margin: const EdgeInsets.symmetric(vertical: 16),
              borderRadius: BorderRadius.circular(24),
              percent: 75,
            ),
            const Text(
              'Programming',
              style: TextStyle(fontSize: 18),
            ),
            RoundedProgressBar(
              style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
              margin: const EdgeInsets.symmetric(vertical: 16),
              borderRadius: BorderRadius.circular(24),
              percent: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class SkillBarMob extends StatelessWidget {
  const SkillBarMob({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Proficiency',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Frontend/Design',
              style: TextStyle(fontSize: 18),
            ),
            RoundedProgressBar(
              style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
              margin: const EdgeInsets.symmetric(vertical: 16),
              borderRadius: BorderRadius.circular(24),
              percent: 90,
            ),
            const Text(
              'Adobe Photoshop/Premiere pro',
              style: TextStyle(fontSize: 18),
            ),
            RoundedProgressBar(
              style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
              margin: const EdgeInsets.symmetric(vertical: 16),
              borderRadius: BorderRadius.circular(24),
              percent: 75,
            ),
            const Text(
              'Programming',
              style: TextStyle(fontSize: 18),
            ),
            RoundedProgressBar(
              style: RoundedProgressBarStyle(borderWidth: 0, widthShadow: 0),
              margin: const EdgeInsets.symmetric(vertical: 16),
              borderRadius: BorderRadius.circular(24),
              percent: 60,
            ),
          ],
        ),
      ),
    );
  }
}
