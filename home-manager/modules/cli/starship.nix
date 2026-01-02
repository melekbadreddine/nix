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
        "$line_break"
        "$character"
      ];

      add_newline = true;

      os = {
        disabled = false;
        format = "[ $symbol ]($style)[](fg:${green} bg:${blue})";
        style = "bg:${green} fg:${base}";
        symbols = {
          Linux = ""; 
          Ubuntu = "";
        };
      };

      time = {
        disabled = false;
        time_format = "%R"; 
        style = "bg:${blue} fg:${base} bold";
        format = "[ 󱑎 $time ]($style)[](fg:${blue} bg:${lavender})";
      };

      directory = {
        style = "bg:${lavender} fg:${base} bold";
        format = "[ 󰉋 $path ]($style)[](fg:${lavender})";
        truncation_length = 3;
        home_symbol = "~";
      };

      git_branch = {
        symbol = "";
        style = "bg:${mauve} fg:${base} bold";
        format = "[](fg:${lavender} bg:${mauve})[ $symbol $branch]($style)";
      };

      git_status = {
        style = "bg:${mauve} fg:${base} bold";
        # We put the symbols inside the brackets so they stay in the Mauve pill
        format = "[[ $all_status$ahead_behind]($style)]($style)[](fg:${mauve})";
        conflicted = "🏳";
        ahead = "🏎💨";
        behind = "😰";
        diverged = "😵";
        untracked = "🤷";
        stashed = "󰏗";
        modified = "📝";
        staged = "++";
        deleted = "🗑";
      };

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
