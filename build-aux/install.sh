#!/bin/bash -e

mkdir -p /app/chromium

pushd out/Release
# Keep file names in sync with build_devel_flatpak.py
for path in chrome chrome_crashpad_handler icudtl.dat *.so *.pak *.bin *.png locales MEIPreload swiftshader; do
	cp -rv $path /app/chromium || true
done
popd

# Place the proprietary libffmpeg in the extension path, then overwrite it with the free one.
install -Dm 755 out/ReleaseFree/libffmpeg.so /app/chromium/libffmpeg.so
install -Dm 755 out/Release/libffmpeg.so /app/chromium/nonfree-codecs/lib/libffmpeg.so
for size in 24 48 64 128 256; do
	install -Dvm 644 chrome/app/theme/chromium/product_logo_$size.png /app/share/icons/hicolor/${size}x${size}/apps/com.github.Eloston.UngoogledChromium.png;
done
install -Dvm 644 cobalt.ini -t /app/etc
install -Dvm 644 com.github.Eloston.UngoogledChromium.desktop -t /app/share/applications
install -Dvm 644 com.github.Eloston.UngoogledChromium.metainfo.xml -t /app/share/metainfo
install -Dvm 755 chromium.sh /app/bin/chromium
