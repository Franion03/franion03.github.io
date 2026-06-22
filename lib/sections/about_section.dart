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
            title: 'Securing Cloud-Native\nSystems',
            subtitle: 'DevSecOps by trade — ML/MLOps Engineer by ambition.',
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
      r'> francisco_quiles — devsecops engineer',
      r'',
      r'$ cat stack.txt',
      r'> kubernetes, terraform, argocd,',
      r'> docker, gitlab ci/cd, aws,',
      r'> python, go, crossplane',
      r'',
      r'$ echo $FOCUS',
      r'> secure pipelines · cloud infra · transitioning to ML/MLOps',
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
          "I specialize in securing cloud-native infrastructure — CI/CD pipelines, Kubernetes "
          "clusters, and GitOps-driven deployments at scale.\n\n"
          "My work focuses on platform engineering: EKS clusters with Crossplane, automated "
          "security scanning in pipelines, infrastructure as code with Terraform, and full "
          "observability with Prometheus/Grafana.\n\n"
          "I'm actively transitioning into ML/MLOps Engineering — building ML pipelines, "
          "model serving infrastructure, and applying my DevSecOps foundations to production "
          "machine learning systems.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
