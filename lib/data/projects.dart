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
    description: 'Production MLOps pipeline: automated training with MLflow tracking, model registry, FastAPI serving on Kubernetes, ArgoCD GitOps deployment, Prometheus monitoring, and drift detection. Full IaC with Terraform and Helm.',
    url: 'https://github.com/Franion03/mlops-pipeline',
    tags: ['MLOps', 'Kubernetes', 'MLflow', 'ArgoCD', 'Terraform'],
    image: 'assets/project_images/project_0.png',
  ),
  ProjectData(
    title: 'Franion03 - waterpolo_analytics',
    description: 'Real-time sports analytics with YOLOv8 detection, ByteTrack tracking, team classification, and homography-based field mapping. Features goalie/pass/shot detection, speed metrics, formation analysis, and per-team heatmaps.',
    url: 'https://github.com/Franion03/waterpolo_analytics',
    tags: ['Computer Vision', 'YOLOv8', 'ML Pipeline', 'Python'],
    image: 'assets/project_images/project_1.png',
  ),
  ProjectData(
    title: 'Franion03 - e-commerce-k8s-stack',
    description: 'GitOps-first Kubernetes infrastructure for a multi-vendor ecommerce platform with robot-driven warehouse. All services self-hosted on Kubernetes, managed by ArgoCD with full observability.',
    url: 'https://github.com/Franion03/e-commerce-k8s-stack',
    tags: ['Kubernetes', 'ArgoCD', 'GitOps', 'Docker'],
    image: 'assets/project_images/project_2.png',
  ),
  ProjectData(
    title: 'Franion03 - chess_ai_reinforcementlearning',
    description: 'Reinforcement learning chess AI — self-play RL, evaluation framework, and UCI engine interface. Automated training pipeline with model checkpointing.',
    url: 'https://github.com/Franion03/chess_ai_reinforcementlearning',
    tags: ['Reinforcement Learning', 'PyTorch', 'ML Training'],
    image: 'assets/project_images/project_3.png',
  ),
  ProjectData(
    title: 'Franion03 - aqua-os',
    description: 'AI-powered operations platform combining React dashboard, FastAPI backend, and CrewAI agents for automated scheduling, training plans, and intelligent decision-making.',
    url: 'https://github.com/Franion03/aqua-os',
    tags: ['FastAPI', 'AI Agents', 'Python', 'React'],
    image: 'assets/project_images/project_4.png',
  ),
];
