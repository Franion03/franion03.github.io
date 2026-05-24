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
    title: 'Franion03 - e-commerce-k8s-stack',
    description: 'Contribute to Franion03/e-commerce-k8s-stack development by creating an account on GitHub.',
    url: 'https://github.com/Franion03/e-commerce-k8s-stack',
    tags: ['Kubernetes', 'E-Commerce'],
    image: 'https://repository-images.githubusercontent.com/1217803332/819aeb61-1699-4e87-a14f-72b14402ce6c',
  ),
  ProjectData(
    title: 'Franion03 - chess_ai_reinforcementlearning',
    description: 'In this awesome repo, we&#39;re going to develop three different chess AI models to compare them! First, we&#39;ll play against ourselves using reinforcement learning. Then, we&#39;ll play against ...',
    url: 'https://github.com/Franion03/chess_ai_reinforcementlearning',
    tags: ['AI', 'Reinforcement Learning'],
    image: 'https://repository-images.githubusercontent.com/788678674/7e63cffb-41eb-4986-9039-2e90d1e7f362',
  ),
  ProjectData(
    title: 'Franion03 - aqua-os',
    description: 'Contribute to Franion03/aqua-os development by creating an account on GitHub.',
    url: 'https://github.com/Franion03/aqua-os',
    tags: [],
    image: 'https://repository-images.githubusercontent.com/1247876480/c376c148-f475-4132-b184-3b7f99288fa1',
  )
];
