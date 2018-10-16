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

### Configure Network Manager

In /etc/NetworkManager/NetworkManager.conf, change variable `managed` to `true`.

In /etc/network/interfaces, delete wired (e.g. eth0) interfaces and only keep those lines

    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).

    source /etc/network/interfaces.d/*

    # The loopback network interface
    auto lo
    iface lo inet loopback
