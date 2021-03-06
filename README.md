# ungoogled-chromium flatpak

## How do I install Widevine CDM?
	
1. Download and execute [widevine-install.sh](https://github.com/flathub/com.github.Eloston.UngoogledChromium/raw/master/widevine-install.sh)
2. Restart the browser

## How do I fix the spell checker?

1. Go to https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries/+/master
2. Find a bdic you want, click on it. You will see a mostly empty page aside from “X-byte binary file”
3. On the bottom right corner, click “txt”. For en-US-9-0.bdic, you will get a link https://chromium.googlesource.com/chromium/deps/hunspell_dictionaries/+/master/en-US-9-0.bdic?format=TEXT
4. This is a base64-encoded file that needs to be decoded.
5. Now, simply run `base64 -d en-US-9-0.bdic > ~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium/Dictionaries/en-US-9-0.bdic` (assuming you want the dictionary to be in the default profile)
6. Toggle spell check in `chrome://settings/languages`, or restart the browser for the dictionaries to take effect.

## How to force enable dark theme?

1. Create or add to the file `~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium-flags.conf`
2. It should contain the following: 

```
--force-dark-mode
--enable-features=WebUIDarkMode
```

### For other problems please visit https://ungoogled-software.github.io/ungoogled-chromium-wiki/faq
