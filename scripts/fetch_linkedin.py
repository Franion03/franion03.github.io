import os
import json
import sys
from pathlib import Path
import requests


def load_dotenv():
    """Load .env file from project root into os.environ. No external deps needed."""
    env_path = Path(__file__).resolve().parent.parent / ".env"
    if not env_path.exists():
        return
    with open(env_path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            key, _, value = line.partition("=")
            key, value = key.strip(), value.strip().strip('"').strip("'")
            if key and key not in os.environ:
                os.environ[key] = value
    print(f"✓ Loaded {env_path}")


def fetch_linkedin_data():
    client_id = os.environ.get('LINKEDIN_CLIENT_ID')
    client_secret = os.environ.get('LINKEDIN_CLIENT_SECRET')
    refresh_token = os.environ.get('LINKEDIN_REFRESH_TOKEN')

    if not all([client_id, client_secret, refresh_token]):
        print("::warning:: Missing LinkedIn credentials. Using fallback data.")
        return get_fallback_data()

    access_token = None
    positions = None
    certifications = None

    # Step 1: Get access token
    try:
        token_url = "https://www.linkedin.com/oauth/v2/accessToken"
        data = {
            'grant_type': 'refresh_token',
            'refresh_token': refresh_token,
            'client_id': client_id,
            'client_secret': client_secret,
        }
        res = requests.post(token_url, data=data, timeout=15)
        res.raise_for_status()
        access_token = res.json().get('access_token')
        if not access_token:
            print("::error:: No access_token in response. Check refresh token validity.")
            return get_fallback_data()
        print("✓ Access token refreshed successfully")
    except requests.exceptions.RequestException as e:
        print(f"::error:: OAuth token refresh failed: {e}")
        print(f"   Response body: {res.text[:200] if 'res' in dir() else 'N/A'}")
        return get_fallback_data()

    headers = {
        'Authorization': f'Bearer {access_token}',
        'LinkedIn-Version': '202505',
        'X-Restli-Protocol-Version': '2.0.0'
    }

    # Step 2: Fetch positions
    try:
        profile_url = "https://api.linkedin.com/v2/me?projection=(positions:(elements:(company~(name),title,startDate,endDate,description)))"
        positions_res = requests.get(profile_url, headers=headers, timeout=15)
        positions_res.raise_for_status()
        positions = positions_res.json().get("positions", {})
        count = len(positions.get("elements", []))
        print(f"✓ Positions fetched: {count} entries")
    except requests.exceptions.RequestException as e:
        print(f"::warning:: Positions fetch failed: {e}")
        print(f"   Response body: {positions_res.text[:200] if 'positions_res' in dir() else 'N/A'}")

    # Step 3: Fetch certifications
    # NOTE: LinkedIn /v2/memberCertifications requires partner program access.
    # This endpoint is NOT available to individual developers. It will likely
    # return 403. Keep the call for when access is granted, but expect fallback.
    try:
        cert_url = "https://api.linkedin.com/v2/memberCertifications"
        cert_res = requests.get(cert_url, headers=headers, timeout=15)
        cert_res.raise_for_status()
        certifications = cert_res.json().get("elements", [])
        count = len(certifications)
        print(f"✓ Certifications fetched from API: {count} entries")
    except requests.exceptions.RequestException as e:
        print(f"::warning:: Certifications API fetch failed (expected — requires partner access): {e}")
        print(f"   Status: {cert_res.status_code if 'cert_res' in dir() else 'N/A'}")
        print(f"   Response: {cert_res.text[:200] if 'cert_res' in dir() else 'N/A'}")
        # Fallback: use hardcoded certs with real credential URLs
        certifications = get_fallback_certifications()
        print(f"   Using fallback certifications: {len(certifications)} entries")

    return {
        "positions": positions or get_fallback_positions(),
        "certifications": certifications or get_fallback_certifications(),
    }


def get_fallback_certifications():
    """Real certifications with actual credential URLs.
    Update this list when you earn new certs."""
    return [
        {
            "name": "Flutter Essential Training: Build for Multiple Platforms",
            "authority": {"name": "LinkedIn"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://www.linkedin.com/learning/certificates/450fc4e2f495726aea50a067caf586869ccf0cb92ebcc5a4c7b5648a95754a8f",
        },
        {
            "name": "Complete Dart Learning",
            "authority": {"name": "Udemy"},
            "startDate": {"month": 6, "year": 2023},
            "displaySource": "https://www.udemy.com/certificate/UC-5b01c756-0d20-4342-94e6-9d5860d1c95e/",
        },
        {
            "name": "Flutter REST Movie App",
            "authority": {"name": "Udemy"},
            "startDate": {"month": 8, "year": 2023},
            "displaySource": "https://www.udemy.com/certificate/UC-22efc7ca-3df5-4f26-8025-4a1bd2672f19/",
        },
        {
            "name": "Modularizing and Organizing Flutter Code",
            "authority": {"name": "LinkedIn"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://www.linkedin.com/learning/certificates/686276fa42629d4f1291da79ea46bfde0222954b60297a2e728c770768f23407",
        },
        {
            "name": "Powering Your App with Live Web Data",
            "authority": {"name": "LinkedIn"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://www.linkedin.com/learning/certificates/643f05463ae529f24bd9ea66a6ead9a20469bdb875a9ddda048c698eda3ee7c1",
        },
        {
            "name": "Firebase Cloud Firestore",
            "authority": {"name": "LinkedIn"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://www.linkedin.com/learning/certificates/8f8be25531d2bcdbab1972482150277f9a239a13ba4d314c0574638bf28d07d2",
        },
        {
            "name": "Android App Security",
            "authority": {"name": "LinkedIn"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://www.linkedin.com/learning/certificates/1c6581b35d06edfbd6275d09e84b068e813880bf7d217b703716962d7aca3518",
        },
        {
            "name": "Foundations of Cybersecurity",
            "authority": {"name": "Grow with Google on Coursera"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://coursera.org/share/67e5cb0dd7c478f1d7ec81079c3a40b8",
        },
        {
            "name": "HTML, CSS, and Javascript for Web Developers",
            "authority": {"name": "Coursera"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://coursera.org/share/67e5cb0dd7c478f1d7ec81079c3a40b8",
        },
        {
            "name": "Network Defense Essentials (NDE)",
            "authority": {"name": "EC-Council"},
            "startDate": {"month": 7, "year": 2023},
            "displaySource": "https://codered.eccouncil.org/certificate/43a2d2a7-40ed-4230-9e65-a9aa0935e651?logged=false",
        },
    ]


def get_fallback_positions():
    return {
        "elements": [
            {
                "company~": {"name": "Swisscom"},
                "title": "DevSecOps",
                "startDate": {"year": 2024},
                "endDate": {"year": 2026},
                "description": "Kubernetes, cluster deployment, security, automation, CI/CD",
            },
            {
                "company~": {"name": "Swisscom"},
                "title": "Full Stack Developer",
                "startDate": {"year": 2023},
                "endDate": {"year": 2024},
                "description": "Full-stack development with TypeScript and Golang. Built cloud migration tooling on AWS. Maintained CI/CD pipelines with GitLab.",
            },
            {
                "company~": {"name": "Odyssey Robotics"},
                "title": "Software Engineer",
                "startDate": {"year": 2020},
                "endDate": {"year": 2023},
                "description": "Flutter mobile development and Scrum Master. Designed ML pipelines in Python and developed CNN models for video classification.",
            },
        ]
    }


def get_fallback_data():
    return {
        "positions": get_fallback_positions(),
        "certifications": get_fallback_certifications(),
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
    load_dotenv()
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
