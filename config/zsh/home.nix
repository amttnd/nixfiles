{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
      eval "$(${pkgs.fnm}/bin/fnm env)"
    '';
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };
  };
}
