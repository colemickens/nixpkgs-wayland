{ ... }:
{
  nixpkgs.overlays = [ (import ../.) ];
}
