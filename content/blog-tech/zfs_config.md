---
title: My Data Backup Operation
description: Data backup using two HDDs and one portable SSD and Macbook.
date: 2023-06-16
tags: ["data","backup","config"]
---

## Simple and Easy

Two hard disks mirror each other.

Check status of the disk using

```
sudo zpool import
---
   pool: tank
     id: 12764437793255886395
  state: ONLINE
 action: The pool can be imported using its name or numeric identifier.
 config:

	tank                                            ONLINE
	  mirror-0                                      ONLINE
	    media-91BB9297-8A96-C547-890B-2FBD3618CCDC  ONLINE
	    media-D89A8781-DF1D-5147-96F5-3732792B3847  ONLINE
```

Import the disks using

```
sudo zpool import tank
sudo zpool export tank
```

Still create snapshots after every sync

```
zfs list -t snapshot
---
NAME                    USED  AVAIL     REFER  MOUNTPOINT
tank/main@begin         236K      -     1.92M  -
tank/main@221023_init   419M      -      280G  -

sudo zfs snapshot tank/main@221023_init
```

Check disk health

```
zpool status -v
zpool scrub (-w/-s/-p)
```



## Complicated Manual Backup (aborted)

My data back up program is to use two hard drive and one portable SSD and my Macbook.

The key is that every peice of data should be kept in at least two places.
And the possibility of the simultaneous failure of two or more places are minimized.
So is the possibility of unrecovered data loss.

## Description

I will backup my new data every few weeks. Each backup will be assigned an incremental ID,
which will be used to identify the change made in this backup.

|ID |HD1 |HD2 |SSD |Mac |
|---|----|----|----|----|
|0  |Y   |Y   |    |    |
|1  |Y   |Y   |    |    |
|2  |Y   |    |Y   |Y   |
|.  |    |    |Y   |Y   |

TO

| ID | HD1 | HD2 | SSD | MAC |
|----|-----|-----|-----|-----|
| 0  | Y   | Y   |     |     |
| 1  | Y   | Y   |     |     |
| 2  | Y   | Y   |     |     |
| 3  |     | Y   | Y   | Y   |
| .  |     |     | Y   | Y   |


For each backup, create a new ID, sync this ID and the last ID to HD alternatively.
( So each HD need sync every two backup ID )

## HD Setup

Use ZFS on the HD to for 1) incremental snapshot and 2) bit corruption detection.

```
sudo zpool create -f -o ashift=12 -O normalization=formD zpool1 /dev/disk2
sudo zpool create -f -o ashift=12 -O normalization=formD zpool2 /dev/disk3

sudo zfs create zpool1/main
sudo zfs create zpool2/main

sudo zpool export zpool1
sudo zpool export zpool2
sudo zpool import -d /var/run/disk/by-id zpool1
sudo zpool import -d /var/run/disk/by-id zpool2

sudo zfs set mountpoint=/Users/***/zpool1 zpool1
sudo zfs set mountpoint=/Users/***/zpool2 zpool2
sudo zfs set mountpoint=/Users/***/zpool1/main zpool1/main
sudo zfs set mountpoint=/Users/***/zpool2/main zpool2/main
```

## HD mount and unmount

```
sudo zpool import zpool1 zpool2

sudo zfs mount zpool1/main zpool2/main

sudo zfs unmount zpool1/main zpool2/main

sudo zpool export zpool1 zpool2
```

Snapshot

```
sudo zfs snapshot zpool1/main@1
sudo zfs snapshot zpool2/main@1

sudo zfs destroy zpool1/main@1
sudo zfs destroy zpool2/main@1

sudo zfs rename zpool1/main@1 zpool1/main@2
sudo zfs rename zpool2/main@1 zpool2/main@2

zfs list -t snapshot

zfs list -t all -r zpool1

sudo zfs send zpool1/main@0 | pv | sudo zfs receive zpool2/main
sudo zfs send -i 0 zpool1/main@1 | pv | sudo zfs receive zpool2/main
```



