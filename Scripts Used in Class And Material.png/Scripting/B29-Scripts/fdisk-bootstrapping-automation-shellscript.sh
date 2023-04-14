#!/bin/bash
ALLDISKS=$(lsblk | grep -i disk | wc -l)
MYDISKS=$(expr $ALLDISKS - 1)
echo $MYDISKS
NEWDISKS=$(lsblk | grep -i disk | tail -${MYDISKS} | cut -d ' ' -f 1)
echo $NEWDISKS
for DISK in $NEWDISKS; do
    fdisk /dev/$DISK <<EOF
n
p
1


w
EOF
    mkdir /${DISK}1
    mkfs.ext4 /dev/${DISK}1
    mount /dev/${DISK}1 /${DISK}1
done

#Delete Folders and Partitions

#!/bin/bash
ALLDISKS=$(lsblk | grep -i disk | wc -l)
MYDISKS=$(expr $ALLDISKS - 1)
echo $MYDISKS
NEWDISKS=$(lsblk | grep -i disk | tail -${MYDISKS} | cut -d ' ' -f 1)
echo $NEWDISKS
for DISK in $NEWDISKS; do
    umount /dev/${DISK}1
	rm -rf /dev/${DISK}1
    fdisk /dev/$DISK <<EOF
d


w
EOF
done
