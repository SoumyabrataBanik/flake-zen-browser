let
  version = "1.15b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:56e192b134cf31f3097ac001221d960d10f720ee94c499acb6a2260a5ee24731";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:fedb185652b794b0e3ba1277864961c1288478edbe838780b48f70e930e33c9b";
    };
  };
}
