import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../widgets/shared.dart';

class WritingSection extends StatelessWidget {
  const WritingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: sectionPadding),
      child: Column(
        children: [
          const SectionHeader(
            comment: '// writing',
            title: 'Thought Leadership',
            subtitle: 'Articles on MLOps, ML pipelines, and production ML systems.',
          ),
          const SizedBox(height: 48),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: _articles.isEmpty
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: borderColor),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.edit_note, color: accentColor.withValues(alpha: 0.4), size: 48),
                          const SizedBox(height: 16),
                          Text('Coming Soon',
                            style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text(
                            'Technical articles on MLOps pipelines, model serving at scale,\nand GitOps for ML are in the works.',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    )
                  : Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      alignment: WrapAlignment.center,
                      children: _articles.map((a) => _ArticleCard(article: a)).toList(),
                    ),
            ),
          ),
          const SizedBox(height: 32),
          if (_articles.isNotEmpty)
          InkWell(
            onTap: () => launchUrl(Uri.parse('https://dev.to/franion03')),
            borderRadius: BorderRadius.circular(4),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: accentColor.withValues(alpha: 0.3)),
              ),
              child: Text('Read more on dev.to →', style: GoogleFonts.jetBrainsMono(
                color: accentColor, fontSize: 12, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final _Article article;
  const _ArticleCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(article.url)),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Platform badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: accentColor.withValues(alpha: 0.15)),
              ),
              child: Text(article.platform, style: GoogleFonts.jetBrainsMono(
                color: accentColor, fontSize: 9, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 12),
            Text(article.title,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8),
            Text(article.excerpt,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(article.date, style: GoogleFonts.jetBrainsMono(
                  color: bodyTextColor, fontSize: 10)),
                const Spacer(),
                Text('Read →', style: GoogleFonts.jetBrainsMono(
                  color: accentColor, fontSize: 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Article {
  final String title;
  final String excerpt;
  final String url;
  final String platform;
  final String date;
  const _Article({
    required this.title,
    required this.excerpt,
    required this.url,
    required this.platform,
    required this.date,
  });
}

const _articles = [
];