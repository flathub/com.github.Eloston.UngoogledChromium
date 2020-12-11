# ungoogled-chromium flatpak

### Extension points

To avoid having to expose more of the host filesystem in the sandbox but still
allowing extending Chromium, the following extension points are defined:
- com.github.Eloston.UngoogledChromium.Policy
- com.github.Eloston.UngoogledChromium.Extension
- com.github.Eloston.UngoogledChromium.NativeMessagingHost

#### com.github.Eloston.UngoogledChromium.Policy

This extension point can be used to configure custom Chromium policies and is
currently on version '1' and will make any policy under the `policies/managed` and
`policies/recommended` subdirectories available to Chromium.

#### com.github.Eloston.UngoogledChromium.Extension

Similarly to the above, but for Chromium extensions, this extension point is
also currently on version '1' and will make any extension under the `extensions`
subdirectory available to Chromium.

#### com.github.Eloston.UngoogledChromium.NativeMessagingHost

Also as above, but for [native messaging host](https://developer.chrome.com/docs/apps/nativeMessaging/)
support. As the other extension points, this extension point is also currently
on version '1' and exposes the `native-messaging-hosts` subdirectory to Chromium.

#### Using extension points

Extension points can be provided as regular flatpaks and an example is provided
under `examples/policies/block-dinosaur-game`. Important to note that extension points'
name must follow the syntax of `<ExtensionPointName>.<id>`, where `<ExtensionPointName>`
is one of the supported extension points above and `<id>` is a generic id for this
specific extension point.

Flatpak also supports “unmanaged extensions”, allowing loading extensions installed
into `/var/lib/flatpak/extension` and `$XDG_DATA_HOME/flatpak/extension`.
This can be useful for example to allow system administrators to expose system installed
policies, extensions, etc.

One example of such "unmanaged extension" could be an extension point that exposes
all system policies installed under `/etc/chromium-browser/policies/{managed,recommended}`.
This could be done for example by creating an extension point under
`/var/lib/flatpak/extension/com.github.Eloston.UngoogledChromium.Policy.system-policies`, with
`/var/lib/flatpak/extension/com.github.Eloston.UngoogledChromium.Policy.system-policies/<arch>/<version>`
being a symlink to `/etc/chromium-browser`. Note that `<version>` must match the
extension point version.

Also important to note that in the example above one would not be able to symlink the
actual policy file directly, as otherwise flatpak would not be able to resolve the
symlink when bind mounting the extension point.

### How do I install Widevine CDM?
	
1. Download and execute [widevine-install.sh](https://github.com/flathub/com.github.Eloston.UngoogledChromium/raw/master/widevine-install.sh)
2. Restart the browser

### Miscellaneous Issues

For other problems please check https://ungoogled-software.github.io/ungoogled-chromium-wiki/faq
before creating an issue in this repository. However keep in mind the following while
reading any document about Ungoogled Chromium:

* `~/.config/chromium` -> `~/.var/app/com.github.Eloston.UngoogledChromium/config/chromium`

`~/.config/chromium` is not accessible to Ungoogled Chromium and the above path should be used
instad.
