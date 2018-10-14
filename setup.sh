sudo apt-get update 
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse -y
mkdir ~/googledrive
sudo sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf
sudo apt-get install nfs-kernel-server samba -y

