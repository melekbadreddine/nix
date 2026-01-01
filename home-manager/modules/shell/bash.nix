{ ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      # Quick navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      
      # Nix management
      nix-switch = "home-manager switch --flake ~/.config/nix#melek";
      nix-update = "nix flake update ~/.config/nix && home-manager switch --flake ~/.config/nix#melek";
    };
    bashrcExtra = ''
      if [ "$color_prompt" = yes ]; then
          PS1=''${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
      else
          PS1=''${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
      fi
    '';
  };
}
