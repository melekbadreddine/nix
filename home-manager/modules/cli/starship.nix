{ ... }: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      palette = "catppuccin_mocha";

      palettes.catppuccin_mocha = {
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
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };

      format = ''
[](mauve)$directory[](fg:mauve bg:surface0)$git_branch$git_status[](fg:surface0 bg:surface1)$nix_shell[](fg:surface1 bg:surface2)$docker_context[](surface2)
$character'';

      add_newline = true;

      directory = {
        style = "bg:mauve fg:base";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = " ";
        style = "bg:surface0 fg:mauve";
        format = "[[ $symbol $branch ]($style)]($style)";
      };

      git_status = {
        style = "bg:surface0 fg:mauve";
        format = "[[($all_status$ahead_behind )]($style)]($style)";
      };

      nix_shell = {
        symbol = " ";
        style = "bg:surface1 fg:blue";
        format = "[[ $symbol $state ]($style)]($style)";
      };

      docker_context = {
        symbol = " ";
        style = "bg:surface2 fg:sky";
        format = "[[ $symbol $context ]($style)]($style)";
      };

      character = {
        success_symbol = "[󰄵 ](bold green)";
        error_symbol = "[󰄵 ](bold red)";
      };
    };
  };
}
