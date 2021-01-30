#!/bin/bash

curl -s https://github.com/Eloston/ungoogled-chromium/releases \
	| grep '/Eloston/ungoogled-chromium/releases/tag/' \
	| cut -d/ -f6 | head -1 | sed -e 's/\">$//g'
