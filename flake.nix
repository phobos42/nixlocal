{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      nix-homebrew,
      flake-utils,
      ...
    }:
    let
    nixpkgsConfig = {
      config.allowUnfree = true;
    };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#bigmac
      darwinConfigurations =
        let
          inherit (inputs.nix-darwin.lib) darwinSystem;
        in
        {
          bigmac = darwinSystem {
            system = "aarch64-darwin";
            specialArgs = { inherit inputs; };
            modules = [
              inputs.nix-homebrew.darwinModules.nix-homebrew
              inputs.home-manager.darwinModules.home-manager
              ./hosts/mbp/configuration.nix
              {
                nixpkgs = nixpkgsConfig;
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.users.garrett = import ./home-manager/home.nix;
                # Optionally, use home-manager.extraSpecialArgs to pass
                # arguments to home.nix
              }
            ];
          };
        };
    }// flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          packages = pkgs;
        }
    );
}
