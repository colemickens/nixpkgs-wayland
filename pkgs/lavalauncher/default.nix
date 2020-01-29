{ stdenv, fetchgit
, pkgconfig, scdoc
, wayland, wayland-protocols
, libxkbcommon, cairo
}:

let
  metadata = import ./metadata.nix;
in
stdenv.mkDerivation rec {
  name = "${pname}-${version}";
  pname = "lavalauncher";
  version = metadata.rev;

  src = fetchgit {
    url = metadata.repo_git;
    rev = metadata.rev;
    sha256 = metadata.sha256;
  };

  nativeBuildInputs = [ pkgconfig scdoc ];
  buildInputs = [
    wayland wayland-protocols
    libxkbcommon cairo
  ];

  installFlags = [
    "PREFIX=$(out)"
  ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    description = "A simple launcher for Wayland.";
    homepage    = "https://git.sr.ht/~leon_plickat/lavalauncher";
    license     = licenses.gpl3;
    platforms   = platforms.linux;
    maintainers = with maintainers; [];
  };
}
