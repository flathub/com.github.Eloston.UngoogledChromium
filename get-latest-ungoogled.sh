#!/bin/sh
tag=$(curl -w '%{redirect_url}\n' -o/dev/null -s https://github.com/Eloston/ungoogled-chromium/releases/latest | rev | cut -d/ -f1 | rev)
commit=$(curl -s "https://github.com/Eloston/ungoogled-chromium/releases/tag/$tag" | grep -Eo 'data-hovercard-url=\".*' | grep -Eo '/commit/.*' |cut -d/ -f3)

cat << EOF
      - type: git
        url: https://github.com/Eloston/ungoogled-chromium
        tag: $tag
        commit: $commit
EOF
