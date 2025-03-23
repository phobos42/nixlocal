{ pkgs, ... } @ args:

let
  username = "garrett";
  mkImports = import ../../lib/mkImports.nix args;
in
{
  system.stateVersion = 6;

  imports = mkImports {
    inherit username;

    imports = [
      ./homebrew.nix
    ];
  };

  # services.nix-daemon.enable = true;

  environment.shells = with pkgs; [ zsh ];

  # programs.fish.enable = true;

  users.users.garrett = {
    home =  /. + "/Users/garrett";
    shell = pkgs.zsh;
  };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
    extra-platforms = x86_64-darwin aarch64-darwin
  '';
}