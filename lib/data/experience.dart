class ExperienceData {
  final String period;
  final String company;
  final String role;
  final String description;
  final List<String> tags;

  const ExperienceData({
    required this.period,
    required this.company,
    required this.role,
    required this.description,
    required this.tags,
  });
}

const List<ExperienceData> experience = [
  ExperienceData(
    period: '2024 — Present',
    company: 'Swisscom',
    role: 'DevSecOps / Platform Engineer',
    description:
        'Securing and operating cloud-native infrastructure on EKS. GitOps-based deployments with ArgoCD, '
        'Crossplane for infrastructure provisioning, CI/CD pipeline security (SAST/DAST), '
        'and full observability with Prometheus/Grafana. Transitioning into ML/MLOps engineering.',
    tags: ['Kubernetes', 'ArgoCD', 'Crossplane', 'Terraform', 'AWS', 'Security'],
  ),
  ExperienceData(
    period: '2023 — 2024',
    company: 'Swisscom',
    role: 'Full Stack / DevOps Engineer',
    description:
        'Built cloud-native services with FastAPI and deployed on Kubernetes. Implemented secure CI/CD '
        'pipelines with GitLab. Automated infrastructure with Terraform and AWS (EKS, S3, IAM).',
    tags: ['Python', 'FastAPI', 'Docker', 'AWS', 'GitLab CI', 'Terraform'],
  ),
  ExperienceData(
    period: '2020 — 2023',
    company: 'Odyssey Robotics',
    role: 'Software Engineer',
    description:
        'Designed and deployed applications for real-time video processing. Built CI/CD pipelines '
        'and containerized deployments with Docker. Led a team of 4 engineers.',
    tags: ['Python', 'Docker', 'CI/CD', 'Linux', 'Networking'],
  ),
];
