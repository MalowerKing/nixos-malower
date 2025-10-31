{
  description = "Flake for My system configuration\'s";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf.url = "github:notashelf/nvf";

    alejandra = {
      url = "github:kamadorueda/alejandra/3.1.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprlock.url = "github:hyprwm/hyprlock";

                # stylix = {
                # url = "github:danth/stylix";
                # inputs.nixpkgs.follows = "nixpkgs";
                #};
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nvf,
    alejandra,
                #stylix,
    ...
  } @ inputs: let
    system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
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
        inherit inputs system pkgs-unstable;
      };

      modules = [
        ./nixosConfigurations/Malower-Laptop/default.nix
        ({pkgs, ...}: {
          environment.systemPackages = [self.packages.${pkgs.stdenv.system}.neovim];
        })
        {
          environment.systemPackages = [alejandra.defaultPackage.${system}];
        }
                                        # stylix.nixosModules.stylix
      ];
    };

    homeConfigurations.malower = home-manager.lib.homeManagerConfiguration {
                                inherit pkgs;
      modules = [
        ./homeModules/home.nix
      ];
    };
  };
}
