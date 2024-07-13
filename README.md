# nix-server
NixOS server configuration files


# Partition table: 

- SSD 250 GB

| Label    	| Size   	| Mountpoint 	| Format 	|
|----------	|--------	|------------	|--------	|
| NIX-BOOT 	| 1 GB   	| /boot      	| FAT32  	|
| NIX-ROOT 	| 249 GB 	| /          	| Ext4   	|

- SSD 1000 GB

| Label    	| Size    	| Mountpoint 	| Format 	|
|----------	|---------	|------------	|--------	|
| NIX-HOME 	| 1000 GB 	| /home      	| Ext4   	|
