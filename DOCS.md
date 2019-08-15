# Documentation

0. [Configure intel_backlight]()
0. [Configure Network Manager]()
0. [Configure PEAP connection with nmcli]()
0. [Disable PC Speaker]()
0. [Lock Screen on Sleep]()
0. [Run libvirt as non-root user]()
0. [Set Swapiness Value]()

## Configure intel_backlight 

Create a file named */etc/X11/xorg.conf.d/20-intel.conf* that contains:

```
Section "Device"
    Identifier  "Intel Graphics" 
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
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
Environment=DISPLAY=:0
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
sudo usermod -aG libvirt <username>
```

## Set Swapiness Value

Create a file named */etc/sysctl.d/10-local.conf* and add:

```
vm.swapiness=10 
```
