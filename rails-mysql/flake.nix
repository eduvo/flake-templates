{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    systems.url = "github:nix-systems/default";
    devenv.url = "github:cachix/devenv/v0.6.3";
  };

  nixConfig = {
    extra-trusted-public-keys =
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = { self, nixpkgs, devenv, systems, ... }@inputs:
    let forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in {
      devShells = forEachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = devenv.lib.mkShell {
            inherit inputs pkgs;
            modules = with pkgs; [{
              packages = [
                ruby_3_2
                zstd # required to native compile mysql2 gem
                libyaml # required to native compile psych gem
              ];

              services.redis.enable = true;
              services.mysql = {
                enable = true;
                package = mysql80;
                importTimeZones = true;
                settings = {
                  mysqld = {
                    character-set-server = "utf8mb4";
                    collation-server = "utf8mb4_unicode_ci";
                  };
                  mysql = {
                    default-character-set = "utf8mb4";
                    init-command =
                      "SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci";
                  };
                };
              };

              enterShell = ''
                # Set up bundler to install gems in the project directory
                bundle config --local path 'vendor/bundle'
              '';
            }];
          };
        });
    };
}
