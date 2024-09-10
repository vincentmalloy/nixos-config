{ ... }:
{
  programs.nixvim = {
    plugins = {
      lsp-lines = { enable = true; };
      lsp-format = { enable = true; };
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          jsonls = { enable = true; };
          nixls = { enable = true; };
        };
      };
    };
  };
}
