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
    navi
    cht-sh

    # Monitoring
    bottom    # btm

    # Disk Management
    dua
    duf
    
    # AI
    gemini-cli
  ];
}
