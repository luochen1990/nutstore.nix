{
  description = "nutstore 坚果云客户端";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, }:
  let pkg = nixpkgs.legacyPackages.x86_64-linux.callPackage ./nutstore-kde.nix {};
  in {
    defaultPackage."x86_64-linux" = pkg;
    packages."x86_64-linux" = { nutstore-kde = pkg; };
    devShell."x86_64-linux" = pkg;
  };
}

