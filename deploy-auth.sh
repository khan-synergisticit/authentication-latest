\#! /bin/bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_jenkins
ssh -vT git@github.com
cd authentication-latest
git reset --hard
git pull origin main
cd
docker builder  prune -f
docker compose stop -t 1 auth
docker compose rm -f auth
docker compose up -d --no-deps --build auth