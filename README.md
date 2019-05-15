### UTILITY TO SETUP SAMBA FILE SHARE ON RASPBERRY PI

This utility install and configure samba file share with a single command.

##### SETUP SAMBA FILE SHARE 

    1. git clone https://github.com/vikilabs/rpi_file_share.git
    2. cd rpi_file_share/src
    3. ./setup_samba_share.sh <local_folder_to_share> <share_name>

    <local_folder_to_share>
    
    Full path of folder name to be shared over the network

    <share_name>            
    
    Can be any name. The share can be accessed by this name over the network ( default name is my_share )      
    
    Example:
    
        $./setup_samba_share.sh /home/viki/music my_share

##### OPEN NEWLY CREATED SHARE IN MAC OSX
    
    1. GoTo terminal 
    2. Enter the following command
       
       $open 'smb://<user_name>:<samba_password>@<server_ip>/<share_name>'

    Example:

       $open 'smb://pi:123456@192.168.0.18/my_share'
