
# Setup a new system

To setup a new system, install some Linux distribution there. Then execute the following steps.

## Infect the system with nixos

Execute the following command on the system.

```
curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | PROVIDER=hetznercloud NIX_CHANNEL=nixos-22.05 bash -x 2>&1 | tee /tmp/infect.log
```

Afterwards, the system will reboot, so you need to reestablish an ssh connection.

## Download the target configuration and activate it

Execute the following commands:

```
cd /etc/nixos/ && curl -L https://github.com/fkz/xetex-js/archive/refs/heads/main.tar.gz | tar zxvf - --strip 1
nixos-rebuild switch
```
