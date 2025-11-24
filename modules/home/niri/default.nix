{ pkgs , lib , config , ... }:
{
	home.file = {
		".config/niri" = {
			source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotties/modules/home/niri/config";
		};
	};
}
