{ pkgs, fresh, ... }: {
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage {
      pname = "fresh";
      version = "0.1.83";
      src = fresh;

      cargoHash = "sha256-+tyGTI6/1AUzSQksQtgyVLjOyBj4jQXPLW4czPht3jA=";

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
