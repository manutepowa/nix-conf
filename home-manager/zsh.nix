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
	  plugins = [
	      {
		name = "zsh-nix-shell";
		file = "nix-shell.plugin.zsh";
		src = pkgs.fetchFromGitHub {
		  owner = "chisui";
		  repo = "zsh-nix-shell";
		  rev = "v0.7.0";
		  sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
		};
	      }
    ];
	};
}
