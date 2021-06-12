#!/bin/bash -e

if [[ -d third_party/llvm-2 ]]; then
  rm -rf third_party/llvm
  mv third_party/llvm{-2,}

  python3 tools/clang/scripts/build.py --disable-asserts \
      --skip-checkout --use-system-cmake \
      --gcc-toolchain=/usr --bootstrap-llvm=/usr/lib/sdk/llvm12 \
      --without-android --without-fuchsia
fi

tools/gn/bootstrap/bootstrap.py -v --no-clean --gn-gen-args='
    use_sysroot=false
    use_udev=false
    use_lld=true
    enable_nacl=false
    blink_symbol_level=0
    use_gnome_keyring=false
    use_pulseaudio=true
    clang_use_chrome_plugins=false
    is_official_build=true
    treat_warnings_as_errors=false
    proprietary_codecs=true
    ffmpeg_branding="Chrome"
    is_component_ffmpeg=true
    use_vaapi=true
    enable_widevine=true
    rtc_use_pipewire=true
    rtc_link_pipewire=true
    rtc_pipewire_version="0.3"
    enable_hangout_services_extension=true
'
mkdir -p out/ReleaseFree
cp out/Release{,Free}/args.gn
echo -e 'proprietary_codecs = false\nffmpeg_branding = "Chromium"' >> out/ReleaseFree/args.gn
out/Release/gn gen out/ReleaseFree
