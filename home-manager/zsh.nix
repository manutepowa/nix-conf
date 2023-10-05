{ config, lib, pkgs, ... }:

{
	programs.zsh = {
	  enable = true;
	  enableAutosuggestions = true;
	  enableCompletion = true;
	  shellAliases = {
	    ll = "ls -l";
	    nxu = "home-manager switch --flake ~/nix-conf/#manuel@VM";
	  };
	  oh-my-zsh = {
		enable = true;
		plugins = [ "git" "thefuck" ];
    	theme = "robbyrussell";
  	  };
	#   dotDir = "../config/zsh";
	};
}
