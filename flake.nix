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
      inputs.nixpkgs.follows = "nixpkgs";
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

    hosts = [
      "caerula"
      "oblivio"
    ];

    system = "x86_64-linux";

    mkHost = hostname: nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs hostname; };

      modules = [
        disko.nixosModules.disko
        home-manager.nixosModules.default

        ./hosts/${hostname}/configuration.nix

        inputs.nixvim.homeModules.nixvim

        { networking.hostName = hostname; }

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs hostname; };
            
            user.${hostname} = import ./home/${hostname};
          };
        }
      ];
    };
  
  in 
  {
    nixosConfigurations = nixpkgs.lib.genAttrs hosts mkHost;
  };
}
