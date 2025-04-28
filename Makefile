out/${PAPER}.pdf: uoft-thesis.cls main.tex *.bib frontmatter/*.tex chapters/*.tex
	latexmk --pdf --outdir=out main.tex

clean:
	rm -rf out/
