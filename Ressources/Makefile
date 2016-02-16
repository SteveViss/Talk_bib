md=./exemple.md
pdf=./exemple.pdf
refs=/Users/kcazelles/Documents/Writings/Articles/library.bib
csl=/Users/kcazelles/Documents/Writings/Articles/styles/theoretical-ecology.csl
temp=/Users/kcazelles/Documents/Writings/Articles/styles/default.tex
pflags= --template=$(temp) --bibliography=$(refs) --csl=$(csl)  --latex-engine=pdflatex --number-sections


ALL: $(pdf)

$(pdf): $(md)
	pandoc $< -o $@ $(pflags)
