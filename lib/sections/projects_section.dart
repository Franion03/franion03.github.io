import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/constants.dart';
import '../config/theme.dart';
import '../data/projects.dart';
import '../widgets/shared.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
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
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 1 : (constraints.maxWidth > 1100 ? 3 : 2);
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.72,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: projects.length,
                itemBuilder: (_, i) => _ProjectCard(project: projects[i]),
              );
            },
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
          padding: const EdgeInsets.all(20),
          decoration: AppTheme.cardDecoration(hovered: _hovered),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.project.title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 12),
              Expanded(
                child: Text(widget.project.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 4, overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 4, runSpacing: 4,
                children: widget.project.tags.map((t) => TechTag(label: t)).toList(),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text('View Project →',
                    style: GoogleFonts.jetBrainsMono(
                      color: _hovered ? accentColor : bodyTextColor, fontSize: 11)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
