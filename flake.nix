{
	description = "ZaneyOS";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
	};

	outputs = { nixpkgs, home-manager, ... }@inputs:
		let
			username = "nasrk";

			mkNixosConfig = host: modules_list: nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs;
					inherit username;
					inherit host;
				};
				modules = modules_list;
		};
		in
		{
			nixosConfigurations = {
				yoyo = mkNixosConfig "yoyo" [
					./hosts/yoyo
					./modules/core
				];
			};
		};
}
