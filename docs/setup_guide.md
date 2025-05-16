Installing Ubuntu on your Machine
First, we are going to want to download and install a boot-able disk image of Ubuntu server edition onto a USB flash drive. If you’re on Windows I’d recommend you use RUFUS and if you’re running on a Linux machine the Popsicle USB Flasher is my go-to tool.

Download Ubuntu Server Edition
Once the disk image has been flashed onto the USB you are going to want to boot into that USB. Depending on your hardware you are going to need to hit a key to get into your boot when when the manufacturer splash screen has displayed.

Once booted in you’re going to want to run though the Ubuntu server setup. This is fairly straight forward.

Select your Language.
Select ‘ Continue without updating ’, we will update the system later.
Select your keyboard layout, if using ‘English (US)’ click ‘Done’.
Select your network adapter. Ensure you have a valid connection and IP address. Since this is going to be used as a server I’d recommend using a direct Ethernet connection. This will make this way easier.
Leave the proxy address blank.
Leave Ubuntu mirror at default.
Select the disk you’d like to use. For this demonstration we will be using the entire disk and deselecting the LVM group option. You will be able to see a summery of the file system changes.
Set up your name, server name, username, and password.
Select ‘Install OpenSSH server’.
Skip Snap installs for now.
From here you’re going to want to remove the USB drive and restart your Ubuntu server. After the first boot you’re going to want to login with the user and password your created when setting up the machine. Once you’re in run the commands to update your system.

When booted into server run apt update commands

sudo apt update && sudo apt upgrade
Setting up Ubuntu for SSH
Once your system is updated were going to need to get the local IP address to SSH into the system. You could do all this on the server machine, but using SSH will make it way easier to copy commands and easily move media files to your new server. First to find your IP run the following command.

ip a
Your IP address will be after after ‘inet’ and will likley be the first address that doesn’t end in a 0 or 1. For my machine the local IP address is 192.168.0.60, so that what I’ll be using for the rest of this article.

Once you have this done you’re going to want to make sure you have OpenSSH installed on your main computer. You can run “ssh” in the terminal to check. As a reminder this will only work on your local network. In order to connect to a machine outside of your home network you will want to set up port forwarding and add additional security to your systems.

Once you have OpenSSH installed you can SSH into you new server.

ssh 192.168.0.60
It will ask you for your password and once you are in it will look like a normal terminal instance, but it will be for the server as it display as username@servername. Once you are in we can setup plex.

Download and Install PLEX
Download using this command. This may be an older version, but we will set-up updating shortly.

wget https://downloads.plex.tv/plex-media-server-new/1.19.3.2852-219a9974e/debian/plexmediaserver_1.19.3.2852-219a9974e_amd64.deb
Install using the dpkg command

sudo dpkg -i plexmediaserver_1.19.3.2852-219a9974e_amd64.deb
Enable and Update the PLEX server
Enable the Plex media server on boot:

sudo systemctl enable plexmediaserver.service
Start the Plex media server:

sudo systemctl start plexmediaserver.service
Verify the status of Plex media server service:

sudo systemctl status plexmediaserver.service
Once we know it works and we verified that the service is running we can add the plexmediaserver to you repositories. Doing this will allow Ubuntu to update PLEX using the standard updating commands.

echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
Update PLEX by running the system update and upgrade commands.

sudo apt-get update
sudo apt-get upgrade
Accessing PLEX Server
You should now be able to visit http://192.168.0.60:32400/web 64 and connect via the PLEX web interface. After you login to an account it will ask you where your media is stored. You should always plug a USB in and move files using commands, but we are going to go the easy route.

Open Dolphin or another file browser and connect to the server via sftp. Change my local IP address for yours. sftp://brandon@192.168.0.60

Now you have full control over the file system on the server. When I do this I create a media folder in my home directory and within the media folder I make one for movies and one for shows. The organization of this is all up to you. Move your files into a media directory on your new server.

I’d recommend checking out this article from PLEX that will show you how to name your file to help PLEX organize the meta data of your media files.

File Naming Tips: Installation | Plex Support 13

Laptop Tip: Disable Suspend on Lid Close.
To do this we will need to edit the Systemd login config file.

sudo nano /etc/systemd/logind.conf
When editing this you should only need to uncomment and change the first HandleSuspendKey option, but depending on your hardware you can edit addition setting. “Uncomment” the following keys and change it’s values to ignore:

HandleSuspendKey=ignore
HandleLidSwitch=ignore
HandleLidSwitchDocked=ignore
sudo systemctl restart systemd-logind"
