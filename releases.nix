let
  version = "1.14.8b";
in
{
  inherit version;

  sources = {
    x86_64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-x86_64.tar.xz";
      sha256 = "sha256:34c6871b5b0d029baaa5e7bcdd1aee75afb4568541ff44fc643207f32094c7af";
    };

    aarch64-linux = {
      url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen.linux-aarch64.tar.xz";
      sha256 = "sha256:9cc148efbdfaf2bc0e3a4d855b968488c42f0e2c475ae365253d90addc35759b";
    };
  };
}
