let
  version = "1.15.2b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:d035d4585d5d2811b1850b2e95af5e4ee0c30df6911c560fe5b52408a0110402";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:01c35497d34245faa59a9a0dc06344624c47c3118c00be69b5f2902296f282ef";
    };
  };
}
