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
        # This is a representative endpoint; actual endpoint may vary based on app permissions
        profile_url = "https://api.linkedin.com/v2/me?projection=(positions:(elements:(company~(name),title,startDate,endDate,description)))"
        headers = {'Authorization': f'Bearer {access_token}'}
        res = requests.get(profile_url, headers=headers)
        res.raise_for_status()
        
        return res.json()
    except Exception as e:
        print(f"Error fetching LinkedIn data: {e}")
        return get_mock_data()

def get_mock_data():
    return {
        "positions": {
            "elements": [
                {
                    "company~": {"name": "LinkedIn (Mock)"},
                    "title": "Software Engineer",
                    "startDate": {"year": 2024},
                    "description": "Integration specialist"
                },
                {
                    "company~": {"name": "GitHub (Mock)"},
                    "title": "DevOps Engineer",
                    "startDate": {"year": 2023},
                    "description": "Workflow automation"
                }
            ]
        }
    }

def format_to_dart(data):
    # Map LinkedIn positions to the app's Timeline model
    timeline_items = []
    positions = data.get('positions', {}).get('elements', [])
    
    # Sort by start date (descending)
    positions.sort(key=lambda x: x.get('startDate', {}).get('year', 0), reverse=True)

    for pos in positions:
        company_name = pos.get('company~', {}).get('name', 'Unknown')
        year = str(pos.get('startDate', {}).get('year', ''))
        title = pos.get('title', '')
        desc = pos.get('description', '')
        
        item = f"""  Timeline(
    '{company_name}',
    messages: [
      TimelineMessage('Role', '{title}'),
      TimelineMessage('Details', '{desc.replace(chr(10), " ")}'),
    ],
    date: '{year}'
  )"""
        timeline_items.append(item)

    dart_content = f"""import 'companies.dart';

List<Timeline> linkedinCompanies = [
{("," + chr(10)).join(timeline_items)}
];
"""
    return dart_content

if __name__ == "__main__":
    data = fetch_linkedin_data()
    dart_code = format_to_dart(data)
    
    output_path = "lib/model/linkedin_data.dart"
    with open(output_path, "w") as f:
        f.write(dart_code)
    print(f"Successfully generated {output_path}")
