{...}: {
  programs.nixvim = {
    plugins.comment = {
      enable = true;
      settings = {
        toggler = {
          line = "<leader>c";
          block = "<leader>b";
        };
      };
    };
  };
}
