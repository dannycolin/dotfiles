
### Installing my graphical environment

To install my graphical environment I need the following packages :

    [sudo] apt install xorg i3-wm 13lock i3status rofi

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

### How to configure keyboard option

The tool localectl may be used to save the configuration in /etc/X11/xorg.conf.d/00-keyboard.conf, this file should not be manually edited, because localectl will overwrite the changes on next start.

The usage is as follows:

`localectl [--no-convert] set-x11-keymap layout [model [variant [options]]]`

To set a model, variant or options, all preceding fields need to be specified, but the preceding fields can be skipped by passing an empty string with "". Unless the --no-convert option is passed, the specified keymap is also converted to the closest matching console keymap and applied to the console configuration in vconsole.conf. See localectl(1) for more information.

To create a /etc/X11/xorg.conf.d/00-keyboard.conf like the above:

`localectl --no-convert set-x11-keymap us pc105 altgr-intl caps:swapescape`

### How to change screen brightness 

Change value in `/sys/class/backlight/intel_backlight/brightness`.

*Note :* 
  - On my thinkpad E450 100% egal to 937
  - On my thinkpad x230 100% egal to 4438

### Turn off PC Speaker

 1. Create a file named `disable-pcspkr.conf` in `/etc/modprobe.d`.
 2. Add those lines in the file

    xset b off
    blacklist pcspkr
