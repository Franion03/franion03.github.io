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
    role: 'MLOps / Platform Engineer',
    description:
        'Designing and operating ML infrastructure on EKS. Building ML pipelines with automated '
        'training, model registry, and serving. GitOps-based deployments with ArgoCD, '
        'Crossplane for infrastructure provisioning, and full observability with Prometheus/Grafana.',
    tags: ['Kubernetes', 'MLflow', 'ArgoCD', 'Terraform', 'AWS', 'Python'],
  ),
  ExperienceData(
    period: '2023 — 2024',
    company: 'Swisscom',
    role: 'Full Stack / ML Engineer',
    description:
        'Built ML-powered services with FastAPI and deployed on Kubernetes. Implemented CI/CD '
        'pipelines for model training and serving. Developed data pipelines and feature engineering '
        'workflows on AWS (S3, SageMaker, Lambda).',
    tags: ['Python', 'FastAPI', 'Docker', 'AWS SageMaker', 'GitLab CI'],
  ),
  ExperienceData(
    period: '2020 — 2023',
    company: 'Odyssey Robotics',
    role: 'ML Engineer',
    description:
        'Designed and trained CNN models for real-time video classification. Built ML pipelines '
        'in Python with automated retraining. Deployed models to edge devices with TensorFlow Lite. '
        'Led a team of 4 engineers.',
    tags: ['PyTorch', 'TensorFlow', 'Python', 'Docker', 'ML Pipelines'],
  ),
];
