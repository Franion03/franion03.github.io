# franion03.github.io

Personal portfolio built with Flutter Web. Terminal aesthetic, dark theme.

## Auto-Update from Your Projects

Add this GitHub Action to any of your repos to automatically update the portfolio when you push code:

**.github/workflows/notify-portfolio.yml**
```yaml
name: Notify Portfolio

on:
  push:
    branches: [master, main]

jobs:
  notify:
    runs-on: ubuntu-latest
    steps:
      - uses: peter-evans/repository-dispatch@v3
        with:
          token: ${{ secrets.PERSONAL_TOKEN }}
          repository: Franion03/franion03.github.io
          event-type: project-updated
          client-payload: '{"repo": "${{ github.repository }}", "url": "${{ github.event.repository.html_url }}"}'
```

**Requirements:**
1. Copy the workflow above into your project's `.github/workflows/` directory
2. Add a GitHub Personal Access Token as a secret named `PERSONAL_TOKEN` in your repo (Settings → Secrets and variables → Actions)
   - Token needs `repo` scope
3. Push to master — the portfolio will re-scrape project data and rebuild within minutes

### How it works

- The portfolio's `scripts/projects.yaml` lists your project URLs
- `scripts/fetch_projects.py` scrapes each URL for OpenGraph metadata (title, description, preview image)
- The scraped data is written to `lib/model/project_model.dart`
- The Flutter web build picks up the changes and deploys via GitHub Pages

### Add a project

Edit `scripts/projects.yaml`:
```yaml
projects:
  - url: https://github.com/Franion03/your-new-project
```

On the next build, it will appear in the portfolio automatically.

## Local Development

```bash
flutter pub get
flutter run -d chrome
```

## Build

```bash
flutter build web
```
