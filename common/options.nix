{lib, ...}: {
  options = with lib;{

  # with lib;
  username = mkOption{
  	description = "default system username";
  	type = with types; uniq str;
  };
  hostname = mkOption{
  	description = "system host name";
  	type = with types; uniq str;
  };
  };
}
