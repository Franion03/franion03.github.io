import 'package:flutter/material.dart';

class SkillData {
  final String name;
  final int percentage;
  final IconData? icon;

  const SkillData({required this.name, required this.percentage, this.icon});
}

const List<SkillData> devopsSkills = [
  SkillData(name: 'Kubernetes / EKS', percentage: 92),
  SkillData(name: 'Docker', percentage: 93),
  SkillData(name: 'Terraform / IaC', percentage: 87),
  SkillData(name: 'GitLab CI/CD', percentage: 90),
  SkillData(name: 'AWS (SageMaker, EKS, S3)', percentage: 85),
];

const List<SkillData> devSkills = [
  SkillData(name: 'Python (ML/Data)', percentage: 90),
  SkillData(name: 'MLflow / Experiment Tracking', percentage: 85),
  SkillData(name: 'PyTorch / TensorFlow', percentage: 82),
  SkillData(name: 'FastAPI / Model Serving', percentage: 88),
  SkillData(name: 'Go', percentage: 85),
];

const List<SkillData> securitySkills = [
  SkillData(name: 'ML Pipelines (Kubeflow/Airflow)', percentage: 85),
  SkillData(name: 'Model Monitoring / Drift Detection', percentage: 82),
  SkillData(name: 'Feature Stores / Data Pipelines', percentage: 80),
  SkillData(name: 'Prometheus / Grafana', percentage: 88),
  SkillData(name: 'ArgoCD / GitOps', percentage: 90),
];
