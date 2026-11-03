{
  description = "My nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager }:
    let
      mkHost = hostModule: nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./hosts/common.nix
          hostModule
          home-manager.darwinModules.home-manager
          {
            users.users.daniel = {
              name = "daniel";
              home = "/Users/daniel";
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.daniel = import ./home/home.nix;
          }
        ];
      };
    in
    {
      darwinConfigurations.personal = mkHost ./hosts/personal.nix;
      darwinConfigurations.work = mkHost ./hosts/work.nix;
    };
}
