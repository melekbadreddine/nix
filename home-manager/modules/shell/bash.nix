{ ... }: {
  programs.bash = {
    enable = true;
    shellAliases = {
      # Quick navigation
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # Show all relevant files with names (excludes .json, .lock, .git, etc)
      showfiles = ''for file in *; do [[ -f "$file" && ! "$file" =~ \.(json|lock)$ && ! "$file" =~ ^\.git ]] && { echo ""; echo "=== $file ==="; cat "$file"; }; done'';
      
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
