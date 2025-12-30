{ config, pkgs, fresh, ... }:

{
  home.username = "melek";
  home.homeDirectory = "/home/melek";

  home.packages = with pkgs; [
    # Languages & Runtimes
    go
    cargo
    bun
    
    # Tools
    tre
    zoxide
    gemini-cli
    fresh.packages.${pkgs.system}.default

    # Browsers
    brave
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
    };
    
    # This keeps Ubuntu colors and logic
    bashrcExtra = ''
      # Recovering your prompt
      if [ "$color_prompt" = yes ]; then
          PS1=''${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      else
          PS1=''${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
      fi
      
      # Ensure cargo binaries are in PATH
      export PATH="$HOME/.cargo/bin:$PATH"
    '';
  };

  home.stateVersion = "25.05"; 
  programs.home-manager.enable = true;
}
