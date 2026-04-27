import os
import json
import requests

def fetch_linkedin_data():
    client_id = os.environ.get('LINKEDIN_CLIENT_ID')
    client_secret = os.environ.get('LINKEDIN_CLIENT_SECRET')
    refresh_token = os.environ.get('LINKEDIN_REFRESH_TOKEN')

    if not all([client_id, client_secret, refresh_token]):
        print("Missing LinkedIn credentials. Using mock data for demonstration.")
        return get_mock_data()

    try:
        # Refresh access token
        token_url = "https://www.linkedin.com/oauth/v2/accessToken"
        data = {
            'grant_type': 'refresh_token',
            'refresh_token': refresh_token,
            'client_id': client_id,
            'client_secret': client_secret,
        }
        res = requests.post(token_url, data=data)
        res.raise_for_status()
        access_token = res.json()['access_token']

        # Fetch positions
        profile_url = "https://api.linkedin.com/v2/me?projection=(positions:(elements:(company~(name),title,startDate,endDate,description)))"
        headers = {'Authorization': f'Bearer {access_token}'}
        positions_res = requests.get(profile_url, headers=headers)
        positions_res.raise_for_status()
        
        # Fetch certifications
        # Note: LinkedIn API for certifications might require special permissions
        cert_url = "https://api.linkedin.com/v2/memberCertifications"
        cert_res = requests.get(cert_url, headers=headers)
        cert_res.raise_for_status()
        
        return {
            "positions": positions_res.json().get("positions", {}),
            "certifications": cert_res.json().get("elements", [])
        }
    except Exception as e:
        print(f"Error fetching LinkedIn data: {e}")
        return get_mock_data()

def get_mock_data():
    return {
        "positions": {
            "elements": [
                {
                    "company~": {"name": "Odyssey Robotics"},
                    "title": "Software Engineer",
                    "startDate": {"year": 2020},
                    "endDate": {"year": 2023},
                    "description": "Flutter mobile development and Scrum Master. Designed ML pipelines in Python and developed CNN models for video classification."
                },
                {
                    "company~": {"name": "Swisscom"},
                    "title": "Full Stack Developer",
                    "startDate": {"year": 2023},
                    "endDate": {"year": 2024},
                    "description": "Full-stack development with TypeScript and Golang. Built cloud migration tooling on AWS. Maintained CI/CD pipelines with GitLab."
                },
                {
                    "company~": {"name": "Swisscom"},
                    "title": "DevSecOps",
                    "startDate": {"year": 2024},
                    "endDate": {"year": 2026},
                    "description": "Kubernetes, kluster deployment, security, automation, CI/CD"
                }
            ]
        },
        "certifications": [
            {
                "name": "Flutter Essential Training",
                "authority": {"name": "LinkedIn"},
                "startDate": {"month": 7, "year": 2023},
                "displaySource": "https://www.linkedin.com/learning/certificates/..."
            },
            {
                "name": "Foundations of Cybersecurity",
                "authority": {"name": "Google on Coursera"},
                "startDate": {"month": 7, "year": 2023},
                "displaySource": "https://coursera.org/share/..."
            },
            {
                "name": "Network Defense Essentials (NDE)",
                "authority": {"name": "EC-Council"},
                "startDate": {"month": 7, "year": 2023},
                "displaySource": "https://codered.eccouncil.org/certificate/..."
            }
        ]
    }

def format_to_dart(data):
    # Experience Data
    timeline_items = []
    positions = data.get('positions', {}).get('elements', [])
    positions.sort(key=lambda x: x.get('startDate', {}).get('year', 0), reverse=True)

    for pos in positions:
        company_name = pos.get('company~', {}).get('name', 'Unknown')
        year = str(pos.get('startDate', {}).get('year', ''))
        title = pos.get('title', '')
        desc = pos.get('description', '').replace("'", "\\'").replace('\n', ' ')
        
        item = f"""  Timeline(
    '{company_name}',
    messages: [
      TimelineMessage('Role', '{title}'),
      TimelineMessage('Details', '{desc}'),
    ],
    date: '{year}',
  )"""
        timeline_items.append(item)

    exp_dart = f"""import 'companies.dart';

List<Timeline> linkedinCompanies = [
{("," + chr(10)).join(timeline_items)}
];
"""

    # Certification Data
    cert_items = []
    certs = data.get('certifications', [])
    for cert in certs:
        name = cert.get('name', '')
        org = cert.get('authority', {}).get('name', '')
        year = cert.get('startDate', {}).get('year', '')
        month_int = cert.get('startDate', {}).get('month', 1)
        months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
        month = months[month_int - 1] if 1 <= month_int <= 12 else "JAN"
        date_str = f"{month} {year}"
        credential = cert.get('displaySource', '')
        
        item = f"""  CertificateModel(
    name: '{name}',
    organization: '{org}',
    date: '{date_str}',
    skills: '',
    credential: '{credential}',
  )"""
        cert_items.append(item)

    cert_dart = f"""import 'certificate_model.dart';

List<CertificateModel> linkedinCertificates = [
{("," + chr(10)).join(cert_items)}
];
"""

    return exp_dart, cert_dart

if __name__ == "__main__":
    data = fetch_linkedin_data()
    exp_code, cert_code = format_to_dart(data)
    
    exp_output = "lib/model/linkedin_data.dart"
    with open(exp_output, "w") as f:
        f.write(exp_code)
    print(f"Successfully generated {exp_output}")

    cert_output = "lib/model/linkedin_certificates.dart"
    with open(cert_output, "w") as f:
        f.write(cert_code)
    print(f"Successfully generated {cert_output}")
