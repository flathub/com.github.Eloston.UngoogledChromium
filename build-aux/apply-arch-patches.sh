#!/bin/bash -ex

# Revert ffmpeg roll requiring new channel layout API support
# https://crbug.com/1325301
patch -Rp1 -i /app/ugc-arch/REVERT-roll-src-third_party-ffmpeg-m102.patch
# Revert switch from AVFrame::pkt_duration to AVFrame::duration
patch -Rp1 -i /app/ugc-arch/REVERT-roll-src-third_party-ffmpeg-m106.patch

# Disable kGlobalMediaControlsCastStartStop by default
# https://crbug.com/1314342
patch -Np1 -i /app/ugc-arch/disable-GlobalMediaControlsCastStartStop.patch

# https://crbug.com/angleproject/7582
patch -Np0 -i /app/ugc-arch/angle-wayland-include-protocol.patch

# Enable VAAPI on Wayland
patch -Np1 -i /app/ugc-arch/0001-ozone-wayland-add-VA-API-support.patch
