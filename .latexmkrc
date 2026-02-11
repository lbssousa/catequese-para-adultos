# latexmk configuration file

# Use lualatex for compilation
$pdf_mode = 4;  # 4 = lualatex

# Compiler options
$lualatex = 'lualatex %O --shell-escape --synctex=1 --interaction=nonstopmode --file-line-error --halt-on-error %S';

# Enable continuous preview mode by default (optional, can be overridden with -pvc flag)
# $preview_continuous_mode = 1;

# PDF viewer (optional, uncomment and configure if needed)
# $pdf_previewer = 'start your-pdf-viewer';

# Clean up auxiliary files
$clean_ext = 'aux fdb_latexmk fls log synctex.gz gaux';

# Biber/BibTeX configuration (if needed)
$bibtex_use = 1.5;  # Use biber if .bcf file exists, otherwise bibtex

# Maximum number of compilation runs
$max_repeat = 5;

# File extensions to clean with latexmk -c
@default_files = ('main.tex');
