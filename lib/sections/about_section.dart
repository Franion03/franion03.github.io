import 'package:flutter/material.dart';
import '../config/constants.dart';
import '../widgets/shared.dart';
import '../widgets/terminal.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: sectionPadding,
      ),
      child: Column(
        children: [
          const SectionHeader(
            comment: '// about',
            title: 'Building Infrastructure\nThat Ships',
            subtitle: 'Not just config files — production systems that scale.',
          ),
          const SizedBox(height: 48),
          isMobile
              ? const Column(children: [_AboutTerminal(), SizedBox(height: 32), _AboutBio()])
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _AboutTerminal()),
                    SizedBox(width: largePadding),
                    Expanded(flex: 5, child: _AboutBio()),
                  ],
                ),
          const SizedBox(height: 48),
          // Stats
          const Wrap(
            spacing: 40,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              StatCard(number: '3+', label: 'Years\nExperience'),
              StatCard(number: '10+', label: 'Certifications\nEarned'),
              StatCard(number: '5+', label: 'Projects\nShipped'),
              StatCard(number: '15+', label: 'Services\nDeployed'),
            ],
          ),
        ],
      ),
    );
  }
}

class _AboutTerminal extends StatelessWidget {
  const _AboutTerminal();
  @override
  Widget build(BuildContext context) {
    return const TerminalWidget(lines: [
      r'$ whoami',
      r'> francisco_quiles',
      r'',
      r'$ cat tools.txt',
      r'> kubernetes, docker, terraform,',
      r'> gitlab-ci, golang, flutter,',
      r'> python, typescript, aws',
      r'',
      r'$ echo $STATUS',
      r'> building the future',
    ]);
  }
}

class _AboutBio extends StatelessWidget {
  const _AboutBio();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm Francisco Javier Quiles Ruiz, a DevSecOps Engineer based in Bern, Switzerland. "
          "I specialize in building secure, scalable cloud infrastructure — from Kubernetes clusters "
          "to automated CI/CD pipelines.\n\n"
          "My work spans container orchestration, infrastructure as code, security automation, "
          "and full-stack development. I believe the best infrastructure is invisible — "
          "it just works, scales, and stays secure.\n\n"
          "When I'm not deploying clusters or writing Terraform modules, you'll find me "
          "contributing to open-source tools, earning cloud certifications, and mentoring "
          "junior engineers.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
