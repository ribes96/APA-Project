FILES = mobile normal
all: mobile.tex normal.tex main.tex
	texfot pdflatex $(FILES)
	biber $(FILES)
	texfot pdflatex $(FILES)
	texfot pdflatex $(FILES)
clean:
	-rm  -rf *.aux *.log *.out *.fdb_latexmk *.fls *.toc *.bcf *.blg *.bcf *.bbl *.run.xml mobile.pdf normal.pdf
