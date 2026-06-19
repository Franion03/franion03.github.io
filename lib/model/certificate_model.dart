class CertificateModel {
  final String name;
  final String organization;
  final String date;
  final String skills;
  final String credential;

  CertificateModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.credential,
  });
}

List<CertificateModel> certificateList = [
  CertificateModel(
    name: 'AWS Certified Cloud Practitioner (CLF-C02)',
    organization: 'Amazon Web Services (AWS)',
    date: 'JAN 2026',
    skills: 'AWS, Cloud Architecture',
    credential: 'https://www.credly.com/badges/',
  ),
  CertificateModel(
    name: 'Certified Kubernetes Administrator (CKA)',
    organization: 'The Linux Foundation',
    date: 'MAR 2025',
    skills: 'Kubernetes, Container Orchestration',
    credential: 'https://www.credly.com/badges/',
  ),
  CertificateModel(
    name: 'Terraform Associate',
    organization: 'HashiCorp',
    date: 'NOV 2024',
    skills: 'Terraform, Infrastructure as Code',
    credential: 'https://www.credly.com/badges/',
  ),
  CertificateModel(
    name: 'MLOps Specialization',
    organization: 'DeepLearning.AI / Coursera',
    date: 'JUN 2025',
    skills: 'ML Pipelines, Model Deployment, Monitoring',
    credential: 'https://www.coursera.org/account/accomplishments/',
  ),
  CertificateModel(
    name: 'Machine Learning Engineering for Production',
    organization: 'DeepLearning.AI / Coursera',
    date: 'APR 2025',
    skills: 'TFX, ML Pipelines, Data Validation',
    credential: 'https://www.coursera.org/account/accomplishments/',
  ),
  CertificateModel(
    name: 'Docker Certified Associate',
    organization: 'Docker Inc.',
    date: 'SEP 2024',
    skills: 'Docker, Containerization, Networking',
    credential: 'https://credentials.docker.com/',
  ),
  CertificateModel(
    name: 'GitLab CI/CD Specialist',
    organization: 'GitLab',
    date: 'JUL 2024',
    skills: 'CI/CD, DevOps, Automation',
    credential: 'https://about.gitlab.com/learn/',
  ),
  CertificateModel(
    name: 'Computer Science Degree',
    organization: 'University Miguel Hernandez',
    date: 'MAY 2024',
    skills: 'Algorithms, Systems, Software Engineering',
    credential: '',
  ),
];
