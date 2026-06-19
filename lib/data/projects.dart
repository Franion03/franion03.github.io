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
    description: 'This repository implements a GitOps-first Kubernetes infrastructure for a multi-vendor ecommerce company with a robot-driven warehouse. All services are self-hosted on Kubernetes, managed by ArgoCD...',
    url: 'https://github.com/Franion03/e-commerce-k8s-stack',
    tags: ['Kubernetes', 'ArgoCD', 'E-Commerce'],
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
  ),
  ProjectData(
    title: 'Franion03 - waterpolo_analytics',
    description: 'Real-time water polo match analysis using YOLOv8 detection, ByteTrack tracking, cap-color team classification, and homography-based field mapping. Features goalie detection, pass/shot detection, speed metrics, formation analysis, and per-team heatmaps.',
    url: 'https://github.com/Franion03/waterpolo_analytics',
    tags: ['AI', 'Computer Vision', 'YOLOv8', 'Sports Analytics', 'Python'],
    image: 'assets/project_images/project_3.png',
  )
];
