### UTILITY TO SETUP SAMBA FILE SHARE ON RASPBERRY PI

This utility installs and configures samba file share with a single line command.

##### SETUP SAMBA FILE SHARE 

    1. git clone https://github.com/vikilabs/rpi_file_share.git
    2. cd rpi_file_share/src
    3. ./setup_samba_share.sh <local_folder_name> <share_name>

    Example:
        $./setup_samba_share.sh /home/viki/music my_share

    local_folder_name : Full path of folder name to be shared to the network
    share_name        : Any name. The share will be accessed by this name over the network(default value is my_share)      

##### OPEN NEWLY CREATED SHARE IN MAC
    
    1. GoTo terminal 
    2. Enter the following command
       
       $open 'smb://<user_name>:<samba_password>@<server_ip>/<share_name>'
