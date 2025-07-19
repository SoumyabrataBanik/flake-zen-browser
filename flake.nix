{
    description = "A flake for packaging Zen-Browser";

    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    outputs = { self, nixpkgs }: 
        let
            supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

            releaseInfo = import ./releases.nix;
            
            forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
        in
    {
            packages = forAllSystems (system:
                let
                    pkgs = nixpkgs.legacyPackages.${system};
                    platformData = releaseInfo.sources.${system} or null;
                in

                if platformData != null then {
                    zen-browser = pkgs.callPackage ./zen-browser.nix {
                        inherit (pkgs) autoPatchelfHook wrapGAppsHook;
                        version = rleaseInfo.version;
                        src = pkgs.fetchurl {
                            url = platformData.url;
                            sha256 = platformData.sha256;
                        };
                    };
                } else ({ })
            );

            defaultPackage = forAllSystems (system: 
                self.packages.${system}.zen-browser or null
            );
    };
}
