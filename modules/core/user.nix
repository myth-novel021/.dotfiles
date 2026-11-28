{ lib, host, inputs, ... }:

let
  hosts = import ../../hosts/host-config.nix;

  mkUserConf = username:
    let
      user = hosts.${username};

    in {
      users.users.${user.name} = {
        inherit (user) isNormalUser extraGroups;
      };
      
      home-manager = {

        extraSpecialArgs = { inherit inputs host user; };
        imports = [
          ../../home/home.nix
        ];
      };
    };
        
in {
  users.mutableUsers = true;
  security.sudo = {
    enable = true;
    wheelNeedsPassword = true;
  };
  
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  imports = map (username: mkUserConf username) host.users;
  
}

