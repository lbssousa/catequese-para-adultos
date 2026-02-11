# catequese-para-adultos
Material elaborado para a Catequese de Adultos na Paróquia São José de Salesópolis-SP

## Estrutura LaTeX

- O arquivo principal e `main.tex`.
- Os capitulos ficam em `chapters/`.
- Textos iniciais e finais ficam em `frontmatter/` e `backmatter/`.

## Como compilar

Com `latexmk`:

```
latexmk -pdf main.tex
```

Ou com `pdflatex`:

```
pdflatex main.tex
```
