{
  stdenv,
  fetchurl,
  autoPatchelfHook,
  gvfs, libappindicator-gtk3, python3
}:

stdenv.mkDerivation {
  pname = "nutstore-kde";
  version = "0.0.1";

  src = fetchurl {
    url = "https://www.jianguoyun.com/static/exe/installer/nutstore_linux_dist_x64.tar.gz";
    sha256 = "sha256-FUbAC3n8vpZQx1iUv/SFWqNOk2NqpGb0O698zCkHazU=";
  };
  sourceRoot = ".";
  #passthru.scripts = [ "foo.py" "bar.lua" ];

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    gvfs
    libappindicator-gtk3
    python3
  ];

  #buildPhase = ''
  #  patchelf ?
  #'';

  installPhase = ''
    $out/bin/install_core.sh
  '';

}
