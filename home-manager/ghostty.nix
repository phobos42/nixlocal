{ pkgs, ... }:
{
  home.packages = with pkgs;[
    pkgs.ghostty-bin
  ];
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;

    enableZshIntegration = true;

    settings = {
      theme = "Abernathy";
      background-opacity = "0.8";
    };
  };
}
