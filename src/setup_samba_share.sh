log_s="[ success..]"
log_n="[ status...]"
log_e="[ error....]"

if [ $# -lt 1 ]; then
    echo "Usage:"
    echo 
    echo "	./setup_samba_share.sh <folder_name>"
    echo 
    echo "	./setup_samba_share.sh /share"
    echo 
    echo
    exit 1 
fi

folder_name=$1"/share"

function command_status(){
    if [ $? -ne 0 ]; then
    	echo $log_e" "$1
    	exit 1
    fi
}

echo $log_n" installing samba"
which samba > /dev/null

if [ $? -eq 0 ]; then
    echo $log_n" samba already installed"
else
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install samba samba-common-bin
fi

echo $log_n" creating share"
ls $folder_name 
if [ $? -eq 0 ]; then
   $log_n" share already exist"
else   
   sudo mkdir -p $folder_name 2>&- /dev/null 
   command_status "share creation"
fi

echo $log_n" setting permission for share"
sudo chmod 777 $folder_name
command_status "setting share permission"
sudo chown $USER:$USER $folder_name

echo $log_n" creating configuration file"
echo "[share]" >> /tmp/smb.conf
echo "Comment = Pi_Share" >> /tmp/smb.conf 
echo "Path = "$folder_name >> /tmp/smb.conf
echo "Browseable = yes" >> /tmp/smb.conf
echo "Writeable = Yes" >> /tmp/smb.conf
echo "only guest = no" >> /tmp/smb.conf
echo "create mask = 0777" >> /tmp/smb.conf
echo "directory mask = 0777" >> /tmp/smb.conf
echo "Public = yes" >> /tmp/smb.conf
echo "Guest ok = yes" >> /tmp/smb.conf

sudo cp /tmp/smb.conf /etc/samba/smb.conf
command_status "copying configuration file"
sudo rm /tmp/smb.conf

echo $log_n" creating configuration file"
echo $log_n" setting samba up password"
sudo smbpasswd -a pi

echo $log_n" restarting samba server"
sudo /etc/init.d/samba restart

echo $log_n" samba installation and configuration is successful"

