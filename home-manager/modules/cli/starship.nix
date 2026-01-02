{ ... }: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = ''
[░▒▓](#7aa2f7)$directory[](fg:#7aa2f7 bg:#3b4261)$git_branch$git_status[](fg:#3b4261 bg:#24283b)$nix_shell$aws$docker_context[](fg:#24283b)
$character'';

      add_newline = false;

      directory = {
        style = "bg:#7aa2f7 fg:#15161e";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = " ";
        style = "bg:#3b4261 fg:#7aa2f7";
        format = "[[ $symbol $branch ]($style)]($style)";
      };

      git_status = {
        style = "bg:#3b4261 fg:#7aa2f7";
        format = "[[($all_status$ahead_behind )]($style)]($style)";
      };

      nix_shell = {
        symbol = " ";
        style = "bg:#24283b fg:#7aa2f7";
        format = "[[ $symbol $state ]($style)]($style)";
      };

      docker_context = {
        symbol = " ";
        style = "bg:#24283b fg:#7aa2f7";
        format = "[[ $symbol $context ]($style)]($style)";
      };

      character = {
        success_symbol = "[󰘧](bold green) ";
        error_symbol = "[󰘧](bold red) ";
      };
    };
  };
}
