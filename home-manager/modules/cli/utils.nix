{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep  # rg
    fd       # Better find
    jq       # JSON processor
  ];
}
