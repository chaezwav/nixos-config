{pkgs, ...}: {
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
}
