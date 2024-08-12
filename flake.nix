{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, home-manager }: {
    nixosConfigurations.Stetv = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
	    useGlobalPkgs = true; 
            useUserPackages = true;
            users.marcel = import ./home.nix;
            extraSpecialArgs = {inherit inputs;};
	  };
        }
      ];
    };
  };
}
