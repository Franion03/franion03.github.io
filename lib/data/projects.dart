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
    title: 'E-Commerce K8s Stack',
    description: 'Full e-commerce platform deployed on Kubernetes. Microservices architecture with CI/CD pipelines, monitoring stack, and auto-scaling configured for production workloads.',
    url: 'https://github.com/Franion03/e-commerce-k8s-stack',
    tags: ['Kubernetes', 'Docker', 'Helm', 'ArgoCD', 'Terraform'],
    image: 'https://opengraph.githubassets.com/1/Franion03/e-commerce-k8s-stack',
  ),
  ProjectData(
    title: 'Chess AI — Reinforcement Learning',
    description: 'Chess engine powered by deep reinforcement learning. Trains a neural network through self-play using AlphaZero-inspired architecture with MCTS.',
    url: 'https://github.com/Franion03/chess_ai_reinforcementlearning',
    tags: ['Python', 'PyTorch', 'Reinforcement Learning', 'MCTS', 'AI'],
    image: 'https://opengraph.githubassets.com/1/Franion03/chess_ai_reinforcementlearning',
  ),
  ProjectData(
    title: 'AquaOS — Water Polo Manager',
    description: 'Agentic water polo club management system. 7-level training system, CrewAI agents for match prep and season planning, responsive web dashboard.',
    url: 'https://github.com/Franion03/aqua-os',
    tags: ['React', 'Python', 'FastAPI', 'CrewAI', 'AWS', 'Flutter'],
    image: 'https://opengraph.githubassets.com/1/Franion03/aqua-os',
  ),
];
