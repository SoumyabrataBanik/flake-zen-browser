let
  version = "1.15.4b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:8d8f5e4bf9df9ce10e5c3f57369c54c9fe8ea070017139d8edec0334699a081e";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:0e1308ac713c44d3eca34b13d68f9d34d8d541a4b5b62496cc6c09e1646cdc56";
    };
  };
}
