{ pkgs, ... }:{
  home.username = "marcel";
  home.homeDirectory = "/home/marcel";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    vscode
    noto-fonts
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
  
  programs.git = {
    enable = true;
    
    userName = "Marcband";
    userEmail = "marcelgerken4900@gmail.com";
  };
}
