Cmnd_Alias GETINFO = /usr/sbin/dmidecode --type 17
tech ALL = NOPASSWD:GETINFO

Cmnd_Alias FDISKINFO = /user/sbin/fdisk -l 2>/dev/null
tech ALL = NOPASSWD:FDISKINFO

# tech ALL = (root) NOPASSWD: /home/tech/st
tech ALL = (ALL) NOPASSWD:ALL
