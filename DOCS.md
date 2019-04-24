# Documentation

0. [Autologin at Bootup]()
0. [Autostart X at Login]()
0. [Disable PC Speaker]()
0. [Lock Screen on Sleep]()
0. [Set Keyboard Layout to US (options: altgr-intl, caps:swapescape)]()

## Autologin at Bootup

Open a terminal and type:

```
systemctl set-default multi-user.target
systemctl edit getty@tty1.service
```

Add the following lines to the *override* file that *systemctl* just create:

```
ExecStart=-/sbin/agetty --noclear %I $TERM`
ExecStart=-/sbin/agetty --autologin sdk --noclear %I $TERM
```

## Autostart X at Login

Add the following to the bottom of one of: 

- *~/.bash_profile*
- *~/.profile* (Note: It will be ignored if *~/.bash_profile* exists)

```
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
```

### Disable PC Speaker

Create a file named */etc/modprobe.d/disable-pcspkr.conf* that contains:

```
xset b off
blacklist pcspkr
```

### Lock Screen on Sleep

Create a file called screenlock.service in 
*/etc/systemd/system/suspend.target.wants*

Add the following lines to the file:

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

Open a terminal and enable the new service with:

```
systemctl enable screenlock.service
```

## Set Keyboard Layout to US (options: altgr-intl, caps:swapescape)

Create a file named */etc/X11/xorg.conf.d/00-keyboard.conf* that contains:

`localectl --no-convert set-x11-keymap us pc105 altgr-intl caps:swapescape`

