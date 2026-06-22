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
    title: 'Franion03 - mlops-pipeline',
    description: 'Production MLOps pipeline: training, model registry, serving, GitOps deployment, and drift monitoring - Franion03/mlops-pipeline',
    url: 'https://github.com/Franion03/mlops-pipeline',
    tags: ['MLOps', 'Monitoring', 'AI', 'ML', 'ML Pipeline'],
    image: 'assets/project_images/project_0.jpg',
  ),
  ProjectData(
    title: 'Franion03 - waterpolo_analytics',
    description: 'It is a repo where with machine learning I will try to analyze the position of the ball, the position of the players and the relative position of all of them in respective the field. - Franion03/wa...',
    url: 'https://github.com/Franion03/waterpolo_analytics',
    tags: [],
    image: 'assets/project_images/project_1.jpg',
  ),
  ProjectData(
    title: 'Franion03 - e-commerce-k8s-stack',
    description: 'This repository implements a GitOps-first Kubernetes infrastructure for a multi-vendor ecommerce company with a robot-driven warehouse. All services are self-hosted on Kubernetes, managed by ArgoCD...',
    url: 'https://github.com/Franion03/e-commerce-k8s-stack',
    tags: ['Kubernetes', 'ArgoCD', 'E-Commerce'],
    image: 'assets/project_images/project_2.png',
  ),
  ProjectData(
    title: 'Franion03 - chess_ai_reinforcementlearning',
    description: 'In this awesome repo, we&#39;re going to develop three different chess AI models to compare them! First, we&#39;ll play against ourselves using reinforcement learning. Then, we&#39;ll play against ...',
    url: 'https://github.com/Franion03/chess_ai_reinforcementlearning',
    tags: ['AI', 'Reinforcement Learning'],
    image: 'assets/project_images/project_3.jpg',
  ),
  ProjectData(
    title: 'Franion03 - aqua-os',
    description: 'Club operations platform for water polo teams. Combines a React dashboard, a FastAPI backend, and CrewAI agents to automate scheduling, training plans, lineups, availability, and social media publi...',
    url: 'https://github.com/Franion03/aqua-os',
    tags: ['React', 'FastAPI', 'CrewAI', 'AI'],
    image: 'assets/project_images/project_4.jpg',
  )
];
