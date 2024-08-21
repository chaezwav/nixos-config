{pkgs, ...}: {
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
      switch = "nh os switch";
      boot = "nh os boot --ask && sudo reboot";
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
    nix-direnv.enable = true;
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

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      jnoortheen.nix-ide
    ];
    userSettings = {
      nix.enableLanguageServer = true;
      nix.serverPath = "${pkgs.nil}/bin/nil";
      nix.formatterPath = "${pkgs.alejandra}/bin/alejandra";
      nix.serverSettings.nil.formatting.command = ["${pkgs.alejandra}/bin/alejandra"];
      terminal.integrated.shell.linux = "${pkgs.zsh}/bin/zsh";
      editor.formatOnSave = true;
      window.titleBarStyle = "custom";
      update.mode = "none";
      git.autofetch = true;
    };
  };

  home.packages = with pkgs; [
    tldr
    spotify
    inkscape
  ];
}
