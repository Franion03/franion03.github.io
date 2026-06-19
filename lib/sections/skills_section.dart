import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../data/skills.dart';
import '../widgets/shared.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: sectionPadding),
      child: Column(
        children: [
          const SectionHeader(
            comment: '// skills',
            title: 'Tech Stack',
            subtitle: 'MLOps, ML Engineering, and Cloud Infrastructure.',
          ),
          const SizedBox(height: 48),
          isMobile
              ? const Column(children: [
                  _SkillCategory(title: 'Infrastructure & Cloud', skills: devopsSkills),
                  SizedBox(height: 32),
                  _SkillCategory(title: 'ML Engineering', skills: devSkills),
                  SizedBox(height: 32),
                  _SkillCategory(title: 'MLOps & Platforms', skills: securitySkills),
                ])
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _SkillCategory(title: 'Infrastructure & Cloud', skills: devopsSkills)),
                    SizedBox(width: largePadding),
                    Expanded(child: _SkillCategory(title: 'ML Engineering', skills: devSkills)),
                    SizedBox(width: largePadding),
                    Expanded(child: _SkillCategory(title: 'MLOps & Platforms', skills: securitySkills)),
                  ],
                ),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatelessWidget {
  final String title;
  final List<SkillData> skills;
  const _SkillCategory({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16)),
        const SizedBox(height: 20),
        ...skills.map((s) => SkillBar(name: s.name, percentage: s.percentage)),
      ],
    );
  }
}
