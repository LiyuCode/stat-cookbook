DOC  := stat-cookbook.tex

RERUN := "(undefined references|Rerun to get (cross-references|the bars|point totals) right|Table widths have changed. Rerun LaTeX.|Linenumber reference failed)"
RERUNBIB := "No file.*\.bbl|Citation.*undefined"

all: figs doc

figs:
	@$(MAKE) -C $@

doc: $(DOC:.tex=.pdf)

%.pdf: %.tex
	xelatex $<
	@egrep -q $(RERUNBIB) $*.log && bibtex $* && xelatex $<; true
	@egrep -q $(RERUN) $*.log && xelatex $<; true
	@egrep -q $(RERUN) $*.log && xelatex $<; true

latexmk:
	-latexmk -pvc -pdf $(DOC)

purge:
	-rm -f *.{aux,dvi,log,bbl,blg,brf,fls,toc,thm,out,fdb_latexmk}

clean: purge
	$(MAKE) -C figs $@
	-rm -f $(DOC:.tex=.pdf)

.PHONY: all figs purge clean
