{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs = inputs@{
    nixpkgs, 
    home-manager, 
    disko, 
    noctalia, 
    nixvim,
    ...
  }: 

  let
    hosts = import ./hosts/host-config.nix;
    
    mkHost = name:
      let
        host = hosts.${name};

      in
      nixpkgs.lib.nixosSystem {
        system = host.system;
        specialArgs = { inherit inputs host; };
        
        modules = [
          ./hosts/${host.name}/configuration.nix

          disko.nixosModules.disko
          home-manager.nixosModules.home-manager
        ];
      };

    mkHMHost = name: 
      let
        host = hosts.${name};

      in
      home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs host; };
        modules = [
          ./home/${host.name}.nix
        ];
      };

  in
  {
    nixosConfigurations = {
      oblivio = mkHost "oblivio";
      caerula = mkHost "caerula";
    };
  };
}
