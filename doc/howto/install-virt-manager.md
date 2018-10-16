### Run libvirt as non-root user

**See also debian wiki on KVM**

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
