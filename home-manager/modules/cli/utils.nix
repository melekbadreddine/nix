{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Search & Filter
    ripgrep  # rg
    fd       # Better find
    jq       # JSON processor

    # DevOps & Git
    gh         # GitHub CLI
    lazygit    # Git TUI
    
    # Help & Cheats
    tealdeer
    navi

    # Monitoring
    bottom    # btm
    glances

    # Disk Management
    dua
    duf
    erdtree
    
    # AI
    gemini-cli
  ];
}
