{ pkgs, ... }: {
  home.packages = with pkgs; [
    go
    cargo
    bun
  ];
  home.sessionVariables = {
    PATH = "$HOME/.cargo/bin:$HOME/.bun/bin:$PATH";
  };
}
