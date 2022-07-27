{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  # Network/Hostname
  networking.hostName = "nixbox"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Poland";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11/Plasma DE
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.bspwm.enable = true;
  services.xserver.displayManager.sddm.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "pl";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Touchpad support
  services.xserver.libinput.enable = true;

  # User
  users.users.alone = {
    isNormalUser = true;
    home = "/home/alone";
    description = "AloneER0";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ libsForQt5.yakuake tdesktop slack libsForQt5.kcolorpicker trojita wezterm aria2 nim libsForQt5.elisa libsForQt5.kate tmate wget firefox rustup go git python310 vte gcc btop ifuse bat exa kitty cmake gnumake neovim fzf yt-dlp tmux neofetch onlyoffice-bin emacs vscode gimp element-desktop spotify obsidian obs-studio discord gzip mpv pfetch figlet gparted microsoft-edge blender ];


  # Options

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


  # SSID
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
