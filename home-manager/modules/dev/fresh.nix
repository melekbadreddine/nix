{ pkgs, fresh, ... }: {
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage {
      pname = "fresh";
      version = "0.1.98";
      src = fresh;

      cargoHash = "sha256-QpRS1192xv+dizrlg/LTeiuLtilQev5LbkgsHNel9uc=";

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
