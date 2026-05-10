import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/constants.dart';

class NavBar extends StatelessWidget {
  final VoidCallback? onTapAbout;
  final VoidCallback? onTapProjects;
  final VoidCallback? onTapSkills;
  final VoidCallback? onTapExperience;
  final VoidCallback? onTapCerts;
  final VoidCallback? onTapContact;

  const NavBar({
    super.key,
    this.onTapAbout,
    this.onTapProjects,
    this.onTapSkills,
    this.onTapExperience,
    this.onTapCerts,
    this.onTapContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.9),
        border: const Border(bottom: BorderSide(color: borderColor)),
      ),
      child: Row(
        children: [
          Text(
            'franquiles',
            style: GoogleFonts.jetBrainsMono(
              color: accentColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 700) ...[
            _NavLink(label: 'About', onTap: onTapAbout),
            _NavLink(label: 'Projects', onTap: onTapProjects),
            _NavLink(label: 'Skills', onTap: onTapSkills),
            _NavLink(label: 'Experience', onTap: onTapExperience),
            _NavLink(label: 'Certifications', onTap: onTapCerts),
            _NavLink(label: 'Contact', onTap: onTapContact),
          ] else
            IconButton(
              icon: const Icon(Icons.menu, color: accentColor),
              onPressed: () {},
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const _NavLink({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            color: bodyTextColor,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
