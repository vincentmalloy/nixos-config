{ lib, config, pkgs, inputs, ... }:

{
	
	home = {
		username = lib.mkDefault "simon";
		homeDirectory = lib.mkDefault "/home/${config.home.username}";
	};

	programs.git = {
		enable = true;
		userName = "Simon Lundius";
		userEmail = "25029432+vincentmalloy@users.noreply.github.com";
	};

	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		ohMyZsh = {
			enable = true;
			theme = "agnoster";
			plugins = [
				"git"
				"history"
				"wd"
			];
		};
	};

	programs.helix = {
		enable = true;
		defaultEditor = true;
		settings = {
			theme = "voyager";
			editor = {
				true-color=true;
				bufferline="multiple";
				cursorline=true;
				rulers=[120];
				cursor-shape = {
					insert = "bar";
					normal = "block";
					select = "underline";
				};
				indent-guides = {
					render = true;
				};
			};
		};
		themes = {
			voyager = {
				inherits = "molokai";
				"ui.background" = {};
			};
		};
	};

	programs.kitty = {
		enable = true;
		font = {
			name = "CommitMono Nerd Font";
			size = 11;
		};
		theme = "Monokai Soda";
		settings = {
			background_opacity = "0.5";
			background = "#000000";
		};
	};

	programs.firefox = {
    enable = true;

    # profiles.simon = {
    #     extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
    #         bypass-paywalls-clean
    #         darkreader
    #         facebook-container
    #         i-dont-care-about-cookies
    #         proton-pass
    #         to-google-translate
    #         view-image
    #         ublock-origin
    #         youtube-shorts-block
				# 		sponsor-block
    #     ];
    # };
  };

	gtk = {
		enable = true;
		gtk3.extraConfig = {
			settings = ''
				gtk-application-prefer-dark-theme = 1;
			'';
		};
		gtk4.extraConfig = {
			settings = ''
				gtk-application-prefer-dark-theme = 1;
			'';
		};
		
	};
	
	home.packages = with pkgs; [
		helix
	];
}
