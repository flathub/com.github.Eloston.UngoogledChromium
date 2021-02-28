#!/bin/bash

exec zenity --info --title='Chromium Flatpak' --no-wrap \
  --text="\
The 'beta' branch has been deprecated recently. If you want to use
the latest version of ungoogled-chromium, upgrade to the 'stable'
branch: 'app/com.github.Eloston.UngoogledChromium/x86_64/stable'"
