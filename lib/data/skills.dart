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
  SkillData(name: 'AWS (EKS, S3, IAM)', percentage: 88),
];

const List<SkillData> devSkills = [
  SkillData(name: 'Python', percentage: 90),
  SkillData(name: 'Go', percentage: 85),
  SkillData(name: 'FastAPI', percentage: 88),
  SkillData(name: 'Crossplane / Helm', percentage: 85),
  SkillData(name: 'Bash / Scripting', percentage: 87),
];

const List<SkillData> securitySkills = [
  SkillData(name: 'SAST / DAST / Dependency Scanning', percentage: 85),
  SkillData(name: 'ArgoCD / GitOps', percentage: 90),
  SkillData(name: 'Prometheus / Grafana', percentage: 88),
  SkillData(name: 'ML Pipelines (learning)', percentage: 70),
  SkillData(name: 'MLflow / Model Serving (learning)', percentage: 65),
];
