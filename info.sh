#!/bin/bash
echo "--Server Name--"
hostname
echo
echo "--CPU Info--"
echo "CPU : $(cat /proc/cpuinfo | grep "model name" | cut -d ":" -f 2 | head -1) / # of Cores : $(cat /proc/cpuinfo | grep proc -c)";
echo -e "-------------------------------------"
echo -e "--Motherboard-- "
dmidecode |grep Product| uniq;
echo -e "-------------------------------------"
echo -e "--Raid Card-- "
lspci | grep -i raid | cut -d ":" -f 3
echo -e "-------------------------------------"
echo -e "--Hard Disks-- "
parted -l | grep dev
echo -e "-------------------------------------"
echo -e "--Disk Partations-- "
lsblk
echo -e "-------------------------------------"
echo -e "--Type of RAM-- "
dmidecode |grep DDR|uniq;
echo -e "-------------------------------------"
echo -e "--RAM Speed--"
dmidecode -t 17 |egrep "1333|1066|667|1067|2133|1600|1866"|uniq |grep -vi Config| uniq|cut -c 8-17;
echo -e "-------------------------------------"
echo -e "--Total RAM Installed-- "
dmidecode -t 17 |grep Size|cut -c 7-30
echo -e "-------------------------------------"
