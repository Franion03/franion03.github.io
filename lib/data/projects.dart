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
    image: 'assets/project_images/project_0.png',
  ),
  ProjectData(
    title: 'Franion03 - chess_ai_reinforcementlearning',
    description: 'In this awesome repo, we&#39;re going to develop three different chess AI models to compare them! First, we&#39;ll play against ourselves using reinforcement learning. Then, we&#39;ll play against ...',
    url: 'https://github.com/Franion03/chess_ai_reinforcementlearning',
    tags: ['AI', 'Reinforcement Learning'],
    image: 'assets/project_images/project_1.jpg',
  ),
  ProjectData(
    title: 'Franion03 - aqua-os',
    description: 'Club operations platform for water polo teams. Combines a React dashboard, a FastAPI backend, and CrewAI agents to automate scheduling, training plans, lineups, availability, and social media publi...',
    url: 'https://github.com/Franion03/aqua-os',
    tags: ['React', 'FastAPI', 'CrewAI', 'AI'],
    image: 'assets/project_images/project_2.jpg',
  )
];
