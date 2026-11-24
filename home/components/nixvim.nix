{ pkgs, inputs, ... }:

{
  imports = [inputs.nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

    vimAlias = true;
    viAlias = true;

    nixpkgs.useGlobalPackages = true;
    version.enableNixpkgsReleaseCheck = false;
    defaultEditor = true;

    clipboard.providers.xclip.enable = true;

    colorschemes.catppuccin = {
      enable = true;
      package = pkgs.vimPlugins.catppuccin-nvim;
      settings.flavour = "macchiato";
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = "nix";
        command = "setlocal tabstop=2 shiftwidth=2";
      }
    ];
    
    opts = {

      number = true;
      relativenumber = true;
      cursorline = true;
      ruler = true;
      termguicolors = true;
      signcolumn = "yes";
      wrap = false;
      
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      smartindent = true;
      autoindent = true;
      
      ignorecase = true;
      smartcase = true;
      
      clipboard = "unnamedplus";
      mouse = "a";
      undofile = true;
      swapfile = false;
      splitright = true;
      splitbelow = true;
      
      fileencoding = "utf-8";
      encoding = "utf-8";
      wildmenu = true;
    };


      
      
      
      
      
      
      
      
      
      
      
  };
}      
