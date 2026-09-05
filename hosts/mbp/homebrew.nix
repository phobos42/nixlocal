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
      "usbutils"
      "cmake"
      "protobuf"
      "rust"
      "python@3.10"
      "wget"
      "python3"
      "libusb"
    ];
    taps = [
      # "osx-cross/arm"
      # "osx-cross/avr"
    ];
    casks = [
      "blender"
      "discord"
      "firefox"
      "kicad"
      "font-meslo-lg-nerd-font"
      "gimp"
      "hammerspoon"
      "joplin"
      "mactex"
      "mongodb-compass"
      "obsidian"
      "spotify"
      "syncthing-app"
      "prusaslicer"
      "arduino-ide"
      "Sikarugir-App/sikarugir/sikarugir"
      "ghostty"
    ];
    masApps = { };
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";  # Less aggressive
    };
  };
}