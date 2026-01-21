{ pkgs, fresh, ... }: {
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage {
      pname = "fresh";
      version = "0.1.86";
      src = fresh;

      cargoHash = "sha256-I78sdf/p5TZZufMZF8rETRb91veklwNHHByHF1WbLgk=";

      nativeBuildInputs = [ 
        pkgs.pkg-config 
        pkgs.rustPlatform.bindgenHook
      ];

      buildInputs = [ 
        pkgs.llvmPackages.libclang 
      ];

      LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
      
      doCheck = false;
    })
  ];
}
