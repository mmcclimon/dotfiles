#  -*- mode: perl -*-

$pdf_previewer = "open -a /Applications/Skim.app";
$clean_ext = "paux lox pdfsync out bbl";

# Use xelatex, which requires some other options
$pdflatex = "xelatex %O %S";
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;
