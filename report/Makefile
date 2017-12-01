FILES = mobile normal

all: mobile.tex normal.tex main.tex
	texfot pdflatex mobile
	texfot pdflatex normal

all2: mobile.tex normal.tex main.tex
	texfot pdflatex mobile
	texfot pdflatex normal
	biber mobile
	biber normal
	texfot pdflatex mobile
	texfot pdflatex normal
	texfot pdflatex mobile
	texfot pdflatex normal
clean:
	-rm  -rf *.aux *.log *.out *.fdb_latexmk *.fls *.toc *.tdo *.bcf *.blg *.bcf *.bbl *.run.xml mobile.pdf normal.pdf
