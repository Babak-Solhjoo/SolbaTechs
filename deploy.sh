#!/usr/bin/env bash
# Deploy the committed site (HEAD) to the SolbaTechs server.
# Usage: ./deploy.sh            (uses defaults below)
#        HOST=1.2.3.4 ./deploy.sh
set -euo pipefail

HOST="${HOST:-46.225.76.29}"
SSH_KEY="${SSH_KEY:-$HOME/.ssh/gamexels_hetzner}"
WEB_ROOT="/var/www/solbatechs"
FILES=(index.html css js assets)

cd "$(dirname "$0")"

# Products are hidden for now — refuse to ship them by accident.
if git grep -q -e 'id="products"' -e 'assets/products/' HEAD -- "${FILES[@]}" \
   || git ls-tree -r --name-only HEAD -- assets | grep -q '^assets/products/'; then
  echo "Refusing to deploy: product content found in HEAD." >&2
  exit 1
fi

echo "Deploying $(git rev-parse --short HEAD) to $HOST:$WEB_ROOT"
git archive --format=tar HEAD "${FILES[@]}" | ssh -i "$SSH_KEY" -o BatchMode=yes "root@$HOST" "
  set -e
  tmp=\$(mktemp -d)
  tar -xf - -C \"\$tmp\"
  mkdir -p $WEB_ROOT
  rm -rf $WEB_ROOT.old
  [ -d $WEB_ROOT ] && mv $WEB_ROOT $WEB_ROOT.old
  mv \"\$tmp\" $WEB_ROOT
  chmod -R a+rX $WEB_ROOT
  rm -rf $WEB_ROOT.old
"
echo "Done: http://$HOST/"
