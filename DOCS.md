# Documentation

0. [Autologin at Bootup]()
0. [Autostart X at Login]()
0. [Change Network Interface Name]()
0. [Configure Network Manager]()
0. [Configure PEAP connection with nmcli]()
0. [Disable PC Speaker]()
0. [Lock Screen on Sleep]()
0. [Set Keyboard Layout to US (options: altgr-intl, caps:swapescape)]()
0. [Run libvirt as non-root user]()

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

## Change network name interface

Create a file named */etc/systemd/network/10-<interface_name>.link* containing:

```
[Match]
MACAddress=<mac_address>

[Link]
Name=<interface_name>
```

### Configure Network Manager

In */etc/NetworkManager/NetworkManager.conf*, change variable `managed` to `true`.

Modify */etc/network/interfaces* so it looks like:

```
source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback
```

## Configure PEAP connection with nmcli

Create a new connection :

```
nmcli connection add type wifi con-name <connection_name> ifname <interface_name> ssid <ssid_name>
```

Add the following properties:

```
[connection]
id=<connection_name>

[wifi]
mode=infrastructure
ssid=<ssid_name>
security=802-11-wireless-security

[802-11-wireless-security]
key-mgmt=wpa-eap

[802-1x]
eap=peap;
identity=<username>
phase2-auth=mschapv2
password=<password>

[ipv4]
method=auto

[ipv6]
addr-gen-mode=stable-privacy
method=auto
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

## Run libvirt as non-root user

**See also debian wiki on KVM**

Create a file named 
*/etc/polkit-1/localauthority/50-local.d/50-org.example-libvirt-remote-access.pkla*.

Add the following lines:

```
[Remote libvirt SSH access]
Identity=unix-group:virt
Action=org.libvirt.unix.manage;org.libvirt.unix.monitor
ResultAny=yes
ResultInactive=yes
ResultActive=yes
```

Add your user to the libvirt group:

```
sudo usermod -aG libvirt [username]
```

## Set Keyboard Layout to US (options: altgr-intl, caps:swapescape)

Create a file named */etc/X11/xorg.conf.d/00-keyboard.conf* that contains:

```
localectl --no-convert set-x11-keymap us pc105 altgr-intl caps:swapescape
```

