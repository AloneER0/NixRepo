# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ca63bbef-2abc-4bac-8e53-d1c62b335b09";
      fsType = "btrfs";
      options = [ "subvol=@" ];
    };

  fileSystems."/srv" =
    { device = "/dev/disk/by-uuid/ca63bbef-2abc-4bac-8e53-d1c62b335b09";
      fsType = "btrfs";
      options = [ "subvol=@srv" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/ca63bbef-2abc-4bac-8e53-d1c62b335b09";
      fsType = "btrfs";
      options = [ "subvol=@log" ];
    };

  fileSystems."/var/tmp" =
    { device = "/dev/disk/by-uuid/ca63bbef-2abc-4bac-8e53-d1c62b335b09";
      fsType = "btrfs";
      options = [ "subvol=@tmp" ];
    };

  fileSystems."/root" =
    { device = "/dev/disk/by-uuid/ca63bbef-2abc-4bac-8e53-d1c62b335b09";
      fsType = "btrfs";
      options = [ "subvol=@root" ];
    };

  fileSystems."/var/cache" =
    { device = "/dev/disk/by-uuid/ca63bbef-2abc-4bac-8e53-d1c62b335b09";
      fsType = "btrfs";
      options = [ "subvol=@cache" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/ca63bbef-2abc-4bac-8e53-d1c62b335b09";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/DB24-6518";
      fsType = "vfat";
    };

  fileSystems."/var/lib/docker/btrfs" =
    { device = "/home/@/var/lib/docker/btrfs";
      fsType = "none";
      options = [ "bind" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/39fdbba3-ccd4-4891-9000-72b00a3cf555"; }
    ];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = lib.mkDefault false;
  networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;
  networking.interfaces.virbr0.useDHCP = lib.mkDefault true;
  networking.interfaces.wlp8s0.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
