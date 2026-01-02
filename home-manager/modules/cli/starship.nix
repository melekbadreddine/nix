{ lib, ... }: 
let
  # Catppuccin Mocha Colors
  green = "#a6e3a1";
  blue = "#89b4fa";
  lavender = "#b4befe";
  mauve = "#cba6f7";
  base = "#1e1e2e";
  red = "#f38ba8";
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
        "$character"
      ];

      add_newline = false;

      # OS ICON
      os = {
        disabled = false;
        format = "[ $symbol ]($style)[](fg:${green} bg:${blue})";
        style = "bg:${green} fg:${base}";
        symbols = {
          Linux = ""; 
          Ubuntu = "";
        };
      };

      username.disabled = true;

      # TIME
      time = {
        disabled = false;
        time_format = "%R"; 
        style = "bg:${blue} fg:${base} bold";
        format = "[ 󱑎 $time ]($style)[](fg:${blue} bg:${lavender})";
      };

      # DIRECTORY
      directory = {
        style = "bg:${lavender} fg:${base} bold";
        # If git is NOT present, this segment needs to end the arrow
        format = "[ 󰉋 $path ]($style)[](fg:${lavender} bg:${mauve})";
        truncation_length = 3;
        home_symbol = "~";
      };

      # GIT BRANCH
      git_branch = {
        symbol = "";
        style = "bg:${mauve} fg:${base} bold";
        # This segment opens the Mauve block
        format = "[ $symbol $branch ]($style)";
      };

      # GIT STATUS
      git_status = {
        style = "bg:${mauve} fg:${base} bold";
        # This finishes the Mauve block and creates the ARROW TIP at the end
        format = "([$all_status$ahead_behind]($style))[](fg:${mauve})";
        conflicted = "🏳 ";
        ahead = "🏎💨 ";
        behind = "😰 ";
        diverged = "😵 ";
        untracked = "🤷 ";
        stashed = "󰏗 ";
        modified = "📝 ";
        staged = "[++\($count\)](fg:${base} bg:${mauve})";
        deleted = "🗑 ";
      };

      # INPUT LINE
      character = {
        success_symbol = "[ ](bold ${green})"; 
        error_symbol = "[ ](bold ${red})";
      };

      nix_shell.disabled = true;
      nodejs.disabled = true;
      bun.disabled = true;
    };
  };
}
