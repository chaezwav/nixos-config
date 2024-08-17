{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "koehn";
  home.homeDirectory = "/home/koehn";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rswitch   = "sudo nixos-rebuild switch";
      rboot     = "sudo nixos-rebuild boot && sudo reboot";
      chome     = "cosmic-edit ~/nixos-config/home.nix";
      csys      = "cosmic-edit ~/nixos-config/configuration.nix";
      cflake    = "cosmic-edit ~/nixos-config/flake.nix";
    };
  };
  
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  
  programs.git = {
    enable = true;
    userName = "Koehn Humphries";
    userEmail = "koehnh@icloud.com";
    extraConfig = {
        gpg.format = "ssh";
        commit.gpgsign = true;
        user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
  
  home.packages = with pkgs; [
    tldr
    spotify
    inkscape
  ];
}
