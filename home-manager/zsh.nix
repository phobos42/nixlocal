{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      ls = "eza --icons=auto -1";
      vim = "nvim";
    };
    history.size = 10000;

    initContent = "
      if [ -z \"$TMUX\" ]
        then
            tmux attach -t HOME || tmux new -s HOME
        fi
      export JAVA_HOME=$HOME/jdk-23.0.1.jdk/Contents/Home
      export PATH=$JAVA_HOME/bin:$PATH
      setopt share_history
      setopt hist_expire_dups_first
      setopt hist_ignore_dups
      setopt hist_verify
      eval \"$(starship init zsh)\"
    ";

    profileExtra = "
      eval \"$(/opt/homebrew/bin/brew shellenv)\"
    ";
  };
}
