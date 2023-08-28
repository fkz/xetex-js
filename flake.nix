{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

  outputs = {self, nixpkgs }: 
  let xetex = import ./xetex.nix nixpkgs.legacyPackages.x86_64-linux; in {
    packages.x86_64-linux.xetex = xetex;
    packages.x86_64-linux.default = xetex; 
  };
}
