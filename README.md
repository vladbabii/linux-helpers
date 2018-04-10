# linux-helpers
Small scripts for tasks I do very often

Ubuntu:
```console
apt-get update && apt-get install -y git && git clone https://github.com/vladbabii/linux-helpers.git ~/helpers && cd ~/helpers
```


Proxmox container:
```console
ID=1 pct exec $ID "apt-get update && apt-get install -y git && git clone https://github.com/vladbabii/linux-helpers.git ~/helpers && cd ~/helpers"
```
