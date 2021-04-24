#!/bin/sh
curl -w '%{redirect_url}\n' -o/dev/null -s https://github.com/Eloston/ungoogled-chromium/releases/latest | rev | cut -d/ -f1 | rev
