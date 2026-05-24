import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:metadata_fetch/metadata_fetch.dart';
import '../config/constants.dart';
import '../config/theme.dart';
import '../data/projects.dart';
import '../widgets/shared.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 700;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: sectionPadding),
      child: Column(
        children: [
          const SectionHeader(
            comment: '// projects',
            title: "What I've Built",
            subtitle: 'A selection of infrastructure and DevOps tools.',
          ),
          const SizedBox(height: 48),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = isMobile ? 1 : (constraints.maxWidth > 900 ? 3 : 2);
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.78,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: projects.length,
                    itemBuilder: (_, i) => _ProjectCard(project: projects[i]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectData project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _fetchPreview();
  }

  Future<void> _fetchPreview() async {
    // Use pre-fetched image from data layer (GitHub CDN, CORS-safe)
    if (widget.project.image.isNotEmpty) {
      setState(() => _imageUrl = widget.project.image);
      return;
    }
    // Only fall back to metadata_fetch if no pre-fetched image
    try {
      final data = await MetadataFetch.extract(widget.project.url);
      if (mounted && data?.image != null) {
        setState(() => _imageUrl = data!.image);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(widget.project.url)),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: AppTheme.cardDecoration(hovered: _hovered),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Preview image from URL metadata
              SizedBox(
                height: 140,
                width: double.infinity,
                child: _imageUrl != null
                    ? Image.network(_imageUrl!, fit: BoxFit.cover, errorBuilder: (_, __, ___) => _fallbackImage())
                    : _fallbackImage(),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.project.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8),
                    Text(widget.project.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 4, runSpacing: 4,
                      children: widget.project.tags.map((t) => TechTag(label: t)).toList(),
                    ),
                    const SizedBox(height: 8),
                    Text('View Project →',
                      style: GoogleFonts.jetBrainsMono(
                        color: _hovered ? accentColor : bodyTextColor, fontSize: 11)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fallbackImage() => Container(
    color: surfaceColor,
    child: Center(
      child: _imageUrl == null
          ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2, color: accentColor))
          : const Icon(Icons.code, color: borderColor, size: 40),
    ),
  );
}
