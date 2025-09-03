let
  version = "1.15.3b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:8c1c22449dcd46dfa4a2dc079bda0cd8da1f7cd70b83a5b40a0b6d611d025528";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:1ddc34fecf2eb4cb747440cfc5f71558b46de3f679acaef3eca496c05a674566";
    };
  };
}
