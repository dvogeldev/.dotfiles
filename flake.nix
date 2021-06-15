{
  description = "My config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    hardware.url = "github:NixOS/nixos-hardware/master;
    home = {
      url = "github:nix-community/home-manager/release-21.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-unstable = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "unstable";
    };
    emacs = {
      url = "github:nix-community/emacs-overlay/master";
      inputs.nixpkgs.follows = "unstable";
    };
  };

  outputs = { self, nixpkgs, home, ... }@inputs: {
    nixosConfigurations.dv-tp = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      modules = [ ./hosts/dv-tp ];
      specialArgs = { inherit inputs system; };
    };

    homeConfigurations.home-linux = home.lib.homeManagerConfiguration rec {
      configuration = ./users/david/home.nix;
      system = "x86_64-linux";
      homeDirectory = "/home/david";
      username = "david";
      extraSpecialArgs = {
        inherit inputs system;
	super = {
	  device.type = "laptop";
	  my.username = username;
        };
      };
    };
  };
}
