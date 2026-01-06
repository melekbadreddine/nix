{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "melekbadreddine";
    userEmail = "mbadreddine5@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };

  programs.lazygit.enable = true;
}
