# nix-server
NixOS server configuration files

# To-Do: 
- [X] Switch from systemd-boot to GRUB
- [X] Setup basic NixOS with flakes
- [X] Install basic packages (CLI tools)
- [X] Create users
- [X] Cloudflare tunnel (Not possible without clientside install!)
- [ ] Setup basic NGINX server
  - [ ] Create basic homepage 
  - [ ] Create SSL Certificate(s) with auto renewal
- [ ] Setup Pelican panel
   - [X] Install using composer (After working 5 hours on a known error)
   - [ ] Create module for th panel with required dependencies 
   - [ ] Setup sqlite [Using home-manager](https://discourse.nixos.org/t/using-home-manager-to-create-a-sqlite-database/18872)
   - [ ] Create NGINX module for Pelican panel
   - [ ] Setup Pelican panel itself 
- [ ] Install Docker 
  - [ ] Start Docker on boot
  - [ ] Enable Swap for Docker
- [ ] Setup Pelican wings
  - [ ] Install Wings Docker container
  - [ ] Turn Wings into a service
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
