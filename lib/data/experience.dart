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
    role: 'DevSecOps Engineer',
    description:
        'Kubernetes cluster deployment and management. Security automation, CI/CD pipeline design, '
        'and cloud infrastructure provisioning. Built internal tooling for developer experience.',
    tags: ['Kubernetes', 'Terraform', 'GitLab CI', 'Go', 'AWS'],
  ),
  ExperienceData(
    period: '2023 — 2024',
    company: 'Swisscom',
    role: 'Full Stack Developer',
    description:
        'Full-stack development with TypeScript and Golang. Built cloud migration tooling on AWS. '
        'Maintained CI/CD pipelines with GitLab. Implemented microservices architecture.',
    tags: ['TypeScript', 'Go', 'AWS', 'GitLab CI', 'Docker'],
  ),
  ExperienceData(
    period: '2020 — 2023',
    company: 'Odyssey Robotics',
    role: 'Software Engineer',
    description:
        'Flutter mobile development and Scrum Master. Designed ML pipelines in Python and developed '
        'CNN models for video classification. Led a team of 4 engineers.',
    tags: ['Flutter', 'Python', 'TensorFlow', 'Docker', 'Agile'],
  ),
];
