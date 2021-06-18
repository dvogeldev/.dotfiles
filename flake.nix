{
  description = "My configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    nur.url = "github:nix-community/NUR";
    flake-utils.url = "github:numtide/flake-utils";

    # Extras
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    nixos-hardware.url = "github:nixos/nixos-hardware";
  };

  outputs = 
    {self
    , home-manager
    , nixpkgs
    , nur
    , flake-utils
    , ...
    }: {

    overlays = [

    ];

    nixosConfigurations.dv-tp = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nixpkgs.overlays = [
	    nur.overlay
	  ];
        }
	./system/configuration.nix
	home-manager.nixosModules.home-manager {
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.users.david = import ./users/david/home.nix;
	}
      ];
    };
  };
}
