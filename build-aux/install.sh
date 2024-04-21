#!/bin/bash -ex

fix-app-id() {
	sed -e 's|io.github.ungoogled_software.ungoogled_chromium|com.github.Eloston.UngoogledChromium|g' "${@}"
}

mkdir -p /app/chromium

pushd out/Release
for path in chrome chrome_crashpad_handler icudtl.dat *.so libvulkan.so.1 *.pak *.bin *.png locales MEIPreload vk_swiftshader_icd.json; do
	# All the 'libVk*' names are just for debugging, stuff like "libVkICD_mock_icd" and "libVkLayer_khronos_validation".
	[[ "${path}" == libVk* ]] && continue
	cp -rv "${path}" /app/chromium || true
done
popd

# Place the proprietary libffmpeg in the extension path, then overwrite it with the free one.
install -Dm 755 out/ReleaseFree/libffmpeg.so /app/chromium/libffmpeg.so
install -Dm 755 out/Release/libffmpeg.so /app/chromium/nonfree-codecs/lib/libffmpeg.so
for size in 24 48 64 128 256; do
	install -Dvm 644 "chrome/app/theme/chromium/linux/product_logo_${size}.png" "/app/share/icons/hicolor/${size}x${size}/apps/com.github.Eloston.UngoogledChromium.png";
done
install -Dvm 644 cobalt.ini -t /app/etc
fix-app-id /app/ugc/io.github.ungoogled_software.ungoogled_chromium.desktop | install -Dvm 644 /dev/stdin /app/share/applications/com.github.Eloston.UngoogledChromium.desktop
fix-app-id /app/ugc/io.github.ungoogled_software.ungoogled_chromium.metainfo.xml | install -Dvm 644 /dev/stdin /app/share/metainfo/com.github.Eloston.UngoogledChromium.metainfo.xml
install -Dvm 755 chromium.sh /app/bin/chromium
