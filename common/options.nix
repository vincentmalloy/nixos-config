{lib, ...}: {
  options = with lib; {
    # with lib;
    username = mkOption {
      description = "default system username";
      type = with types; uniq str;
    };
    fullName = mkOption {
      description = "default user full name";
      type = with types; uniq str;
    };
  };
}
