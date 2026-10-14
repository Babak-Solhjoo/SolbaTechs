# SolbaTechs

Official website for **SolbaTechs** — a software studio building games, mobile apps,
web apps and data/ML processing solutions.

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

The site runs on a Hetzner CX23 server (Nuremberg) behind [Caddy](https://caddyserver.com/).
Deploy the committed `main` with:

```bash
./deploy.sh
```

It uploads only `index.html`, `css/`, `js/` and `assets/` to `/var/www/solbatechs`.
Server config lives in [`deploy/Caddyfile`](deploy/Caddyfile); once `solbatechs.com` points at
the server, swap `:80` for the domain there and Caddy turns on HTTPS automatically.

---

© SolbaTechs. All rights reserved.
