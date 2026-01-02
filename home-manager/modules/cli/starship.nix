{ lib, ... }: 
let
  # Catppuccin Mocha Colors
  rosewater = "#f5e0dc";
  flamingo = "#f2cdcd";
  pink = "#f5c2e7";
  mauve = "#cba6f7";
  red = "#f38ba8";
  maroon = "#eba0ac";
  peach = "#fab387";
  yellow = "#f9e2af";
  green = "#a6e3a1";
  teal = "#94e2d5";
  sky = "#89dceb";
  sapphire = "#74c7ec";
  blue = "#89b4fa";
  lavender = "#b4befe";
  text = "#cdd6f4";
  base = "#1e1e2e";
  mantle = "#181825";
  crust = "#11111b";
in {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    
    settings = {
      # Custom format using OS icon and Powerline arrows
      format = lib.concatStrings [
        "$os"
        "$username"
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

      # OS & USER
      os = {
        disabled = false;
        format = "[ $symbol]($style)";
        style = "bg:${green} fg:${base}";
        symbols.linux = " ";
        symbols.ubuntu = " ";
      };

      username = {
        show_always = true;
        style_user = "bg:${green} fg:${base} bold";
        style_root = "bg:${red} fg:${base} bold";
        format = "[$user]($style)[](fg:${green} bg:${blue})";
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
        format = "[ 󰉋 $path ]($style)[](fg:${lavender} bg:${mauve})";
        truncation_length = 3;
        home_symbol = "~";
      };

      # GIT
      git_branch = {
        symbol = " ";
        style = "bg:${mauve} fg:${base} bold";
        format = "[ $symbol$branch ]($style)";
      };

      git_status = {
        style = "bg:${mauve} fg:${base} bold";
        format = "([$all_status$ahead_behind]($style))[](fg:${mauve} bg:${mantle})";
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

      # NIX & TOOLS
      nix_shell = {
        symbol = " ";
        format = "[ via $symbol$state]($style)";
        style = "bg:${mantle} fg:${blue} bold";
      };

      nodejs = {
        symbol = " ";
        format = "[ $symbol($version)]($style)";
        style = "bg:${mantle} fg:${green} bold";
      };

      bun = {
        symbol = "󰛦 ";
        format = "[ $symbol($version)]($style)";
        style = "bg:${mantle} fg:${rosewater} bold";
      };

      cmd_duration = {
        min_time = 500;
        format = "[ took  $duration]($style)";
        style = "bg:${mantle} fg:${yellow} bold";
      };

      # INPUT LINE
      character = {
        success_symbol = "[• ](bold ${green}) ";
        error_symbol = "[• 󰅙](bold ${red}) ";
      };

      package.symbol = "📦 ";
    };
  };
}
