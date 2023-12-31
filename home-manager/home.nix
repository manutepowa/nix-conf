# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./zsh.nix
    ./tmux.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
      (final: prev: {
        neovim = inputs.manutepowa-nvim.packages.${final.system}.default;
      })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "manuel";
    homeDirectory = "/home/manuel";
    packages = with pkgs; [
      btop
      git
      bat
      fzf
      flameshot
      neovim
      ripgrep
    ];
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  programs.kitty = {
    enable = true;
    font = {
      # Font - Laptop has size manually changed at home.nix
      name = "JetBrainsMono Nerd Font";
      #size = 8;
    };
    shellIntegration.enableZshIntegration = true;
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
  	enable = true;
    userName = "Manuel";
    userEmail = "manutepowa@gmail.com";
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.sessionVariables = {
  	EDITOR = "nvim";
    SHELL = pkgs.zsh;
    TERMINAL = pkgs.kitty;
    TERM = "kitty";
  };

  # programs.bash.enable = true;
  # programs.bash.shellAliases = {
  #   nxu = "home-manager switch --flake ~/nix-standard/#manuel@VM";
  # };

  # home.shellAliases = {
  #   nxu = "home-manager switch --flake ~/nix-standard/#manuel@VM";
  # };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
