{ pkgs, fresh, ... }: {
  home.packages = [
    fresh.packages.${pkgs.system}.default
  ];
}
