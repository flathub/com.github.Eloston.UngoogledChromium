#!/bin/bash -ex

# Enable VAAPI on Wayland
patch -Np1 -i /app/ugc-arch/0001-ozone-wayland-add-VA-API-support.patch
