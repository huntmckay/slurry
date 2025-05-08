# Linux Setup Guide for 170A Access to CVTE (Omnissa Horizon)

## BLUF:
To access CVTE from outside the schoolhouse, you must use Omnissa Horizon 8.  
Build 2305 is broken following VMware's Broadcom acquisition.

## No Warranty

These instructions are unofficial and come with no warranty.
If you're a Linux user, you already know that self-inflicted problems are part of the experience. Good luck.

---

## requirements

- Wayland (not X11/Xorg)
- `opensc` installed for CAC support
- `omnissa-horizon-client` `.deb` installer file
- [i got mine from here](https://customerconnect.omnissa.com/downloads/details?downloadGroup=CART26FQ1_LIN64_DEBPKG_2503&productId=1562&rPId=118987)

---

## ubuntu users: fix post-install snap user breakage

Snap creates a system user with `/usr/bin/false` as a shell, which breaks the installer.

### step-by-step:

```bash
sudo dpkg -i omnissa.deb

# Wait for the install to fail

sudo nvim /var/lib/dpkg/info/omnissa-horizon-client.postinst


# update line 74 to include /usr/bin/bash
if [ "$uid" -ge 1000 ] && [ "$username" != "nobody" ] && [ "$shell" != "/usr/sbin/nologin" ] && [ "$shell" != "/bin/false" ] && [ "$shell" != "/usr/bin/false" ]; then


# reinstall the postinstall w/ dpkg
sudo bash /var/lib/dpkg/info/omnissa-horizon-client.postinst
```

## fix cac auth (pkcs11 path)
```bash
# the horizon client doesn't correctly link the opensc pkcs#11 driver.
cd /usr/lib/omnissa/horizon/
sudo mkdir pkcs11
sudo ln -s /usr/lib/x86_64-linux-gnu/pkcs11/opensc-pkcs11.so ./pkcs11/libopensc-pkcs11.so.so
```

## for troubleshooting
```bash
# check the installer log
less /tmp/omnissa-$USER/horizon-client-301136.log
```

## But Why?

because no one should have to install windows just to complete training.

virtualized windows environments are slow, laggy, and frustrating to work in — especially when nested.

you decide:

### option a (recommended)
ubuntu → cvte (windows) → cctc (windows/ubuntu)

### option b (slower, heavier)
ubuntu → virtualbox (windows) → cvte (windows) → cctc (windows/ubuntu)

skip the extra layer. use your linux environment efficiently.
