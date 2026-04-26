{
  description = "Miniprojeto de Semiologia Gregoriana";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          texlivePkg = pkgs.texliveMinimal.withPackages (ps: with ps; [
            abntex2
            babel-latin
            babel-portuges
            booktabs
            ebgaramond
            enumitem
            epstopdf-pkg
            fontspec
            geometry
            gregoriotex
            hyperref
            hyphen-latin
            hyphen-portuguese
            l3packages
            latex-bin
            latexindent
            latexmk
            luacolor
            luamplib
            luatexbase
            memoir
            metapost
            metre
            microtype
            natbib
            relsize
            setspace
            texcount
            tex-gyre
            textcase
            titling
            tools
            xcolor
            xetex
            xkeyval
            xpatch
            xstring
          ]);
          fontConf = pkgs.makeFontsConf {
            fontDirectories = [ pkgs.corefonts ];
          };
        in
        {
          default = pkgs.mkShell {
            packages = [ texlivePkg pkgs.corefonts ];
            shellHook = ''
              unset SOURCE_DATE_EPOCH
              export FONTCONFIG_FILE=${fontConf}
            '';
          };
        });
    };
}
