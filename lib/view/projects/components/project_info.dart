import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart' show LinkPreviewData;

import '../../../../model/project_model.dart';
import '../../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';

class ProjectStack extends StatefulWidget {
  final int index;
  const ProjectStack({super.key, required this.index});

  @override
  State<ProjectStack> createState() => _ProjectStackState();
}

class _ProjectStackState extends State<ProjectStack>
    with SingleTickerProviderStateMixin {
  LinkPreviewData? _previewData;
  late final AnimationController _shimmerController;
  bool _fetching = true;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _fetchPreview();
  }

  Future<void> _fetchPreview() async {
    final project = projectList[widget.index];
    final data = await getLinkPreviewData(project.link);
    if (mounted) {
      setState(() {
        _previewData = data;
        _fetching = false;
      });
    }
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProjectController());
    final project = projectList[widget.index];

    return Obx(() {
      final isHovered = controller.hovers[widget.index] ?? false;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: isHovered
            ? (Matrix4.identity()
              ..translateByDouble(0.0, -8.0, 0.0, 1.0)
              ..scaleByDouble(1.02, 1.02, 1.0, 1.0))
            : Matrix4.identity(),
        child: InkWell(
          onHover: (value) => controller.onHover(widget.index, value),
          onTap: () => launchUrl(Uri.parse(project.link)),
          borderRadius: BorderRadius.circular(28),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: isHovered
                    ? [
                        BoxShadow(
                          color: Colors.pinkAccent.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                        BoxShadow(
                          color: Colors.blueAccent.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : [],
              ),
              child: _ProjectCard(
                project: project,
                previewData: _previewData,
                shimmerController: _shimmerController,
                fetching: _fetching,
                isHovered: isHovered,
              ),
            ),
          ),
        ),
      );
    });
  }
}

// ── Main card layout ────────────────────────────────────────────────────────

class _ProjectCard extends StatelessWidget {
  final Project project;
  final LinkPreviewData? previewData;
  final AnimationController shimmerController;
  final bool fetching;
  final bool isHovered;

  const _ProjectCard({
    required this.project,
    required this.previewData,
    required this.shimmerController,
    required this.fetching,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = previewData?.image?.url ?? project.image;
    final title = previewData?.title ?? project.name;
    final description = previewData?.description ?? project.description;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Top: OG image ───────────────────────────────────────────
        Expanded(
          flex: 5,
          child: _ImageSection(
            imageUrl: imageUrl,
            shimmerController: shimmerController,
            fetching: fetching,
            isHovered: isHovered,
          ),
        ),

        // ── Bottom: text + actions ──────────────────────────────────
        Expanded(
          flex: 4,
          child: _ContentSection(
            title: title,
            description: description,
            link: project.link,
            isHovered: isHovered,
          ),
        ),
      ],
    );
  }
}

// ── Image section ────────────────────────────────────────────────────────────

class _ImageSection extends StatelessWidget {
  final String imageUrl;
  final AnimationController shimmerController;
  final bool fetching;
  final bool isHovered;

  const _ImageSection({
    required this.imageUrl,
    required this.shimmerController,
    required this.fetching,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Image or shimmer
        AnimatedScale(
          scale: isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: !fetching && imageUrl.isNotEmpty
              ? Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      _ShimmerPlaceholder(shimmerController),
                  loadingBuilder: (_, child, progress) =>
                      progress == null ? child : _ShimmerPlaceholder(shimmerController),
                )
              : _ShimmerPlaceholder(shimmerController),
        ),

        // Gradient fade at the bottom into the card body
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.4, 1.0],
                colors: [
                  Colors.transparent,
                  Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.95),
                ],
              ),
            ),
          ),
        ),

        // GitHub badge – top right (Glassmorphism)
        Positioned(
          top: 15,
          right: 15,
          child: _GithubBadge(),
        ),
      ],
    );
  }
}

class _ShimmerPlaceholder extends StatelessWidget {
  final AnimationController controller;
  const _ShimmerPlaceholder(this.controller);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blueGrey.withValues(alpha: 0.1),
              Colors.pinkAccent.withValues(alpha: 0.05 + 0.05 * controller.value),
              Colors.blueGrey.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: const Center(
          child: Icon(Icons.code_rounded, size: 48, color: Colors.white10),
        ),
      ),
    );
  }
}

class _GithubBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/github.svg', width: 16, height: 16, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              const SizedBox(width: 6),
              const Text(
                'GitHub',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Content section ──────────────────────────────────────────────────────────

class _ContentSection extends StatelessWidget {
  final String title;
  final String description;
  final String link;
  final bool isHovered;

  const _ContentSection({
    required this.title,
    required this.description,
    required this.link,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        defaultPadding,
        0,
        defaultPadding,
        defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),

          // Description
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 13,
                height: 1.6,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),

          const SizedBox(height: 12),

          // Bottom row: host chip + open button
          Row(
            children: [
              Expanded(
                child: Text(
                  Uri.parse(link).host,
                  style: TextStyle(
                    color: Colors.blueAccent.shade100,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 12),
              _OpenButton(link: link, isHovered: isHovered),
            ],
          ),
        ],
      ),
    );
  }
}

class _OpenButton extends StatelessWidget {
  final String link;
  final bool isHovered;

  const _OpenButton({required this.link, required this.isHovered});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => launchUrl(Uri.parse(link)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: isHovered
                ? [Colors.pinkAccent, Colors.blueAccent]
                : [Colors.pinkAccent.withValues(alpha: 0.8), Colors.blueAccent.withValues(alpha: 0.8)],
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: Colors.pinkAccent.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'View Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.arrow_forward_ios, size: 10, color: Colors.white.withValues(alpha: 0.8)),
          ],
        ),
      ),
    );
  }
}