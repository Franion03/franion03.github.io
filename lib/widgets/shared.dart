import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/constants.dart';
import '../config/theme.dart';

class SectionHeader extends StatelessWidget {
  final String comment;
  final String title;
  final String? subtitle;
  const SectionHeader({
    super.key,
    required this.comment,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(comment, style: AppTheme.sectionComment),
        const SizedBox(height: 12),
        Text(title, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(subtitle!, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
        ],
      ],
    );
  }
}

class TechTag extends StatelessWidget {
  final String label;
  const TechTag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: accentColor.withValues(alpha: 0.15)),
      ),
      child: Text(
        label,
        style: GoogleFonts.jetBrainsMono(
          color: accentColor.withValues(alpha: 0.85),
          fontSize: 9,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class SkillBar extends StatelessWidget {
  final String name;
  final int percentage;
  const SkillBar({super.key, required this.name, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: GoogleFonts.jetBrainsMono(color: headingColor, fontSize: 12)),
              Text('$percentage%', style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: surfaceColor,
              color: accentColor,
              minHeight: 4,
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String number;
  final String label;
  const StatCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(number, style: AppTheme.statNumber),
        const SizedBox(height: 4),
        Text(label, style: AppTheme.statLabel, textAlign: TextAlign.center),
      ],
    );
  }
}
