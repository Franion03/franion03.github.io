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
    access_token_direct = os.environ.get('LINKEDIN_ACCESS_TOKEN')

    access_token = None
    positions = None
    certifications = None

    # Check for direct access token first (simplest path)
    if access_token_direct:
        access_token = access_token_direct
        print("✓ Using LINKEDIN_ACCESS_TOKEN directly")

    # Step 1: Get access token via OAuth if no direct token
    elif all([client_id, client_secret, refresh_token]):
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
            print(f"   Response body: {res.text[:300] if 'res' in dir() else 'N/A'}")
            print("   Common fixes:")
            print("   - Add LINKEDIN_ACCESS_TOKEN to .env (get from LinkedIn OAuth tool)")
            print("   - Ensure app has r_liteprofile scope in LinkedIn Developer Portal")
            print("   - Regenerate refresh token if expired (>365 days)")
            return get_fallback_data()
    else:
        print("::warning:: No LinkedIn credentials. Set LINKEDIN_ACCESS_TOKEN in .env")
        print("   Get one at: https://www.linkedin.com/developers/tools/oauth")
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
    """Real certifications from LinkedIn profile.
    Update this list when you earn new certs."""
    return [
        {
            "name": "AWS Certified Cloud Practitioner (CLF-C02)",
            "authority": {"name": "Amazon Web Services (AWS)"},
            "startDate": {"month": 12, "year": 2025},
            "displaySource": "https://www.credly.com/badges/",
        },
        {
            "name": "AWS Certified AI Practitioner (AIF-C01)",
            "authority": {"name": "Amazon Web Services (AWS)"},
            "startDate": {"month": 6, "year": 2026},
            "displaySource": "https://www.credly.com/badges/",
        },
        {
            "name": "Versa Secure SD-WAN Configuration and Administration (V22)",
            "authority": {"name": "Versa Networks Academy"},
            "startDate": {"month": 1, "year": 2024},
            "displaySource": "",
        },
        {
            "name": "Versa Security Service Edge (SSE) with Concerto",
            "authority": {"name": "Versa Networks Academy"},
            "startDate": {"month": 1, "year": 2024},
            "displaySource": "",
        },
        {
            "name": "Versa SASE Essentials (ACE)",
            "authority": {"name": "Versa Networks Academy"},
            "startDate": {"month": 1, "year": 2024},
            "displaySource": "",
        },
        {
            "name": "Computer Science Degree",
            "authority": {"name": "University Miguel Hernandez"},
            "startDate": {"month": 5, "year": 2024},
            "displaySource": "",
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
