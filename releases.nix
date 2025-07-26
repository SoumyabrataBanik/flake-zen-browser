let
  version = "1.14.7b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:9ec98f3925f045c9f2776ab57d2639a193e1acd0cb9e1692747786f9a815a98d";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:23c084b8a7d05bd6adb87c81f79a1b1d3929025c49b87729024f3b6bfbbd98df";
    };
  };
}
