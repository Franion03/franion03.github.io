import 'package:flutter/material.dart';

class SkillData {
  final String name;
  final int percentage;
  final IconData? icon;

  const SkillData({required this.name, required this.percentage, this.icon});
}

const List<SkillData> devopsSkills = [
  SkillData(name: 'Kubernetes', percentage: 90),
  SkillData(name: 'Docker', percentage: 92),
  SkillData(name: 'Terraform', percentage: 85),
  SkillData(name: 'GitLab CI/CD', percentage: 88),
  SkillData(name: 'AWS', percentage: 82),
];

const List<SkillData> devSkills = [
  SkillData(name: 'Go', percentage: 88),
  SkillData(name: 'Flutter / Dart', percentage: 90),
  SkillData(name: 'Python', percentage: 85),
  SkillData(name: 'TypeScript', percentage: 80),
  SkillData(name: 'Shell Scripting', percentage: 87),
];

const List<SkillData> securitySkills = [
  SkillData(name: 'DevSecOps', percentage: 88),
  SkillData(name: 'Network Security', percentage: 82),
  SkillData(name: 'Container Security', percentage: 85),
  SkillData(name: 'SAST / DAST', percentage: 80),
  SkillData(name: 'IAM / RBAC', percentage: 83),
];
