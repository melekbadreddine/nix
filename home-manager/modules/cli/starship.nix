{ lib, ... }: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    
    settings = {
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_status"
        "$nix_shell"
        "$nodejs"
        "$bun"
        "$rust"
        "$golang"
        "$cmd_duration"
        "$time"
        "$line_break"
        "$character"
      ];

      add_newline = true;

      # UI ELEMENTS
      character = {
        success_symbol = "[• ](bold green) ";
        error_symbol = "[• 󰅙](bold red) ";
      };

      # TIME
      time = {
        disabled = false;
        time_format = "%T"; # HH:MM:SS
        style = "bg:#1a1b26 fg:#7aa2f7 bold";
        format = "at [](fg:#1a1b26)[🕙 $time]($style)[](fg:#1a1b26) ";
      };

      # USER & HOST
      username = {
        show_always = true;
        style_user = "bg:#9ece6a fg:#15161e bold";
        style_root = "bg:#f7768e fg:#15161e bold";
        format = "[](fg:#9ece6a)[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bg:#9ece6a fg:#15161e bold";
        format = "[@$hostname]($style)[](fg:#9ece6a) ";
      };

      # DIRECTORY
      directory = {
        style = "bg:#7aa2f7 fg:#15161e bold";
        format = "[](fg:#7aa2f7)[$path]($style)[](fg:#7aa2f7) ";
        truncation_length = 3;
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = "  ";
          "Music" = "󰎈 ";
          "Pictures" = "  ";
          "Dev" = "󱔗 ";
        };
      };

      # GIT
      git_branch = {
        symbol = " ";
        style = "bg:#bb9af7 fg:#15161e bold";
        format = "[](fg:#bb9af7)[$symbol $branch]($style)[](fg:#bb9af7) ";
      };

      git_status = {
        style = "bold fg:#bb9af7";
        format = "([$all_status$ahead_behind]($style) )";
        conflicted = "🏳 ";
        ahead = "🏎💨 ";
        behind = "😰 ";
        diverged = "😵 ";
        untracked = "🤷 ";
        stashed = "󰏗 ";
        modified = "📝 ";
        staged = "[++\($count\)](green)";
        deleted = "🗑 ";
      };

      # LANGUAGES & TOOLS
      bun = {
        symbol = "󰛦 ";
        format = "via [$symbol($version)]($style) ";
        style = "bold #fbf0f1"; # Bun's signature light-pink/white
      };

      nodejs = {
        symbol = " ";
        format = "via [$symbol($version)]($style) ";
        style = "bold green";
      };

      nix_shell = {
        symbol = " ";
        format = "via [$symbol $state]($style) ";
        style = "bold blue";
      };

      package.symbol = "📦 ";

      cmd_duration = {
        min_time = 500;
        format = "took [ $duration](bold yellow) ";
      };

      rust.symbol = " ";
      golang.symbol = "󰟓 ";
      lua.symbol = " ";
    };
  };
}
