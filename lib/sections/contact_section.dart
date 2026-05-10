import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../widgets/shared.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: sectionPadding),
      child: Column(
        children: [
          const SectionHeader(
            comment: '// contact',
            title: "Let's Build Something",
            subtitle: 'Have a project in mind? Always open to discussing new opportunities.',
          ),
          const SizedBox(height: 48),
          // Email
          InkWell(
            onTap: () => launchUrl(Uri.parse('mailto:fran.quiles00@gmail.com')),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: accentColor.withValues(alpha: 0.2)),
              ),
              child: Text('fran.quiles00@gmail.com',
                style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 16)),
            ),
          ),
          const SizedBox(height: 24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialLink(label: 'GitHub', url: 'https://github.com/franion03'),
              SizedBox(width: 24),
              _SocialLink(label: 'LinkedIn', url: 'https://www.linkedin.com/in/francisco-javier-quiles-ruiz-b25563195/'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatelessWidget {
  final String label;
  final String url;
  const _SocialLink({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Text(label, style: GoogleFonts.jetBrainsMono(
        color: bodyTextColor, fontSize: 12,
        decoration: TextDecoration.underline,
        decorationColor: accentColor.withValues(alpha: 0.3),
      )),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 32),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: borderColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '© 2026 ', style: GoogleFonts.jetBrainsMono(color: bodyTextColor, fontSize: 10)),
                TextSpan(text: 'Francisco Javier Quiles Ruiz', style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 10)),
                TextSpan(text: '. All rights reserved.', style: GoogleFonts.jetBrainsMono(color: bodyTextColor, fontSize: 10)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
