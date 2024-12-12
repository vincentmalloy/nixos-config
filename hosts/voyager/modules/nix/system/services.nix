{ ... }:
{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    # listenAddresses = [];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "simon";
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
}
