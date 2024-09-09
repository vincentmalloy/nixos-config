{config, ...}: {

  config = {
    username = "simon";
    fullName = "Simon Lundius";
    githubUser = "vincentmalloy";
    githubId = "25029432";
  };

  imports = [
    ./home-manager-config.nix
    ./configuration.nix
  ];
}
