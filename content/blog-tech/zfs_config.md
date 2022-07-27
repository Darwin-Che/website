---
title: My Data Backup Operation
description: Data backup using two HDDs and one portable SSD and Macbook.
date: 2022-07-26
tags: ["data","backup","config"]
---

My data back up program is to use two hard drive and one portable SSD and my Macbook.

The key is that every peice of data should be kept in at least two places.
And the possibility of the simultaneous failure of two or more places are minimized.
So is the possibility of unrecovered data loss.

## Description

I will backup my new data every few weeks. Each backup will be assigned an incremental ID,
which will be used to identify the change made in this backup.

ID HD1 HD2 SSD Mac
0  Y   Y
1  Y   Y
2  Y       Y   Y
.          Y   Y

----->>>>>

ID HD1 HD2 SSD Mac
0  Y   Y
1  Y   Y
2  Y   Y
3      Y   Y   Y
.          Y   Y

For each backup, create a new ID, sync this ID and the last ID to HD alternatively.
( So each HD need sync every two backup ID )

## HD Setup

Use ZFS on the HD to for 1) incremental snapshot and 2) bit corruption detection.

```
sudo zpool create -f -o ashift=12 -O normalization=formD zpool1 /dev/disk2

sudo zfs create zpool1/main

sudo zfs set mountpoint=/Users/***/zpool1 zpool1
sudo zfs set mountpoint=/Users/***/zpool1/main zpool1/main
```

```
sudo zpool import zpool1

sudo zfs mount zpool1/main

sudo zfs unmount zpool1/main

sudo zpool export zpool1
```

Snapshot

```
sudo zfs snapshot zpool1/main@1

sudo zfs destroy zpool1/main@1

sudo zfs rename zpool1/main@1 zpool1/main@2

zfs list -t snapshot

zfs list -t all -r zpool1

sudo zfs send zpool1/main@0 | pv | sudo zfs receive zpool2/main
sudo zfs send -i 0 zpool1/main@1 | pv | sudo zfs receive zpool2/main
```

