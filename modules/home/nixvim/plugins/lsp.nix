{...}: {
  programs.nixvim = {
      diagnostics = {
      virtual_lines.only_current_line = true;
      virtual_text = false;
    };
    plugins = {
      lsp-lines = {
        enable = true;
      };
      lsp-format = {
        enable = true;
      };
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          jsonls = {
            enable = true;
          }; # json
          nil_ls = {
            enable = false;
          };
          nixd = {
            enable = true;
          }; # nix
        };
      };
    };
  };
}
