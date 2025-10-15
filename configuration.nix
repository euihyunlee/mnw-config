{
    lib,
    pkgs,
    ...
}: {
    appName = "mnw";

    neovim = pkgs.neovim-unwrapped;

    desktopEntry = false;

    luaFiles = [./init.lua];

    extraBinPath = with pkgs; [
        # Utilities
        fd
        ripgrep

        # C/C++
        clang-tools

        # Lua
        lua-language-server
        stylua

        # Nix
        alejandra
        nixd

        # Python
        ruff
        ty

        # TypeScript
        eslint
        prettier
        svelte-language-server
        typescript-language-server
        vscode-langservers-extracted
    ];

    plugins = {
        dev.config = {
            pure = let
                fs = lib.fileset;
            in
                fs.toSource {
                    root = ./.;
                    fileset = fs.unions [./lua];
                };
            impure = "~/.config/mnw";
        };

        start = with pkgs.vimPlugins; [
            lz-n
        ];

        opt = with pkgs.vimPlugins; [
            blink-cmp
            catppuccin-nvim
            conform-nvim
            friendly-snippets
            gitsigns-nvim
            lazydev-nvim
            lualine-nvim
            nvim-lint
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            nvim-web-devicons
            oil-nvim
            plenary-nvim
            telescope-fzf-native-nvim
            telescope-nvim
            which-key-nvim
        ];
    };
}
