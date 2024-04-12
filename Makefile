TEX = pdflatex
TEXFLAGS = -interaction=nonstopmode -halt-on-error

all: srs.pdf

srs.pdf: srs.tex
	$(TEX) $(TEXFLAGS) $<
	$(TEX) $(TEXFLAGS) $<

clean:
	rm -f *.aux *.log *.out *.toc *.pdf
