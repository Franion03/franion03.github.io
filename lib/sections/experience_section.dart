import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/constants.dart';
import '../config/theme.dart';
import '../data/experience.dart';
import '../widgets/shared.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: sectionPadding),
      child: Column(
        children: [
          const SectionHeader(
            comment: '// experience',
            title: "Where I've Worked",
            subtitle: 'From startups to enterprise — scaling infrastructure.',
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: experience.map((e) => _ExperienceCard(data: e, isMobile: isMobile)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final ExperienceData data;
  final bool isMobile;
  const _ExperienceCard({required this.data, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline bar
          if (!isMobile)
            SizedBox(
              width: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.period,
                    style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 11)),
                ],
              ),
            ),
          // Content card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: AppTheme.cardDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isMobile) ...[
                    Text(data.period,
                      style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 11)),
                    const SizedBox(height: 6),
                  ],
                  Text(data.company,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18)),
                  const SizedBox(height: 2),
                  Text(data.role,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 13)),
                  const SizedBox(height: 12),
                  Text(data.description,
                    style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 4, runSpacing: 4,
                    children: data.tags.map((t) => TechTag(label: t)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
