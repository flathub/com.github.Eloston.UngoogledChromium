#!/bin/bash -ex
for size in 24 48 64 128 256; do
	install -Dvm 644 "product_logo_${size}.png" "/app/share/icons/hicolor/${size}x${size}/apps/io.github.ungoogled_software.ungoogled_chromium.png"
done
sed -i io.github.ungoogled_software.ungoogled_chromium.desktop -e '/^MimeType=/d'
install -Dvm 644 io.github.ungoogled_software.ungoogled_chromium.desktop -t /app/share/applications
install -Dvm 644 io.github.ungoogled_software.ungoogled_chromium.metainfo.xml -t /app/share/metainfo
install -Dvm 755 chromium.sh /app/bin/chromium
