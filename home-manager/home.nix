{ config, pkgs, fresh, ... }:

{
  home.username = "melek";
  home.homeDirectory = "/home/melek";

  home.sessionVariables = {
    _ZO_DOCTOR = "0";
    PATH = "$HOME/.cargo/bin:$HOME/.bun/bin:$PATH";
  };

  home.packages = with pkgs; [
    # Languages & Runtimes
    go
    cargo
    bun
    
    # Tools
    zoxide
    tre-command
    gemini-cli
    fresh.packages.${pkgs.system}.default

    # Browsers
    brave
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    icons = "always";
    extraOptions = [
      "--color=always"
    ];
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "eza --icons=always --color=always";
      la = "eza -a --icons=always --color=always";
      ll = "eza -alF --icons=always --color=always";
      lstr = "eza -l --sort=time --icons=always --color=always";
      tree = "eza --tree -L 1 --no-user --no-permissions --no-filesize --icons=always --color=always";
      nix-switch = "home-manager switch --flake ~/.config/nix#melek";
    };
    
    # This keeps Ubuntu colors and logic
    bashrcExtra = ''
      # Recovering prompt
      if [ "$color_prompt" = yes ]; then
          PS1=''${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      else
          PS1=''${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
      fi
    '';
  };

  home.stateVersion = "25.05"; 
  programs.home-manager.enable = true;
}
