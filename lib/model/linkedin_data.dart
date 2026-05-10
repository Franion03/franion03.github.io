import 'companies.dart';

List<Timeline> linkedinCompanies = [
  const Timeline(
    'Swisscom',
    messages: [
      TimelineMessage('Role', 'DevSecOps'),
      TimelineMessage('Details', 'Kubernetes, cluster deployment, security, automation, CI/CD'),
    ],
    date: '2024',
  ),
  const Timeline(
    'Swisscom',
    messages: [
      TimelineMessage('Role', 'Full Stack Developer'),
      TimelineMessage('Details', 'Full-stack development with TypeScript and Golang. Built cloud migration tooling on AWS. Maintained CI/CD pipelines with GitLab.'),
    ],
    date: '2023',
  ),
  const Timeline(
    'Odyssey Robotics',
    messages: [
      TimelineMessage('Role', 'Software Engineer'),
      TimelineMessage('Details', 'Flutter mobile development and Scrum Master. Designed ML pipelines in Python and developed CNN models for video classification.'),
    ],
    date: '2020',
  )
];
