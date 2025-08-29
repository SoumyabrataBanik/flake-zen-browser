let
  version = "1.15.1b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:cbc2ff10003cc011fd9c926f221078545db6a038117fa322b1b2b7e6ace0ac1d";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:84c3f48781cf257a0287e288d08a077b1ff86af0cb15064bdb5026caa7b08270";
    };
  };
}
