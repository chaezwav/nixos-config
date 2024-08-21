{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./editor.nix
    ./shell.nix
    ./git.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "koehn";
    homeDirectory = "/home/koehn";
    stateVersion = "24.05";
    packages = with pkgs; [
      spotify
      inkscape
    ];
  };
}
