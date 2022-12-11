{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  shellHook = ''export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.lib.makeLibraryPath [
    pkgs.xorg.libX11
    pkgs.xorg.libXcursor
    pkgs.xorg.libXrandr
    pkgs.xorg.libXi
    pkgs.vulkan-loader
    pkgs.udev
    pkgs.alsaLib
  ]}"'';
  buildInputs = with pkgs; [
    mold
    clang
    pkgconfig
    udev
    alsaLib
  ];
}
