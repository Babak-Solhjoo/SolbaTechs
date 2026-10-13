# SolbaTechs

Official website for **SolbaTechs** — a software studio building games, mobile apps,
web apps and data/ML processing solutions.

## Products

| Product        | Type              | Platforms     |
| -------------- | ----------------- | ------------- |
| TankFight      | Game              | Web, Mobile   |
| TastingPlanet  | App               | Web, Mobile   |
| RoleKiln       | App               | Web, Mobile   |
| AcomoProperty  | App               | Web, Mobile   |

## Tech

Plain static site — HTML, CSS and vanilla JavaScript. No build step.

```
index.html
css/styles.css
js/main.js
assets/
```

## Running locally

Open `index.html` in a browser, or serve the folder:

```bash
python -m http.server 8080
```

## Deploying

The site is fully static, so it can be hosted on GitHub Pages
(Settings → Pages → Deploy from branch → `main` / root), Netlify, Vercel, etc.

---

© SolbaTechs. All rights reserved.
