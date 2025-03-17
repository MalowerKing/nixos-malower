{

description = "Flake for My system configuration\'s";

inputs = {
 nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
 nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

 home-manager = {
   url = "github:nix-community/home-manager";
   inputs.nixpkgs.follows = "nixpkgs";
  };
};

outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs: 

    let
      system = "x86_64-linux";
    in {

    # nixos - system hostname
    nixosConfigurations.malower = nixpkgs.lib.nixosSystem {
      specialArgs = {
        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
        inherit inputs system;
      };
      modules = [
        ./nixosConfigurations/Malower-Laptop/default.nix
      ];
    };

    homeConfigurations.malower = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./homeModules/home.nix ];
    };
  };
}


