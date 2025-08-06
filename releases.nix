let
  version = "1.14.10b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:434c0af5d076154ab068b17469a36f36cfcde0a530121e980448942e62b07660";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:cb0dfb2c655f1cfa0dfc528d41f5c57cdba11a29a911f728aa71218835ae667a";
    };
  };
}
