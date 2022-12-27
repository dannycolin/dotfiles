# Remotely access an encrypted homeserver on Debian

## Copy your public key on the server

pubkey: Path to your public key file
username: Account username on the remote machine
hostname: IP address or domain name pointing to your remote machine

```
ssh-copy-id -i $pubkey $username@$hostname
```

Add the following lines to your `~/.ssh/config` file:

Host: An alias to use with `ssh your_alias` to connect to the remote machine
hostname: IP address or domain name pointing to your remote machine
username: Account username on the remote machine
key: Path to your private key

```
Host $hostname
    Hostname $hostname
    User $username
    PubKeyAuthentication yes
    IdentityFile $path
    Port 22
```

## Install dropbear

Install the package: `apt install dropbear-initreamfs`

Copy your public key:

```
cp ~/.ssh/authorization_keys /etc/dropbear-initramfs/
```

Note: The `authorization_keys` for dropbear doesn't exist by default and that's
      why we can `cp` our own. In case it exists, you might want to copy your
      client public key manually instead of overwrite the file.

Add the following lines to your `/etc/initramfs-tools/initramfs.conf` to enable
network access while in the initramfs:

```
#
# IP: :::::$interface:dhcp
#
# Enable networking with dhcp
#

IP=:::::$interface:dhcp
```

Change the port of dropbear to avoid the mitm message saying the host
fingerprint has changed. For that, change `DROPBEAR_OPTIONS` to:

port: The port you want to assign to dropbear. It needs to be something different
      than 22.

```
DROPBEAR_OPTIONS="-p $port"
```

Finally, update the initramfs with:

```
update-initramfs -u
```

You can now boot your machine by typing the following:

```
ssh -p $port root@$ip_address
crypt-root unlock
ssh $username@$ip_address
```

