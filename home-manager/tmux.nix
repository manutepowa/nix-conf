# tmux settings

{ config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    baseIndex = 1;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.mkTmuxPlugin {
          pluginName = "tmux-nerd-font-window-name";
          version = "b5948e8";
          src = pkgs.fetchFromGitHub {
            owner = "joshmedeski";
            repo = "tmux-nerd-font-window-name";
            rev = "b5948e82c4931cb253282046bb053025441d8c34";
            sha256 = "sha256-8Uw6WNHuohq7KFhCq8fS69rLvzYTc/mRf2drvczhC9A=";
          };
        };
      }
      {
        plugin = tmuxPlugins.mkTmuxPlugin {
          pluginName = "cpu";
          version = "unstable-2023-01-06";
          src = fetchFromGitHub {
            owner = "tmux-plugins";
            repo = "tmux-cpu";
            rev = "98d787191bc3e8f19c3de54b96ba1caf61385861";
            sha256 = "sha256-ymmCI6VYvf94Ot7h2GAboTRBXPIREP+EB33+px5aaJk=";
          };
        };
      }
    ];

    # Replaces ~/.tmux.conf
    extraConfig = (builtins.readFile ../config/tmux.conf);
  };
}
