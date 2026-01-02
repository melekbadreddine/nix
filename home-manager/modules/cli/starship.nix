{ lib, ... }: 
let
  # Catppuccin Mocha Colors
  green = "#a6e3a1";
  blue = "#89b4fa";
  lavender = "#b4befe";
  mauve = "#cba6f7";
  base = "#1e1e2e";
  red = "#f38ba8";
  mantle = "#181825";
in {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    
    settings = {
      format = lib.concatStrings [
        "$os"
        "$time"
        "$directory"
        "$git_branch"
        "$git_status"
        "$nix_shell"
        "$nodejs"
        "$bun"
        "$cmd_duration"
        "$line_break"
        "$character"
      ];

      add_newline = true;

      # OS
      os = {
        disabled = false;
        format = "[ $symbol]($style)";
        style = "bg:${green} fg:${base}";
        symbols = {
          Linux = " "; 
          Ubuntu = " ";
        };
      };

      # TIME
      time = {
        disabled = false;
        time_format = "%R"; # 24h HH:MM
        style = "bg:${blue} fg:${base} bold";
        format = "[ 󱑎 $time ]($style)[](fg:${blue} bg:${lavender})";
      };

      # DIRECTORY
      directory = {
        style = "bg:${lavender} fg:${base} bold";
        format = "[ 󰉋 $path ]($style)[](fg:${lavender})";
        truncation_length = 3;
        home_symbol = "~";
      };

      # GIT
      git_branch = {
        symbol = " ";
        style = "bg:${mauve} fg:${base} bold";
        format = "[](fg:${lavender} bg:${mauve})[ $symbol$branch ]($style)";
      };

      git_status = {
        style = "bg:${mauve} fg:${base} bold";
        format = "([$all_status$ahead_behind]($style))[](fg:${mauve})";
        conflicted = "🏳 ";
        ahead = "🏎💨 ";
        behind = "😰 ";
        diverged = "😵 ";
        untracked = "🤷 ";
        stashed = "󰏗 ";
        modified = "📝 ";
        staged = "[++\($count\)](fg:${green} bg:${mauve})";
        deleted = "🗑 ";
      };

      nix_shell.disabled = true;
      nodejs.disabled = true;
      bun.disabled = true;

      # INPUT LINE
      character = {
        success_symbol = "[ ](bold ${green})"; 
        error_symbol = "[ ](bold ${red})";
      };

      package.symbol = "📦 ";
    };
  };
}
