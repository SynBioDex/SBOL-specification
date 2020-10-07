
all: example_turtle.pdf example_rdfxml.pdf

%.pdf: %.*
	pygmentize -f html -O full $< | wkhtmltopdf -T 0 -B 0 --page-width 210mm --page-height 5000mm --no-background - - > .tmp.pdf
	pdfcrop .tmp.pdf $@
	rm -f .tmp.pdf

clean:
	rm -f *.pdf

.PHONY: clean all
