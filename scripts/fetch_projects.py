import os
import requests
from bs4 import BeautifulSoup
import re

def scrape_url(url):
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
        image = image_meta['content'] if image_meta else 'assets/images/image.png'

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
        item = f"""  Project(
    '{p['name']}',
    '{p['description']}',
    '{p['image']}',
    '{p['link']}',
  )"""
        items.append(item)

    dart_content = f"""class Project {{
  final String name;
  final String description;
  final String image;
  final String link;
  Project(this.name, this.description, this.image, this.link);
}}

List<Project> projectList = [
{("," + chr(10)).join(items)}
];
"""
    return dart_content

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
    
    projects = []
    for url in urls:
        print(f"Scraping {url}...")
        data = scrape_url(url)
        if data:
            projects.append(data)
    
    if not projects:
        # Fallback to defaults to prevent app from breaking
        projects = [
            {
                'name': 'Sample Project',
                'description': 'Description',
                'image': 'assets/images/image.png',
                'link': 'https://github.com/Franion03'
            }
        ]

    dart_code = format_to_dart(projects)
    output_path = os.path.join(os.path.dirname(__file__), '../lib/model/project_model.dart')
    
    with open(output_path, "w") as f:
        f.write(dart_code)
    print(f"Successfully generated {os.path.abspath(output_path)}")
