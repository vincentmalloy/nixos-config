{ ... }:
{
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "simon";
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}
