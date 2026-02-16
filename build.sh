#!/usr/bin/env bash
set -euo pipefail

landscape2 build \
  --data-file data.yml \
  --settings-file settings.yml \
  --guide-file guide.yml \
  --games-file games.yml \
  --logos-path logos \
  --output-dir build

perl -0777 -i -pe 's#</head>#<style>a[href*="embed"],button[aria-label*="Embed"],button[title*="Embed"],[aria-label*="Embed"],[title*="Embed"]{display:none!important}</style></head>#s' build/index.html
perl -0777 -i -pe 's#</head>#<script>window.addEventListener("load",()=>{document.querySelectorAll("a,button,div,span").forEach(el=>{const t=(el.textContent||"").trim().toLowerCase();const href=(el.getAttribute&&el.getAttribute("href"))||"";const lab=(el.getAttribute&&(el.getAttribute("aria-label")||el.getAttribute("title")))||"";if(href.includes("embed")||lab.toLowerCase().includes("embed")||t==="embed"||t.includes("embed")){el.remove();}});});</script></head>#s' build/index.html
