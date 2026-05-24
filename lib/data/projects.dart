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
    title: 'Tfg_IA',
    description: 'Artificial Intelligence final degree project. Research and implementation of machine learning models for computer vision tasks.',
    url: 'https://github.com/Franion03/Tfg_IA',
    tags: ['Python', 'TensorFlow', 'Computer Vision', 'ML'],
    image: 'https://opengraph.githubassets.com/4277e9c872168f20c7f992e9ae209adb9fe4322c9c80cb4afe0a7c0c982ce3a8/Franion03/Tfg_IA',
  ),
  ProjectData(
    title: 'Programacion_1',
    description: 'List handler in C. Foundational programming exercises and data structure implementations.',
    url: 'https://github.com/Franion03/Programacion_1',
    tags: ['C', 'Data Structures', 'Algorithms'],
    image: 'https://opengraph.githubassets.com/c37917540a547978f07bf086e6b7cfa767c7b050ce259856b6b7c912cc910260/Franion03/Programacion_1',
  ),
  ProjectData(
    title: 'AquaOS — Water Polo Manager',
    description: 'Agentic water polo club management system. 7-level training system, CrewAI agents for match prep and season planning, responsive web dashboard.',
    url: 'https://github.com/Franion03/aqua-os',
    tags: ['React', 'Python', 'FastAPI', 'CrewAI', 'AWS', 'Flutter'],
    image: 'https://opengraph.githubassets.com/1/Franion03/aqua-os',
  ),
];
