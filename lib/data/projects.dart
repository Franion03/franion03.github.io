class ProjectData {
  final String title;
  final String description;
  final String url;
  final List<String> tags;
  final String image;

  const ProjectData({
    required this.title,
    required this.description,
    required this.url,
    required this.tags,
    this.image = '',
  });
}

const List<ProjectData> projects = [
  ProjectData(
    title: 'Kubernetes Home Lab',
    description:
        'Self-hosted Kubernetes cluster on bare metal with k3s. Automated GitOps deployments via ArgoCD, '
        'monitoring with Prometheus/Grafana, and ingress with Traefik. Runs 15+ services including media stack.',
    url: 'https://github.com/franion03',
    tags: ['Kubernetes', 'ArgoCD', 'Helm', 'Prometheus', 'Grafana'],
  ),
  ProjectData(
    title: 'Cloud Migration Toolkit',
    description:
        'Internal tooling at Swisscom for migrating on-prem workloads to AWS. Built with Go and TypeScript. '
        'Automated infrastructure provisioning with Terraform and configuration management.',
    url: 'https://github.com/franion03',
    tags: ['Go', 'TypeScript', 'Terraform', 'AWS', 'Docker'],
  ),
  ProjectData(
    title: 'CI/CD Pipeline Framework',
    description:
        'Reusable GitLab CI templates and pipeline framework for microservices. Includes security scanning '
        '(SAST/DAST), container signing, and automated deployment strategies.',
    url: 'https://github.com/franion03',
    tags: ['GitLab CI', 'Docker', 'Kubernetes', 'Go', 'Shell'],
  ),
  ProjectData(
    title: 'Flutter Portfolio',
    description:
        'This responsive portfolio website built with Flutter Web. Features terminal aesthetic, '
        'dark theme, and automated LinkedIn data fetching via GitHub Actions.',
    url: 'https://github.com/franion03/franion03.github.io',
    tags: ['Flutter', 'Dart', 'GitHub Actions', 'Python'],
  ),
  ProjectData(
    title: 'Infrastructure as Code Library',
    description:
        'Collection of Terraform modules for AWS and on-prem deployments. Includes VPC networking, '
        'EKS clusters, RDS databases, and security groups with least-privilege defaults.',
    url: 'https://github.com/franion03',
    tags: ['Terraform', 'AWS', 'HCL', 'Python'],
  ),
];
