#Protect King File

echo zx01 > /root/king.txt
dd if=/dev/zero of=/dev/shm/root_f bs=1000 count=100
mkfs.ext3 /dev/shm/root_f
mkdir /dev/shm/sqashfs
mount -o loop /dev/shm/root_f /dev/shm/sqashfs/
chmod -R 777 /dev/shm/sqashfs/
lessecho zx01 > /dev/shm/sqashfs/king.txt
mount -o ro,remount /dev/shm/sqashfs
mount -o bind /dev/shm/sqashfs/king.txt /root/king.txt
rm -rf /dev/shm/root_f 
