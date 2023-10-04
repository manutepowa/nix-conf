{ config, lib, pkgs, ... }:

{
	programs.zsh = {
	  enable = true;
	  enableAutosuggestions = true;
	  enableCompletion = true;
	  oh-my-zsh.enable = true;
	  shellAliases = {
	    ll = "ls -l";
	    nxu = "home-manager switch --flake ~/nix-standard/#manuel@VM";
	  };
	  dotDir = "./config/zsh";
	};
}
