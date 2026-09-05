{ ... }:

{
  home.file.".hammerspoon" = {
    source = ../config/hammerspoon;
    recursive = true;
  };

  home.activation.reloadHammerspoon = ''
    $DRY_RUN_CMD /opt/homebrew/bin/hs -c "hs.reload()" || true
  '';
}
