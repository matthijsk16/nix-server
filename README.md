# nix-server
NixOS server configuration files

# To-Do: 
- [X] Switch from systemd-boot to GRUB
- [X] Setup basic NixOS with flakes
- [X] Install basic packages (CLI tools)
- [ ] Create users
- [ ] Cloudflare tunnel
- [ ] Setup Pelican panel
- [ ] Setup Pelican wings
- [ ] Test game servers 
- [ ] Fix NAS and mountpoints
- [ ] Setup Plex
- [ ] Setup Plexx
- [ ] Test Plex
- [ ] Backup server files 
- [ ] Initial deploy and test 
- [ ] Restore gameservers
- [ ] Autodeploy through github actions
- [ ] Email server? 


# Partition table: 

- SSD 250 GB

| Label    	| Size   	| Mountpoint 	| Format 	|
|----------	|--------	|------------	|--------	|
| NIX_BOOT 	| 1 GB   	| /boot      	| FAT32  	|
| NIX_ROOT 	| 249 GB 	| /          	| Ext4   	|

- SSD 1000 GB

| Label    	| Size    	| Mountpoint 	| Format 	|
|----------	|---------	|------------	|--------	|
| NIX_HOME 	| 1000 GB 	| /home      	| Ext4   	|
