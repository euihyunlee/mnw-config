{
    description = "Neovim Configurations";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

        flake-parts = {
            url = "github:hercules-ci/flake-parts";
            inputs.nixpkgs-lib.follows = "nixpkgs";
        };

        # Minimal Neovim Wrapper
        mnw.url = "github:Gerg-L/mnw";
    };

    outputs = {flake-parts, ...} @ inputs:
        flake-parts.lib.mkFlake {inherit inputs;} {
            systems = [
                "x86_64-linux"
                "x86_64-darwin"
                "aarch64-linux"
                "aarch64-darwin"
            ];

            perSystem = {pkgs, ...}: let
                neovim-wrapped = inputs.mnw.lib.wrap pkgs ./configuration.nix;
                neovim-wrapped-dev = neovim-wrapped.devMode;
            in {
                packages.dev = neovim-wrapped-dev;

                packages.default = neovim-wrapped;

                devShells.default = pkgs.mkShell {
                    name = "neovim-wrapped";
                    packages = [neovim-wrapped];
                };
            };
        };
}
