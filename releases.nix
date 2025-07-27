let
  version = "1.14.9b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:3d5264cd45d41c074eb7c929fbc2a8eeae4f3beeef765ae8b3628c7a2b4423a1";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:0ecac75f36e41934b1f204e50bb3c03f9e6e9370b8942bf82e5c983886989c92";
    };
  };
}
