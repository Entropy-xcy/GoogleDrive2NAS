google-drive-ocamlfuse ~/googledrive -o allow_root
sudo service smbd restart
sudo systemctl restart nfs-kernel-server

