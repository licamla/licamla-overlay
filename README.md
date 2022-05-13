# Licamla overlay
gentoo overlay for private use

## How to use this overlay


### with local overlays

[Local overlays](https://wiki.gentoo.org/wiki/Overlay/Local_overlay) should be managed via `/etc/portage/repos.conf/`.
To enable this overlay make sure you are using a recent Portage version (at least `2.2.14`), and create a `/etc/portage/repos.conf/licamla-overlay.conf` file containing precisely:
```ini
[licamla-overlay]
location = /usr/local/portage/licamla-overlay
sync-type = git
sync-uri = https://gitlink.org.cn/licamla/licamla-overlay.git
priority=9999
```
Afterwards, simply run `emerge --sync`, and Portage should seamlessly make all our ebuilds available.

### with layman

Invoke the following:
```bash
layman -o https://www.gitlink.org.cn/attachments/entries/get_file?download_url=https://www.gitlink.org.cn/api/licamla/licamla-overlay/raw?filepath=repositories.xml&ref=master -f -a licamla-overlay
```
Or read the instructions on the [Gentoo Wiki](http://wiki.gentoo.org/wiki/Layman#Adding_custom_repositories).

## Installation

After performing those steps, the following should work (or any other package from this overlay):
```bash
sudo emerge -av media-plugins/osdlyrics
```


## Packages

- **app-editors/vnote**:  Markdown note
- **gnome-base/gnome-extra-apps**: add mail use flag for disable mail-client/evolution
- **media-plugins/osdlyrics**: display lyrics on desktop
- **net-misc/rtl88x2bu**: driver for rtl88x2bu wifi adaptors based on Realtek's source distributed with myriad adapters
