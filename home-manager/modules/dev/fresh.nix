{ pkgs, fresh, ... }: {
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage {
      pname = "fresh";
      version = "0.1.90";
      src = fresh;

      cargoHash = "sha256-tHuesoVUZ5OC9R662T4q0W8deXM/Gzvl0WEpHIltBOM=";

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
