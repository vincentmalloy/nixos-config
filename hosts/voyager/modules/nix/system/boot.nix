{...}: {
  boot.plymouth.enable = true;
  boot.supportedFilesystems = ["ntfs"];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.efi.efiSysMountPoint = "/boot/grub";
}
