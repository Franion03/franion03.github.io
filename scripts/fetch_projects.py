import os
import requests
from bs4 import BeautifulSoup
import re

def scrape_url(url, index: int, image_dir: str):
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        soup = BeautifulSoup(response.text, 'html.parser')

        # Try OpenGraph first
        title_meta = soup.find('meta', property='og:title')
        description_meta = soup.find('meta', property='og:description')
        image_meta = soup.find('meta', property='og:image')

        title = title_meta['content'] if title_meta else ''
        description = description_meta['content'] if description_meta else ''
        og_image_url = image_meta['content'] if image_meta else ''

        # Download the OG image to local assets directory (avoids CORS)
        image = 'assets/project_images/project_0.png'  # fallback
        if og_image_url:
            try:
                img_resp = requests.get(og_image_url, timeout=15)
                img_resp.raise_for_status()
                ext = 'png'
                content_type = img_resp.headers.get('content-type', '')
                if 'jpeg' in content_type or 'jpg' in content_type:
                    ext = 'jpg'
                elif 'webp' in content_type:
                    ext = 'webp'
                image_path = os.path.join(image_dir, f'project_{index}.{ext}')
                with open(image_path, 'wb') as f:
                    f.write(img_resp.content)
                image = f'assets/project_images/project_{index}.{ext}'
                print(f"  → downloaded image ({len(img_resp.content)} bytes)")
            except Exception as e:
                print(f"  → image download failed: {e}")

        if not title:
            title_tag = soup.find('title')
            title = title_tag.text if title_tag else url

        if not description:
            desc_tag = soup.find('meta', attrs={'name': 'description'})
            description = desc_tag['content'] if desc_tag else ''

        # GitHub Specific Fallbacks
        if 'github.com' in url:
            if not title or title.startswith('GitHub -'):
                # Extract repo name
                title_parts = [p for p in url.split('github.com/')[-1].split('/') if p]
                if len(title_parts) >= 2:
                    title = f"{title_parts[0]} - {title_parts[1]}"
            if not description:
                about = soup.find('p', class_='f4 mt-3')
                if about:
                    description = about.text.strip()

        # Clean strings for dart
        title = title.replace("'", "\\'")
        description = description.replace("'", "\\'").replace("\n", " ")

        return {
            'name': title,
            'description': description,
            'image': image,
            'link': url
        }
    except Exception as e:
        print(f"Error scraping {url}: {e}")
        return None

def format_to_dart(projects):
    items = []
    for p in projects:
        title = p['name'].replace("'", "\\'")
        desc = p['description'].replace("'", "\\'").replace("\n", " ")
        img = p['image'].replace("'", "\\'")
        link = p['link']
        # Extract tags from description (simple keyword matching)
        tags = _infer_tags(title + " " + desc)
        tags_str = "[" + ", ".join(f"'{t}'" for t in tags) + "]"
        item = f"""  ProjectData(
    title: '{title}',
    description: '{desc}',
    url: '{link}',
    tags: {tags_str},
    image: '{img}',
  )"""
        items.append(item)

    dart_content = f"""class ProjectData {{
  final String title;
  final String description;
  final String url;
  final List<String> tags;
  final String image;

  const ProjectData({{
    required this.title,
    required this.description,
    required this.url,
    required this.tags,
    this.image = '',
  }});
}}

const List<ProjectData> projects = [
{("," + chr(10)).join(items)}
];
"""
    return dart_content


def _infer_tags(text: str) -> list:
    """Infer tech tags from project description using keyword matching."""
    text_lower = text.lower()
    tags = []
    keywords = {
        'mlops': 'MLOps', 'mlflow': 'MLflow', 'kubeflow': 'Kubeflow',
        'model serving': 'Model Serving', 'drift': 'Monitoring',
        'sagemaker': 'SageMaker', 'yolo': 'Computer Vision',
        'kubernetes': 'Kubernetes', 'k8s': 'Kubernetes', 'docker': 'Docker',
        'helm': 'Helm', 'argocd': 'ArgoCD', 'terraform': 'Terraform',
        'aws': 'AWS', 'python': 'Python', 'react': 'React', 'flutter': 'Flutter',
        'dart': 'Dart', 'golang': 'Go', 'go ': 'Go', 'typescript': 'TypeScript',
        'fastapi': 'FastAPI', 'crewai': 'CrewAI', 'ai': 'AI', 'ml': 'ML',
        'pytorch': 'PyTorch', 'tensorflow': 'TensorFlow', 'c ': 'C',
        'reinforcement': 'Reinforcement Learning', 'chess': 'AI',
        'e-commerce': 'E-Commerce', 'microservice': 'Microservices',
        'ci/cd': 'CI/CD', 'gitlab': 'GitLab CI', 'github actions': 'GitHub Actions',
        'prometheus': 'Prometheus', 'grafana': 'Grafana', 'pipeline': 'ML Pipeline',
    }
    for key, tag in keywords.items():
        if key in text_lower and tag not in tags:
            tags.append(tag)
    return tags[:6]  # Max 6 tags

import yaml

if __name__ == "__main__":
    urls_file = os.path.join(os.path.dirname(__file__), 'projects.yaml')
    
    urls = []
    if os.path.exists(urls_file):
        with open(urls_file, 'r') as f:
            yaml_data = yaml.safe_load(f)
            if yaml_data and 'projects' in yaml_data:
                urls = [p['url'] for p in yaml_data['projects'] if 'url' in p]
    else:
        print(f"File {urls_file} not found. Returning empty projects or default.")
    
    # Create image directory
    project_root = os.path.dirname(os.path.dirname(__file__))
    image_dir = os.path.join(project_root, 'assets', 'project_images')
    os.makedirs(image_dir, exist_ok=True)

    projects = []
    for i, url in enumerate(urls):
        print(f"Scraping {url}...")
        data = scrape_url(url, i, image_dir)
        if data:
            projects.append(data)
    
    if not projects:
        # Fallback to defaults to prevent app from breaking
        projects = [
            {
                'name': 'Sample Project',
                'description': 'Description',
                'image': 'assets/project_images/project_0.png',
                'link': 'https://github.com/Franion03'
            }
        ]

    dart_code = format_to_dart(projects)
    output_path = os.path.join(os.path.dirname(__file__), '../lib/data/projects.dart')
    
    with open(output_path, "w") as f:
        f.write(dart_code)
    print(f"Successfully generated {os.path.abspath(output_path)}")
