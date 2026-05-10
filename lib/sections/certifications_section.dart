import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../config/theme.dart';
import '../model/certificate_model.dart';
import '../model/linkedin_certificates.dart';
import '../widgets/shared.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final combinedList = [...linkedinCertificates, ...certificateList];
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: sectionPadding),
      child: Column(
        children: [
          const SectionHeader(
            comment: '// certifications',
            title: 'Certifications & Licenses',
            subtitle: 'Continuous learning and professional development.',
          ),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 1 : (constraints.maxWidth > 1100 ? 3 : 2);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 1.6,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: combinedList.length,
                itemBuilder: (_, i) => _CertCard(cert: combinedList[i]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CertCard extends StatefulWidget {
  final CertificateModel cert;
  const _CertCard({required this.cert});

  @override
  State<_CertCard> createState() => _CertCardState();
}

class _CertCardState extends State<_CertCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(widget.cert.credential)),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: AppTheme.cardDecoration(hovered: _hovered),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(widget.cert.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15),
                      maxLines: 2, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(widget.cert.organization,
                style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 10)),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.cert.date,
                    style: GoogleFonts.jetBrainsMono(color: bodyTextColor, fontSize: 10)),
                  AnimatedOpacity(
                    opacity: _hovered ? 1.0 : 0.3,
                    duration: const Duration(milliseconds: 200),
                    child: Text('verify →',
                      style: GoogleFonts.jetBrainsMono(color: accentColor, fontSize: 10)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
