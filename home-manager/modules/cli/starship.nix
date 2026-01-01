{ ... }: {
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    # Configuration
    settings = {
      add_newline = false;
      line_break.disabled = true;
      package.disabled = true;
      # Style
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
