{...}: {
  programs.nixvim = {
    plugins = {
      luasnip.enable = true;
    };

    lspkind = {
      enable = true;
      menu = {
        nvim_lsp = "[LSP]";
        nvim_lua = "[api]";
        path = "[path]";
        luasnip = "[snip]";
        buffer = "[buffer]";
      };
    };

    cmp = {
      enable = true;
    };
  };
}
