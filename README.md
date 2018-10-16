# GoogleDrive2NAS
Let Google Drive become a NAS while NAS is not network attached storage but nfs+afp+smb.

### Installation

##### The platform supported:

* Ubuntu 14.04-18.04
* docker(**Not yet Finished**)

##### System requirements
* A fresh installed system is suggested.
* Root privilege
* ssh and X11 client

##### Installation procedures
First we need to ssh onto the server. Notice that we will need to use X11 later.
```bash
ssh -X -Y <user>@<server_ip_address> -p <port>
```
Then, on the server, we need first to clone the repository.
```bash
sudo apt-get update 
sudo apt-get install git -y
git clone https://github.com/Entropy-xcy/GoogleDrive2NAS
cd GoogleDrive2NAS
```
Then we have to run the setup script. Notice that running this script requires root privilege.
```bash
./setup.sh
```
**You will be asked to press [ENTER] and set password in this script.**
If you are deploying this on a virtual machine, it is a good idea to take a snapshot at this moment. We will then run the initialize script. X11 is required for this step.

```bash
./initialize.sh
```

**A Firefox window will pop up**, sign in your Google Drive account and we are done!

### Usage

##### SMB

The user name of the smb is the user name you use to deploy ($USER).

The password is what you set in the setup script.

**The share name is gd_FUSE.** So the URL of the folder on windows should be

```
\\<server_ip_address>\gd_FUSE
```

Make sure you checked "Connect using different credentials" on windows.

##### NFS

(The default setting on the server is to allow any ip address to connect the share, you may change it in /etc/exports on the server.)

To mount this NFS share, we need to force the NFS4 type.

```
sudo mkdir /mnt/nfs
sudo mount -t nfs4 <server_ip_address>:/home/<username>/googledrive /mnt/nfs
```

##### AFP

(Still under development, not working yet.)