#!/bin/bash -ex

# Use the --oauth2-client-id= and --oauth2-client-secret= switches for
# setting GOOGLE_DEFAULT_CLIENT_ID and GOOGLE_DEFAULT_CLIENT_SECRET at
# runtime -- this allows signing into Chromium without baked-in values
patch -Np1 -i /app/ugc-arch/use-oauth2-client-switches-as-default.patch

# Revert kGlobalMediaControlsCastStartStop enabled by default
# https://crbug.com/1314342
patch -Rp1 -F3 -i /app/ugc-arch/REVERT-enable-GlobalMediaControlsCastStartStop.patch

# Revert ffmpeg roll requiring new channel layout API support
# https://crbug.com/1325301
patch -Rp1 -i /app/ugc-arch/REVERT-roll-src-third_party-ffmpeg-m102.patch
# Revert switch from AVFrame::pkt_duration to AVFrame::duration
patch -Rp1 -i /app/ugc-arch/REVERT-roll-src-third_party-ffmpeg-m106.patch

# https://crbug.com/angleproject/7582
patch -Np0 -i /app/ugc-arch/angle-wayland-include-protocol.patch

# Wayland/EGL regression (crbug #1071528 #1071550)
patch -Np1 -i /app/ugc-arch/wayland-egl.patch

# VAAPI wayland support (https://github.com/ungoogled-software/ungoogled-chromium-archlinux/issues/161)
patch -Np1 -i /app/ugc-arch/ozone-add-va-api-support-to-wayland.patch

# Remove HEVC profile limits
patch -Np1 -i /app/ugc-arch/remove-main-main10-profile-limit.patch