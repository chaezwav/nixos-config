{
  description = "My NixOS flake setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixos.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixos-cosmic = {
      # url = "github:lilyinstarlight/nixos-cosmic";
      # inputs.nixpkgs.follows = "nixpkgs";
    # };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixos ,nixpkgs, home-manager, nix-index-database,  ... }@inputs: {
    nixosConfigurations.aesthetic = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        {
            # nix.settings = {
              # substituters = [ "https://cosmic.cachix.org/" ];
              # trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            # };
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.koehn = import ./home.nix;
            };
            programs.nix-index-database.comma.enable = true;
        }
        # nixos-cosmic.nixosModules.default
        home-manager.nixosModules.home-manager
        nix-index-database.nixosModules.nix-index
        ./configuration.nix
      ];
    };
  };
}
