{ config, pkgs, ... }:

{
  home.username = "melek";
  home.homeDirectory = "/home/melek";

  home.packages = with pkgs; [
    git
    btop
    neovim
  ];

  programs.bash.enable = true;
  home.stateVersion = "24.05"; 

  programs.home-manager.enable = true;
}
