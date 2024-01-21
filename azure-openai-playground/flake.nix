{
  description = "Azure OpenAI playground";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        python-packages = ps: with ps; [ jupyter ipython openai python-dotenv ];
      in {
        devShells.default = pkgs.mkShell {
          packages = [ (pkgs.python3.withPackages python-packages) ];
        };
      });
}
