#!/bin/sh

exec zenity --info --title="Ungoogled Chromium Flatpak" --width=600 \
  --text="<b><big><big><big>URGENT PLEASE READ THIS</big></big></big></b>

<b><big><big>YOU WILL NOT LOSE YOUR DATA BY UPDATING.</big></big></b>

<big>You <b>MUST</b> update to the new package name <tt><small>io.github.ungoogled_software.ungoogled_chromium</small></tt> to keep using Ungoogled Chromium.</big>

The old package name <tt><small>com.github.Eloston.UngoogledChromium</small></tt> is no longer supported and will only display this message from now on.

To update, run the following command in your terminal:
<tt><small>
$ <big>flatpak update -y com.github.Eloston.UngoogledChromium</big>
Looking for updates…

Info: app com.github.Eloston.UngoogledChromium branch stable is end-of-life, in favor of io.github.ungoogled_software.ungoogled_chromium branch stable
Updating to rebased version

...

Changes complete.
</small></tt>
If you need any assistance or have any questions, feel free to ask in the Ungoogled Chromium Matrix room at <a href='https://matrix.to/#/#ungoogled-chromium:matrix.org'>#ungoogled-chromium:matrix.org</a> or the <a href='https://github.com/ungoogled-software/ungoogled-chromium-flatpak/issues'>GitHub issue tracker</a>."
