{ ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      # live_config_reload = true;

      # import = [ "~/.config/alacritty/themes/themes/gruvbox_dark.toml" ];

      keyboard.bindings = [{
        action = "ToggleSimpleFullscreen";
        key = "Return";
        mods = "Command";
      }];

      window = {
        decorations = "none";
        opacity = 0.8;
        blur = false;
        dimensions = {
          columns = 50;
          lines = 60;
        };
        position = {
          x = 0;
          y = 0;
        };
      };

      font = {
        normal = {
          family = "MesloLGS Nerd Font Mono";
          style = "Regular";
        };
        size = 13;
      };
    };
  };
}
