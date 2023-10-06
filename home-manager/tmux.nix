# tmux settings

{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "\"${pkgs.zsh}/bin/zsh\"";
    escapeTime = 0;
    baseIndex = 1;
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-plugins "cpu-usage ram-usage"
          set -g @dracula-show-left-icon session
        '';
      }
      {
        plugin = tmuxPlugins.mkTmuxPlugin {
          pluginName = "sensible";
          version = "25cb91";
          src = pkgs.fetchFromGitHub {
            owner = "tmux-plugins";
            repo = "tmux-sensible";
            rev = "25cb91f42d020f675bb0a2ce3fbd3a5d96119efa";
            hash = "sha256-sw9g1Yzmv2fdZFLJSGhx1tatQ+TtjDYNZI5uny0+5Hg=";
          };
        };
      }
    ];

    # Replaces ~/.tmux.conf
    extraConfig = (builtins.readFile ../config/tmux.conf);
  };
}
