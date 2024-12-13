{...}: {
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>m";
        options.silent = true;
        action = "<cmd>!make<CR>";
      }
    ];
  };
}
