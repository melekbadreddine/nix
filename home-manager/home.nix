{ config, pkgs, ... }:

{
  home.username = "melek";
  home.homeDirectory = "/home/melek";

  home.packages = with pkgs; [
    btop
  ];

  programs.bash.enable = true;
  home.stateVersion = "25.05"; 

  programs.home-manager.enable = true;
}
