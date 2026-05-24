class ProjectData {
  final String title;
  final String description;
  final String url;
  final List<String> tags;

  const ProjectData({
    required this.title,
    required this.description,
    required this.url,
    required this.tags,
  });
}

const List<ProjectData> projects = [
  ProjectData(
    title: 'E-Commerce K8s Stack',
    description: 'Full e-commerce platform on Kubernetes. Microservices with CI/CD, monitoring, and auto-scaling.',
    url: 'https://github.com/Franion03/e-commerce-k8s-stack',
    tags: ['Kubernetes', 'Docker', 'Helm', 'ArgoCD', 'Terraform'],
  ),
  ProjectData(
    title: 'Chess AI — Reinforcement Learning',
    description: 'Chess engine with deep RL. AlphaZero-inspired architecture using self-play and MCTS.',
    url: 'https://github.com/Franion03/chess_ai_reinforcementlearning',
    tags: ['Python', 'PyTorch', 'Reinforcement Learning', 'AI'],
  ),
  ProjectData(
    title: 'AquaOS — Water Polo Manager',
    description: 'Agentic club management system. 7-level training, CrewAI agents, responsive dashboard.',
    url: 'https://github.com/Franion03/aqua-os',
    tags: ['React', 'Python', 'FastAPI', 'CrewAI', 'AWS', 'Flutter'],
  ),
];
