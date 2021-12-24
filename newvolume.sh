#! /bin/bash
# This process is done after the volume has been created in AWS in the same region as the EC2 instance and attached to the instance
# This is a script to format and mount a newly attached volume to an instance
# Use the list block command to know what you have presently and active
lsblk
#check the information about the file system
sudo file -s /dev/xvdf
# Use command  below to get information about all the devices attahed to the instance
sudo lsblk -f
# Install the XFS tool to confirm its available on system
sudo yum install xfsprogs -y
# if the volume attached is an empty one, use command to format
sudo mkfs -t xfs /dev/xvdf
# Create mount point directory for the volume
echo "Enter preferred name of directory"
read name
# create directory
sudo mkdir /$name
# mount ebs volume
sudo mount /dev/xvdf /$name
# check if mounted to confirm correctly done process
lsblk
echo "Mounting of EBS volume complete"
echo "Successful"
