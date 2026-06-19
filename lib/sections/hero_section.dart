import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../config/theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onViewProjects;
  final VoidCallback? onContact;
  const HeroSection({super.key, this.onViewProjects, this.onContact});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: [
          // Availability badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: accentColor.withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7, height: 7,
                  decoration: BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: accentColor.withValues(alpha: 0.5), blurRadius: 6)],
                  ),
                ),
                const SizedBox(width: 8),
                Text('Available for new projects',
                  style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Name
          Text('Francisco Javier\nQuiles Ruiz',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: isMobile ? 36 : 48)),
          const SizedBox(height: 12),
          // Handle
          Text('@franion03', style: AppTheme.sectionComment),
          const SizedBox(height: 20),
          // Tagline
          Text(
            'MLOps Engineer building production ML systems —\nfrom training pipelines to model serving at scale. Bridging ML and infrastructure.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 32),
          // CTAs
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              _PrimaryButton(label: 'View Projects', onTap: onViewProjects ?? () {}),
              _SecondaryButton(label: 'Download CV', onTap: () {
                launchUrl(Uri.parse('CV.pdf'));
              }),
              _SecondaryButton(label: 'Get in Touch', onTap: onContact ?? () {}),
            ],
          ),
          const SizedBox(height: 24),
          // Social icons
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(icon: Icons.code, url: 'https://github.com/franion03'),
              SizedBox(width: 16),
              _SocialIcon(icon: Icons.link, url: 'https://www.linkedin.com/in/francisco-javier-quiles-ruiz-b25563195/'),
            ],
          ),
          const SizedBox(height: 40),
          // Scroll indicator
          Text('scroll', style: AppTheme.sectionComment),
          const SizedBox(height: 4),
          Icon(Icons.keyboard_arrow_down, color: accentColor.withValues(alpha: 0.5), size: 18),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: accentColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(label, style: GoogleFonts.jetBrainsMono(
          color: bgColor, fontSize: 12, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SecondaryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: accentColor.withValues(alpha: 0.3)),
        ),
        child: Text(label, style: GoogleFonts.jetBrainsMono(
          color: accentColor, fontSize: 12, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: borderColor),
        ),
        child: Icon(icon, color: bodyTextColor, size: 18),
      ),
    );
  }
}
