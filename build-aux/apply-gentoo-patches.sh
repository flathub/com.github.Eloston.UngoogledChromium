#!/bin/bash -ex

# Enable HEVC unconditionally (irrespective of whether platform has certain hardware acceleration or not)
# https://github.com/PF4Public/gentoo-overlay/blob/b19cb1445792956848aab89f7b94ffcaad4ab0bf/www-client/ungoogled-chromium/ungoogled-chromium-113.0.5672.63_p1.ebuild#L393-L396
sed -i '/^bool IsHevcProfileSupported(const VideoType& type) {$/{s++bool IsHevcProfileSupported(const VideoType\& type) { return true;+;h};${x;/./{x;q0};x;q1}' \
			media/base/supported_types.cc
