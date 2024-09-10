{ ... }:
{
  programs.nixvim = {
    opts = {
      # show line numbers
      number = true;
      
      # tab width
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      
      # use spaces instead of tabs
      expandtab = true;

      breakindent = true;

      cursorcolumn = false;
      cursorline = true;

      # Hide command line unless needed
      cmdheight = 0;
    };
  };
}
