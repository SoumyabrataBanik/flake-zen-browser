{
    description = "A flake for packaging Zen-Browser";

    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }: 
        let
            supportedSystems = [ "x86_64-linux" "aarch64-linux" ];
            
            forAllSystems = function: nixpkgs.lib.genAttrs supportedSystems (system: function system);
        in
    {
            packages = forAllSystems (system:
                let
                    pkgs = nixpkgs.legacyPackages.${system};
                in
                {
                    zen-browser = pkgs.callPackage ./zen-browser.nix {
                        inherit (pkgs) autoPatchelfHook wrapGAppsHook;
                    };
                }
            );

            defaultPackage = forAllSystems (system: self.packages.${system}.zen-browser);
    };
}
