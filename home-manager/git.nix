{...}: {
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
}
