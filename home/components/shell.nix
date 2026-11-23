{ pkgs, inputs, hostname, ... }:

{
  programs.zsh = {

    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "eza -lah";
      ls = "eza";
      cat = "bat";
      grep = "rga";
      find = "fd";
      df = "duf";
      du = "dust";
      update = "sudo nixos-rebuild switch --flake .#${hostname}";
    };

    history.size = 20000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
  };

  home.packages = with pkgs; [
    git
    duf
    dust
    tlrc
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    
    settings = {
      yazi = {
        mgr = {
          ratio = [ 1 4 3 ];
          sort_by = "mtime";
          sort_dir_first = true;
          sort_reverse = true;
          show_hidden = true;
          show_symlink = true;
        };
        preview = {
          image_filter = "lanczos3";
          image_quality = 90;
        }; 
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [ "--cmd" "cd" ]; 
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  }; 

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    theme = "catppuccin-mocha";
  };

  programs.ripgrep-all = {
    enable = true;
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras [
      batdiff
      batgrep
      batwatch
    ];
  };

  programs.bottom = {
    enable = true;
    settings = {
      colors = {
        low_battery_color = "red";
      };
    };
  };

  programs.tealdeer = {
    enable = true;
    settings.updates = {
      auto_update = true;
      auto_update_interval_hours = 168;
    };
  };  
}      
