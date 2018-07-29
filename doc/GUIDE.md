# My Debian Installation

This is a guide to configure my Debian after a minimal installation.

## Configurations 

### Firefox

To install Firefox Stable, Beta, Delevoper or Nightly on your Debian Stable :

 1. Download the Firefox directly from the official website.
 
 2. Uncompress the archives in the `/opt` folder (system-wide) or in the  home folder (current user only).
 3. Create a .desktop file named `firefox-[version name].desktop` in `/usr/share/applications` (system-wide)or in `.local/share/applications` (current user only). 

**Creating a .desktop file for firefox**

Here is an example of a .desktop file :


    [Desktop Entry]
    Name=Firefox ''Your version''
    Comment=Web Browser
    GenericName=Web Browser
    X-GNOME-FullName=Firefox ''Your version'' Web Browser
    Exec=/path/to/firefox/firefox %u
    Terminal=false
    X-MultipleArgs=false
    Type=Application
    Icon=/path/to/firefox/icon
    Categories=Network;WebBrowser;
    MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
    StartupWMClass=Firefox
    StartupNotify=true

#### Flash Player

 1. Download the latest Adobe Flash Player for Linux from https://get.adobe.com/flashplayer/

    On 64bit systems, it should be: flash_player_npapi_linux.x86_64.tar.gz

    Alternatively, you can download it from: https://get.adobe.com/flashplayer/otherversions/

 2. Unpack the tar.gz file.

    `tar -xzf flash_player_npapi_linux*.tar.gz`

 3. Identify the location of the browser plugins directory, based on your Linux distribution and Firefox version:

    `Debian 9 Stretch (64-Bit): /usr/lib/mozilla/plugins/`

 4. Copy libflashplayer.so to the appropriate browser plugins directory: sudo cp libflashplayer.so <browserpluginlocation>

    `[sudo] cp libflashplayer.so /usr/lib/mozilla/plugins/`

 5. Copy the Flash Player Local Settings configurations files to the /usr directory. 

    `[sudo] cp -r usr/* /usr`


### Installing my graphical environment

To install my graphical environment I need the following packages :

    [sudo] apt install xorg i3-wm 13lock i3status rofi

### Turn off PC Speaker

 1. Create a file named `disable-pcspkr.conf` in `/etc/modprobe.d`.
 2. Add those lines in the file

    xset b off
    blacklist pcspkr

### Configure Network Manager

In /etc/NetworkManager/NetworkManager.conf, change variable `managed` to `true`.

In /etc/network/interfaces, delete wired (e.g. eth0) interfaces and only keep those lines

    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).

    source /etc/network/interfaces.d/*

    # The loopback network interface
    auto lo
    iface lo inet loopback

### How to eject a usb device

Use the followeing command : 
    
    udisksctl power-off -b /path/to/your/device

### How to change screen brightness 

Change value in `/sys/class/backlight/intel_backlight/brightness`.

*Note :* 
  - On my thinkpad E450 100% egal to 937
  - On my thinkpad x230 100% egal to 4438

### How to bind function key

 1. Install the `xbindkeys` package.

    `[sudo] apt install xbindkeysis`

    There's also a GUI application.

    `[sudo apt install xbindkeys-config`

 2. Create a .xbindkeys file and add your custom keybinding in it. `xbindkeys-config` will
    overwrite the configuration in the `.xbindkeys` file.

    To create a bindkey to control your audio with pulseaudio, you'll need to 
    install the pactl package. You can also install pavucontrol if you want to
    control more option (e.g. input/output device source, per application volume).

    `[sudo] apt install pactl`

    `[sudo] apt install pavucontrol`

### Autostart X at login

Make sure that startx is properly configured.

For Bash, add the following to the bottom of `~/.bash_profile`. If the file does not exist, copy a skeleton version from `/etc/skel/.bash_profile`. For Zsh, add it to `~/.zprofile`.

```
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
```

### Automatically login at boot

To automatically login at boot :

 1. create a backup of `/etc/systemd/system/getty.target.wants/getty@tty1.service` 
 2. edit the following line in `/etc/systemd/system/getty.target.wants/getty@tty1.service` :

    `ExecStart=-/sbin/agetty --noclear %I $TERM`

	So it looks like (change USERNAME for the username you want to login to):

	`ExecStart=-/sbin/agetty --autologin USERNAME --noclear %I $TERM` 

### Setting a PEAP connection with nmcli

Create a new connection :

    [sudo] nmcli connection add type wifi con-name [connection name] ifname wlan0 ssid eduroam

Modify the connection config file : 

    [connection]
    id=eduroamNet //Custon name
    uuid=d36a1be0-6a65-4313-9ff4-a284c50119b4 //Autogenerate with nmcli add
    type=wifi
    permissions=
    secondaries=

    [wifi]
    mac-address-blacklist=
    mac-address-randomization=0
    mode=infrastructure
    seen-bssids=
    ssid=eduroam
    security=802-11-wireless-security

    [802-11-wireless-security]
    key-mgmt=wpa-eap

    [802-1x]
    altsubject-matches=
    eap=peap;
    identity=USER@studio.unibo.it
    phase2-altsubject-matches=
    phase2-auth=mschapv2
    password=PASSWORD

    [ipv4]
    dns-search=
    method=auto

    [ipv6]
    addr-gen-mode=stable-privacy
    dns-search=
    method=auto

### How to know the font pointing to sans-serif, serif, monospace aliases

Type this command in your terminal : `fc-math [aliases]` (e.g. `fc-match Sans`)

### How to configure keyboard option

The tool localectl may be used to save the configuration in /etc/X11/xorg.conf.d/00-keyboard.conf, this file should not be manually edited, because localectl will overwrite the changes on next start.

The usage is as follows:

`localectl [--no-convert] set-x11-keymap layout [model [variant [options]]]`

To set a model, variant or options, all preceding fields need to be specified, but the preceding fields can be skipped by passing an empty string with "". Unless the --no-convert option is passed, the specified keymap is also converted to the closest matching console keymap and applied to the console configuration in vconsole.conf. See localectl(1) for more information.

To create a /etc/X11/xorg.conf.d/00-keyboard.conf like the above:

`localectl --no-convert set-x11-keymap us pc105 altgr-intl caps:swapescape`


### Set a screen splash when booting

You need to install plymouth and plymouth-themes package. 

    [sudo] apt install plymouth

You also have to edit your /etc/default/grub file by adding the `splash` argument. For that,
you'll need to modify your `GRUB_CMDLINE_LINUX_DEFAULT` variable to look like

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash

### Start screenlock on sleep with systemd

Create a file called screenlock.service in `/etc/systemd/system/suspend.target.wants`
that contain the following lines :

```
[Unit]
Description=Start screenlock at suspend time
Before=sleep.target

[Service]
User=<username>
Type=forking
Environment=<display>
ExecStart=<path to your lock script>

[Install]
WantedBy=suspend.target
```

To enable it, type the following command in your terminal :

```
systemctl enable screenlock.service
```

### Run libvirt as non-root user

You need to create a file named `50-org.example-libvirt-remote-access.pkla` in
`/etc/polkit-1/localauthority/50-local.d`.

You need to add the following lines to that file :

```
[Remote libvirt SSH access]
Identity=unix-group:virt
Action=org.libvirt.unix.manage;org.libvirt.unix.monitor
ResultAny=yes
ResultInactive=yes
ResultActive=yes
```

Finally, add your user to the libvirt group with that command :

`sudo usermod -aG libvirt [username]`
