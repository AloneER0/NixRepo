{ config, pkgs, ... }:

{

# NetworkManager
networking.networkmanager.enable = true;

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Touchpad support
services.xserver.libinput.enable = true;

# Enable CUPS to print documents.
services.printing.enable = true;


}