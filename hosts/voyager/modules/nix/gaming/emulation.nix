{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (retroarch.withCores (_:
      with libretro; [
        flycast
      ]))
  ];
}
