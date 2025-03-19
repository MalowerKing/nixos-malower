{
  description = "Flake for My system configuration\'s";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";

    alejandra = {
      url = "github:kamadorueda/alejandra/3.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nvf,
    alejandra,
    ...
  } @ inputs: let
    system = "x86_64-linux";
  in {
    packages.${system}.neovim =
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [./homeModules/modules/nvf-configuration.nix];
      })
      .neovim;

    # malower - system hostname
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
        ({pkgs, ...}: {
          environment.systemPackages = [self.packages.${pkgs.stdenv.system}.neovim];
        })
        {
          environment.systemPackages = [alejandra.defaultPackage.${system}];
        }
      ];
    };

    homeConfigurations.malower = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        ./homeModules/home.nix
      ];
    };
  };
}
