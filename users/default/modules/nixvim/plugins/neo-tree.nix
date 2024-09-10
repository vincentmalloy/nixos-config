{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      sources = ["filesystem" "buffers" "git_status" "document_symbols"];
      closeIfLastWindow = true;
    };
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options = {desc = "Open/Close Neotree";};
      }
    ];
  };
}
