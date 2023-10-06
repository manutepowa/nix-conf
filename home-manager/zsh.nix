{ config, lib, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		enableAutosuggestions = true;
		enableCompletion = true;
		# syntaxHighlighting = {
		# 	enable = true;
		# };
		shellAliases = {
			ll = "ls -l";
			nxu = "home-manager switch --flake ~/nix-conf/#manuel@VM";
		};
		oh-my-zsh = {
			enable = true;
			plugins = [
				"git"
				"z"
				"npm"
				"docker"
			];
			theme = "robbyrussell";
		};
		initExtra = ''
			source /home/manuel/nix-conf/config/zsh/.zshrc
			source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
		'';
	};
}
