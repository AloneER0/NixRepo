{ config, pkgs, ... }:

{

# Packages
environment.systemPackages = with pkgs; [ 

 # Apps
 tdesktop 
 slack 
 libsForQt5.kcolorpicker
 trojita
 wezterm
 libsForQt5.yakuake 
 firefox 
 libsForQt5.elisa 
 libsForQt5.kate
 onlyoffice-bin
 emacs 
 vscode 
 gimp 
 element-desktop 
 spotify 
 obsidian 
 obs-studio 
 discord
 gparted 
 microsoft-edge 
 blender 
 mpv
 kitty 

 # CLI
 aria2 
 nim 
 tmate 
 wget 
 rustup 
 go 
 git 
 python310 
 vte 
 gcc 
 btop 
 ifuse 
 bat 
 exa 
 cmake 
 gnumake 
 neovim 
 fzf 
 yt-dlp 
 tmux 
 neofetch 
 gzip 
 pfetch 
 figlet 

];

 # Steam/Gamemode
 programs.steam.enable = true;
 programs.gamemode.enable = true;

 # Flatpak
 #services.flatpak.enable = true;

 # Podman
 virtualisation.podman.enable = true;

 # Usbmuxd
 services.usbmuxd.enable = true;

 # Java
 programs.java.enable = true;

 # Starship
 programs.starship.enable = true;


}



