let
  version = "1.15.3b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:ec978be61aadfce5ac5a1a29226cfdfefc3e6d622de7fdcb80db1722b1a9ae5c";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:2d9733fffd5afc0d67d53289c67b842e395488dd0ee6570abfedbafb2f5ab3a6";
    };
  };
}
