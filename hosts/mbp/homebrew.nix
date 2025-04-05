_:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "garrett";
    autoMigrate = true;
  };

 homebrew = {
    enable = true;
    brews = [
      "age"
      "docker-compose"
      "eza"
      "git"
      "magic-wormhole"
      "neovim"
      "node"
      "ollama"
      "qmk/qmk/qmk"
      "usbutils"
    ];
    taps = [
      "osx-cross/arm"
      "osx-cross/avr"
      "qmk/qmk"
    ];
    casks = [
      "blender"
      "discord"
      "firefox"
      "font-meslo-lg-nerd-font"
      "gimp"
      "hammerspoon"
      "joplin"
      "mactex"
      "mongodb-compass"
      "obsidian"
      "spotify"
      "syncthing"
      "prusaslicer"
      "arduino-ide"
    ];
    masApps = { };
    onActivation.cleanup = "zap";
  };
}