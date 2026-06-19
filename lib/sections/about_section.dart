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
            title: 'Building ML Systems\nThat Ship',
            subtitle: 'Not just models — production ML platforms that scale.',
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
      r'> francisco_quiles — mlops engineer',
      r'',
      r'$ cat stack.txt',
      r'> kubernetes, mlflow, kubeflow,',
      r'> docker, terraform, argocd,',
      r'> python, pytorch, fastapi, aws',
      r'',
      r'$ echo $FOCUS',
      r'> ml pipelines · model serving · observability',
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
          "I'm Francisco Javier Quiles Ruiz, an MLOps Engineer based in Bern, Switzerland. "
          "I specialize in building production ML systems — from training pipelines and model "
          "registries to scalable serving infrastructure.\n\n"
          "My work bridges machine learning and platform engineering: Kubernetes-based ML platforms, "
          "automated CI/CD for models, experiment tracking with MLflow, and real-time monitoring "
          "for model drift and performance.\n\n"
          "When I'm not deploying ML pipelines or optimizing model serving, you'll find me "
          "building computer vision applications, earning cloud certifications, and contributing "
          "to open-source ML tooling.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
