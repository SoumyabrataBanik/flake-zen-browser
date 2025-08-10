let
  version = "1.14.11b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:b2dc6e3c7c4e1f7f28628a9d7c51f21ef10013fe11152c87171a9cd5f9ee6778";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:70a1ec0a4f11c20d9be006a203d1dfe642de776e9b67f18508ebdddd18d16833";
    };
  };
}
